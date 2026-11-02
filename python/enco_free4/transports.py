"""Windows RFCOMM (stdlib) and BLE GATT (optional Bleak) transports."""
from __future__ import annotations

import asyncio
from collections.abc import Callable
import ctypes
import os
import select
import socket

from .protocol import make_windows_rfcomm_address

GENERIC_SPP_UUID = "00001107-d102-11e1-9b23-00025b00a5a5"
# Free4's packaged WhitelistConfigDTO.uuid overrides the generic RFCOMM UUID.
SPP_UUID = "0000079a-d102-11e1-9b23-00025b00a5a5"
GATT_SERVICE = "0000079a-d102-11e1-9b23-00025b00a5a5"
GATT_WRITE = "0100079a-d102-11e1-9b23-00025b00a5a5"
GATT_NOTIFY = "0200079a-d102-11e1-9b23-00025b00a5a5"

Receive = Callable[[bytes], None]
Failed = Callable[[Exception], None]


class WindowsRfcommTransport:
    """Uses the paired device's classic MAC and the APK's custom service UUID.

    A channel of zero requests Windows SDP resolution. No serial COM port is
    required. The service must actually be exposed by the earbud firmware.
    """
    def __init__(self, address: str, *, service_uuid: str = SPP_UUID,
                 channel: int = 0, timeout: float = 30) -> None:
        self.address_bytes = make_windows_rfcomm_address(address, service_uuid, channel)
        self.timeout = timeout
        self.socket: socket.socket | None = None
        self.reader: asyncio.Task | None = None
        self.closed = True

    def _connect(self) -> None:
        sock = self.socket
        assert sock is not None
        dll = ctypes.WinDLL("Ws2_32.dll")
        connect = dll.connect
        connect.argtypes = [ctypes.c_size_t, ctypes.c_void_p, ctypes.c_int]
        connect.restype = ctypes.c_int
        dll.WSAGetLastError.restype = ctypes.c_int
        data = ctypes.create_string_buffer(self.address_bytes)
        sock.setblocking(False)
        rc = connect(sock.fileno(), ctypes.byref(data), len(self.address_bytes))
        if rc != 0:
            error = dll.WSAGetLastError()
            if error not in (10035, 10036, 10037):
                raise OSError(error, f"Bluetooth connect failed (Winsock {error})")
            _, ready, failed = select.select([], [sock], [sock], self.timeout)
            if not ready and not failed:
                raise TimeoutError("Bluetooth service connection timed out")
            error = sock.getsockopt(socket.SOL_SOCKET, socket.SO_ERROR)
            if error:
                raise OSError(error, f"Bluetooth connect failed (Winsock {error})")
        sock.settimeout(1.0)

    async def connect(self, receive: Receive, failed: Failed) -> None:
        if os.name != "nt":
            raise OSError("WindowsRfcommTransport requires Windows")
        if self.socket is not None:
            raise RuntimeError("transport already connected")
        self.socket = socket.socket(32, socket.SOCK_STREAM, 3)  # AF_BTH, BTHPROTO_RFCOMM
        try:
            await asyncio.to_thread(self._connect)
        except BaseException:
            self.socket.close()
            self.socket = None
            raise
        self.closed = False

        async def read_loop() -> None:
            try:
                while not self.closed:
                    try:
                        data = await asyncio.to_thread(self.socket.recv, 65536)
                    except socket.timeout:
                        continue
                    if not data:
                        raise ConnectionError("earbuds closed the RFCOMM stream")
                    receive(data)
            except asyncio.CancelledError:
                raise
            except Exception as exc:
                if not self.closed:
                    failed(exc)
        self.reader = asyncio.create_task(read_loop())

    async def write(self, data: bytes) -> None:
        if self.closed or self.socket is None:
            raise ConnectionError("RFCOMM transport is closed")
        await asyncio.to_thread(self.socket.sendall, data)

    async def close(self) -> None:
        self.closed = True
        if self.socket is not None:
            try:
                self.socket.shutdown(socket.SHUT_RDWR)
            except OSError:
                pass
            self.socket.close()
        if self.reader:
            self.reader.cancel()
            await asyncio.gather(self.reader, return_exceptions=True)
        self.socket = None
        self.reader = None


class BleakTransport:
    def __init__(self, address: str, *, service_uuid: str = GATT_SERVICE,
                 write_uuid: str = GATT_WRITE, notify_uuid: str = GATT_NOTIFY,
                 pair: bool = False, timeout: float = 30,
                 write_chunk_size: int = 20) -> None:
        if not 1 <= write_chunk_size <= 512:
            raise ValueError("write_chunk_size must be 1..512")
        self.address, self.service_uuid = address, service_uuid
        self.write_uuid, self.notify_uuid = write_uuid, notify_uuid
        self.pair, self.timeout = pair, timeout
        self.chunk_size = write_chunk_size
        self.client = None
        self.characteristic = None
        self.closed = True

    async def connect(self, receive: Receive, failed: Failed) -> None:
        from bleak import BleakClient, BleakScanner
        device = await BleakScanner.find_device_by_address(self.address, timeout=self.timeout)
        if device is None:
            raise ConnectionError("BLE address not found; use scan, keep the earbuds awake")
        loop = asyncio.get_running_loop()

        def disconnected(_client) -> None:
            if not self.closed:
                loop.call_soon_threadsafe(failed, ConnectionError("BLE disconnected"))
        self.client = BleakClient(device, disconnected_callback=disconnected,
                                  timeout=self.timeout, pair=self.pair)
        try:
            await self.client.connect()
            service = self.client.services.get_service(self.service_uuid)
            if service is None:
                raise ConnectionError(f"configuration service missing: {self.service_uuid}")
            self.characteristic = service.get_characteristic(self.write_uuid)
            notify = service.get_characteristic(self.notify_uuid)
            if self.characteristic is None or notify is None:
                raise ConnectionError("configuration write/notify characteristic missing")
            if "write" not in self.characteristic.properties:
                raise ConnectionError("characteristic lacks write-with-response support")
            self.closed = False
            await self.client.start_notify(notify, lambda _sender, data: receive(bytes(data)))
        except BaseException:
            await self.close()
            raise

    async def write(self, data: bytes) -> None:
        if self.closed or self.client is None:
            raise ConnectionError("BLE transport is closed")
        for i in range(0, len(data), self.chunk_size):
            await self.client.write_gatt_char(self.characteristic,
                                             data[i:i+self.chunk_size], response=True)

    async def close(self) -> None:
        self.closed = True
        if self.client:
            await self.client.disconnect()
        self.client = None
        self.characteristic = None


async def scan_ble(timeout: float = 10) -> list[dict]:
    from bleak import BleakScanner
    devices = await BleakScanner.discover(timeout=timeout, return_adv=True)
    return [{"address": d.address, "name": d.name or ad.local_name,
             "rssi": ad.rssi, "service_uuids": ad.service_uuids,
             "manufacturer_data": {str(k): v.hex() for k, v in ad.manufacturer_data.items()}}
            for d, ad in devices.values()]


async def inspect_gatt(address: str, pair: bool = False, timeout: float = 30) -> list[dict]:
    from bleak import BleakClient, BleakScanner
    device = await BleakScanner.find_device_by_address(address, timeout=timeout)
    if device is None:
        raise ConnectionError("BLE address not found")
    async with BleakClient(device, pair=pair, timeout=timeout) as client:
        return [{"uuid": s.uuid,
                 "characteristics": [{"uuid": c.uuid, "handle": c.handle,
                                       "properties": list(c.properties)} for c in s.characteristics]}
                for s in client.services]
