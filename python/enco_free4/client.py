"""Async command API. Method names are our facade; wire fields follow APK evidence."""
from __future__ import annotations

import asyncio
from dataclasses import dataclass, replace
import math
import struct
import time
from typing import Any

from .protocol import FrameStream, Packet, ProtocolError, encode_frames
from .capabilities import decode_capabilities
from .models import DEFAULT_FEATURES, Feature, KeyBinding, NoiseMode, byte_ids
from .equalizer import Equalizer, parse_equalizers


class UnsupportedFeature(RuntimeError):
    pass


class DeviceRejected(RuntimeError):
    def __init__(self, command: int, status: int) -> None:
        self.command, self.status = command, status
        super().__init__(f"device rejected 0x{command:04X}: status=0x{status:02X}")


class ReadbackMismatch(RuntimeError):
    pass


@dataclass(frozen=True)
class WriteResult:
    command: int
    sequence: int
    acknowledged: bool
    verified: bool
    readback: Any = None


def checked_payload(packet: Packet) -> bytes:
    if not packet.payload:
        raise ProtocolError(f"0x{packet.command:04X} reply has no status")
    if packet.payload[0] != 0:
        raise DeviceRejected(packet.command, packet.payload[0])
    return packet.payload[1:]


class HeadsetClient:
    """One connection, serialized requests, matched (reply opcode, sequence).

    No automatic retries of writes: a timeout may occur after the device applied
    the change. Reconnect/read current state before deciding whether to retry.
    """
    def __init__(self, transport, *, timeout: float = 5, max_frame_size: int = 660,
                 trace=None, profile=None, verify_timeout: float = 3,
                 verify_interval: float = 0.2) -> None:
        if not math.isfinite(verify_timeout) or verify_timeout < 0:
            raise ValueError("verify_timeout must be finite and >= 0")
        if not math.isfinite(verify_interval) or verify_interval <= 0:
            raise ValueError("verify_interval must be finite and > 0")
        self.transport = transport
        self.timeout, self.max_frame_size = timeout, max_frame_size
        self.verify_timeout, self.verify_interval = verify_timeout, verify_interval
        self.stream = FrameStream()
        self.sequence = 0
        self.connected = False
        self.failure: Exception | None = None
        self.pending: dict[tuple[int, int], asyncio.Future] = {}
        self.events: asyncio.Queue[Packet] = asyncio.Queue(maxsize=128)
        self.request_lock = asyncio.Lock()
        self.write_lock = asyncio.Lock()
        self.operation_lock = asyncio.Lock()
        self.capabilities: set[int] | None = None
        self.background: set[asyncio.Task] = set()
        self.trace = trace
        self.profile = profile

    async def __aenter__(self):
        await self.connect()
        return self

    async def __aexit__(self, *_args):
        await self.close()

    async def connect(self) -> None:
        if self.connected:
            raise RuntimeError("client is already connected")
        self.stream.reset()
        self.sequence, self.failure, self.capabilities = 0, None, None
        self.events = asyncio.Queue(maxsize=128)
        try:
            await self.transport.connect(self._receive, self._failed)
            self.connected = True
        except BaseException:
            await self.transport.close()
            raise

    async def close(self) -> None:
        self.connected = False
        self._failed(ConnectionError("connection closed"))
        await self.transport.close()
        tasks = tuple(self.background)
        for task in tasks:
            task.cancel()
        if tasks:
            await asyncio.gather(*tasks, return_exceptions=True)
        self.background.clear()
        self.capabilities = None

    def _failed(self, error: Exception) -> None:
        self.failure = error
        for future in self.pending.values():
            if not future.done():
                future.set_exception(error)

    def _receive(self, data: bytes) -> None:
        try:
            if self.trace:
                self.trace("rx", data)
            for packet in self.stream.feed(data):
                key = (packet.command, packet.sequence)
                future = self.pending.get(key)
                if future is not None and not future.done():
                    future.set_result(packet)
                else:
                    if packet.command in (0x0500, 0x051C):
                        # Observed headset -> host requests in HeadsetCoreService.m0.
                        # Default UTC response has no optional timezone extension.
                        payload = (b"\0" + struct.pack("<I", int(time.time()) & 0xFFFFFFFF)
                                   if packet.command == 0x0500 else b"\0\0\0")
                        task = asyncio.create_task(self._write_packet(
                            Packet(packet.command | 0x8000, packet.sequence, payload)))
                        self.background.add(task)
                        def completed(done):
                            self.background.discard(done)
                            if not done.cancelled() and done.exception() is not None:
                                self._failed(done.exception())
                        task.add_done_callback(completed)
                    if self.events.full():
                        self.events.get_nowait()
                    self.events.put_nowait(packet)
        except Exception as exc:
            self._failed(exc)

    async def _write_packet(self, packet: Packet) -> None:
        async with self.write_lock:
            for frame in encode_frames(packet, self.max_frame_size):
                if self.trace:
                    self.trace("tx", frame)
                await self.transport.write(frame)

    async def request(self, command: int, payload: bytes = b"", *,
                      timeout: float | None = None, check_supported: bool = True) -> Packet:
        """Low-level request; returns raw payload including device status.

        An ATT write response only acknowledges transport. This method waits
        separately for the application reply with the same sequence number.
        """
        if not 0 <= command < 0x8000:
            raise ValueError("request opcode must be below 0x8000")
        async with self.request_lock:
            if not self.connected:
                raise ConnectionError("connect first")
            if self.failure:
                raise self.failure
            if check_supported and self.capabilities is not None and command not in self.capabilities:
                raise UnsupportedFeature(f"device did not advertise command 0x{command:04X}")
            seq = self.sequence
            self.sequence = (seq + 1) & 255
            key = (command | 0x8000, seq)
            future = asyncio.get_running_loop().create_future()
            self.pending[key] = future
            try:
                async with asyncio.timeout(self.timeout if timeout is None else timeout):
                    await self._write_packet(Packet(command, seq, bytes(payload)))
                    return await future
            finally:
                self.pending.pop(key, None)
                if not future.done():
                    future.cancel()
                elif not future.cancelled():
                    future.exception()  # consume a simultaneous disconnect error

    def _require_initialized(self, *commands: int) -> None:
        if self.capabilities is None:
            raise RuntimeError("call initialize() before changing a setting")
        for command in commands:
            if command not in self.capabilities:
                raise UnsupportedFeature(f"device did not advertise command 0x{command:04X}")

    async def initialize(self, *, subscribe: bool = False) -> dict:
        """Discover commands from the device, with an APK-derived 69-bit table.

        Ordinary notifications are optional. The default uses explicit reads,
        so it does not subscribe to diagnostic/history events needing host ACKs.
        No capability bitmap is fabricated from a product/model name.
        """
        bitmap = checked_payload(await self.request(0x0100, check_supported=False))
        if not bitmap:
            raise ProtocolError("empty remote capability bitmap")
        self.capabilities = decode_capabilities(bitmap)
        events: list[int] = []
        if subscribe:
            # Notification discovery/individual registration are a separate
            # protocol family; the APK does not gate 0200/0201 on the 0100 map.
            data = checked_payload(await self.request(0x0200, check_supported=False))
            if not data or len(data) != data[0] + 1:
                raise ProtocolError("invalid notification capability count")
            events = sorted(set(data[1:]) & {1, 2, 3, 5, 6, 17})
            if events and 0x0205 in self.capabilities:
                checked_payload(await self.request(0x0205, bytes([len(events), *events])))
            elif events:
                for event in events:
                    checked_payload(await self.request(0x0201, bytes([event]), check_supported=False))
            else:
                events = []
        return {"bitmap_hex": bitmap.hex(),
                "commands": [f"0x{x:04X}" for x in sorted(self.capabilities)],
                "subscribed_events": events,
                "unknown_capability_bits": [i for i in range(69, len(bitmap)*8)
                                            if bitmap[i//8] & (1 << (i%8))]}

    async def next_event(self, timeout: float | None = None) -> Packet:
        """Return an unmatched incoming packet; 0x0204 starts with eventId."""
        if timeout is None:
            return await self.events.get()
        return await asyncio.wait_for(self.events.get(), timeout)

    async def get_features(self, feature_ids=None) -> dict[int, int]:
        """Query an explicit list: wire payload is [count, feature IDs...].

        A returned ID alone is not a model-support declaration. Keep unknown
        states numeric and confirm optional switches against the model profile.
        """
        if feature_ids is None:
            feature_ids = self.profile.feature_ids if self.profile is not None else DEFAULT_FEATURES
        ids = byte_ids(feature_ids, label="feature_ids")
        data = checked_payload(await self.request(0x010D, bytes([len(ids), *ids])))
        if not data or len(data) != 1 + data[0] * 2:
            raise ProtocolError("invalid feature switch count")
        result = {data[i]: data[i+1] for i in range(1, len(data), 2)}
        if len(result) != data[0]:
            raise ProtocolError("duplicate feature switch id")
        return result

    async def set_feature(self, feature_id: int, enabled: bool) -> WriteResult:
        """Write once, then poll until the acknowledged feature takes effect.

        Some firmware acknowledges 0403 while 010D still returns the old state.
        verify_timeout bounds the polling window; each query also has its normal
        request timeout. Zero selects a single immediate readback.
        """
        self._require_initialized(0x0403, 0x010D)
        if type(enabled) is not bool or not 0 <= feature_id <= 255:
            raise ValueError("feature_id must be uint8 and enabled must be bool")
        if self.profile is not None and feature_id not in self.profile.feature_ids:
            raise UnsupportedFeature(f"feature {feature_id} absent from selected model profile")
        async with self.operation_lock:
            before = await self.get_features([feature_id])
            if before.get(feature_id) not in (0, 1):
                raise UnsupportedFeature(f"device did not expose a boolean state for feature {feature_id}")
            reply = await self.request(0x0403, bytes([feature_id, int(enabled)]))
            checked_payload(reply)
            started = time.monotonic()
            deadline = started + self.verify_timeout
            reads = 0
            while True:
                after = await self.get_features([feature_id])
                reads += 1
                if after.get(feature_id) == int(enabled):
                    return WriteResult(0x0403, reply.sequence, True, True, after)
                remaining = deadline - time.monotonic()
                if remaining <= 0:
                    elapsed = time.monotonic() - started
                    raise ReadbackMismatch(
                        f"feature {feature_id}: expected {int(enabled)}, got {after.get(feature_id)} "
                        f"after {elapsed:.2f}s ({reads} readbacks, before={before[feature_id]})")
                # Retry the query only. A second write could restart the pending
                # firmware change and must not be used to repair stale readback.
                await asyncio.sleep(min(self.verify_interval, remaining))

    async def set_multipoint(self, enabled: bool) -> WriteResult:
        return await self.set_feature(Feature.MULTIPOINT, enabled)

    async def set_game_mode(self, enabled: bool) -> WriteResult:
        return await self.set_feature(Feature.GAME_MODE, enabled)

    async def set_high_quality_audio(self, enabled: bool) -> WriteResult:
        return await self.set_feature(Feature.HIGH_QUALITY_AUDIO, enabled)

    async def set_spatial_audio(self, enabled: bool) -> WriteResult:
        """Legacy boolean switch; use spatial type on firmware exposing 012A/0422."""
        return await self.set_feature(Feature.SPATIAL_AUDIO, enabled)

    async def set_bass_engine(self, enabled: bool) -> WriteResult:
        return await self.set_feature(Feature.BASS_ENGINE, enabled)

    async def get_noise_raw(self) -> dict:
        data = checked_payload(await self.request(0x010C, b"\x01\x01"))
        if len(data) < 3 or data[0] != 1:
            raise ProtocolError("expected current noise [action=1,type,value...]")
        return {"action": data[0], "type": data[1], "data_hex": data[2:].hex(),
                "raw_hex": data.hex()}

    async def get_noise_support_raw(self) -> bytes:
        """Observed support-list query [action=2,type=1]; retain undecoded data."""
        return checked_payload(await self.request(0x010C, b"\x02\x01"))

    async def set_noise_raw(self, noise_type: int, data: bytes) -> WriteResult:
        """Advanced API: caller supplies a verified type/mask or type/level.

        CurrentNoiseModeInfo.getData encodes [action=1,type,data...]. Only types
        1/5 (bitmask) and 2 (one-byte level) are serialized by that APK method.
        """
        self._require_initialized(0x0404, 0x010C)
        if noise_type not in (1, 2, 5) or not data or (noise_type == 2 and len(data) != 1):
            raise ValueError("expected type 1/5 mask bytes, or type 2 and one level byte")
        async with self.operation_lock:
            reply = await self.request(0x0404, bytes([1, noise_type]) + bytes(data))
            checked_payload(reply)
            after = await self.get_noise_raw()
            if after["type"] != noise_type or after["data_hex"] != data.hex():
                raise ReadbackMismatch(f"noise readback differs: {after}")
            return WriteResult(0x0404, reply.sequence, True, True, after)

    async def set_noise_mode(self, mode: NoiseMode | int) -> WriteResult:
        """Free4 mode indices verified against its packaged whitelist and UI.

        Selecting a parent mode may restore its previous submode. Parent readback
        therefore verifies the mode family; a specific submode requires its bit.
        """
        self._require_initialized(0x0404, 0x010C)
        mode = NoiseMode(mode)
        if self.profile is not None and int(mode) not in self.profile.noise_indices:
            raise UnsupportedFeature("noise mode absent from selected model profile")
        value = (1 << int(mode)).to_bytes(int(mode) // 8 + 1, "little")
        families = {0: {0, 3}, 1: {1, 4, 5, 6, 7}, 2: {2, 8}}
        async with self.operation_lock:
            reply = await self.request(0x0404, b"\x01\x01" + value)
            checked_payload(reply)
            after = await self.get_noise_raw()
            mask = int.from_bytes(bytes.fromhex(after["data_hex"]), "little")
            active = {index for index in range(mask.bit_length()) if mask & (1 << index)}
            allowed = families.get(int(mode), {int(mode)})
            if after["type"] not in (1, 5) or not active or not active <= allowed:
                raise ReadbackMismatch(f"noise mode {mode.name}: received {after}")
            return WriteResult(0x0404, reply.sequence, True, True,
                               {**after, "active_indices": sorted(active),
                                "verification": "family" if int(mode) in families else "exact_mode"})

    async def get_eq_mode(self) -> int:
        data = checked_payload(await self.request(0x010F))
        if len(data) != 1:
            raise ProtocolError("expected one EQ mode byte")
        return data[0]

    async def get_equalizers(self) -> list[Equalizer]:
        data = checked_payload(await self.request(0x0122))
        return parse_equalizers(data)

    async def update_equalizer(self, eq_id: int, gains, *, name: str | None = None) -> WriteResult:
        """Update and select an existing custom EQ using action=2.

        Retain the descriptor's frequencies, ID and limits. Numeric gain units
        are the device's raw values; no unverified scale conversion is applied.
        """
        self._require_initialized(0x0418, 0x0122)
        if self.profile is not None and not self.profile.raw["function"].get("customEqualizer"):
            raise UnsupportedFeature("custom EQ absent from selected profile")
        async with self.operation_lock:
            before = await self.get_equalizers()
            current = next((entry for entry in before if entry.eq_id == eq_id), None)
            if current is None:
                raise UnsupportedFeature("EQ ID was not returned by the device")
            updated = replace(current, gains=tuple(gains), name=current.name if name is None else name)
            payload = updated.encode_setting(action=2)
            reply = await self.request(0x0418, payload)
            checked_payload(reply)
            after = await self.get_equalizers()
            actual = next((entry for entry in after if entry.eq_id == eq_id), None)
            if (actual is None or actual.gains != updated.gains or actual.name != updated.name
                    or actual.frequencies != updated.frequencies or actual.selected != 1):
                raise ReadbackMismatch(f"EQ descriptor/readback differs: {actual}")
            return WriteResult(0x0418, reply.sequence, True, True, actual)

    async def set_eq_mode(self, mode_id: int, *, firmware_version: int | None = None) -> WriteResult:
        """Select a mode from this model's profile; names are not universal."""
        self._require_initialized(0x0406, 0x010F)
        if not 0 <= mode_id <= 255:
            raise ValueError("mode_id must fit uint8")
        if self.profile is not None and mode_id not in {
                entry["protocolIndex"] for entry in self.profile.eq_options(firmware_version)}:
            raise UnsupportedFeature("EQ preset absent or its firmware gate is unknown")
        async with self.operation_lock:
            reply = await self.request(0x0406, bytes([mode_id]))
            checked_payload(reply)
            after = await self.get_eq_mode()
            if after != mode_id:
                raise ReadbackMismatch(f"EQ mode: expected {mode_id}, got {after}")
            return WriteResult(0x0406, reply.sequence, True, True, after)

    async def get_spatial_type(self) -> int:
        data = checked_payload(await self.request(0x012A))
        if len(data) != 1:
            raise ProtocolError("expected one spatial type byte")
        return data[0]

    async def set_spatial_type(self, type_id: int) -> WriteResult:
        self._require_initialized(0x0422, 0x012A)
        if not 0 <= type_id <= 255:
            raise ValueError("type_id must fit uint8")
        if self.profile is not None and type_id not in self.profile.raw["function"].get("spatialTypes", []):
            raise UnsupportedFeature("spatial type absent from selected model profile")
        async with self.operation_lock:
            reply = await self.request(0x0422, bytes([type_id]))
            checked_payload(reply)
            after = await self.get_spatial_type()
            if after != type_id:
                raise ReadbackMismatch(f"spatial type: expected {type_id}, got {after}")
            return WriteResult(0x0422, reply.sequence, True, True, after)

    async def get_key_bindings(self, device_types=(3, 1)) -> list[KeyBinding]:
        types = byte_ids(device_types, label="device_types")
        data = checked_payload(await self.request(0x0108, bytes([len(types), *types])))
        if not data or len(data) != 1 + 4 * data[0]:
            raise ProtocolError("invalid key binding count")
        return [KeyBinding(*data[i:i+4]) for i in range(1, len(data), 4)]

    async def set_key_bindings(self, bindings: list[KeyBinding]) -> WriteResult:
        """Change existing records using ordinary setting command 0401.

        0416 belongs to the APK tutorial. Read existing records and preserve
        their device_type/button/action fields; the model limits valid functions.
        """
        self._require_initialized(0x0401, 0x0108)
        if not 1 <= len(bindings) <= 255:
            raise ValueError("expected 1..255 bindings")
        records = [binding.encode() for binding in bindings]
        identities = [record[:3] for record in records]
        if len(set(identities)) != len(identities):
            raise ValueError("duplicate key identities")
        types = tuple(dict.fromkeys(binding.device_type for binding in bindings))
        async with self.operation_lock:
            before = await self.get_key_bindings(types)
            existing = {binding.encode()[:3] for binding in before}
            if not set(identities) <= existing:
                raise UnsupportedFeature("requested key identity was not returned by the device")
            reply = await self.request(0x0401, bytes([len(records)]) + b"".join(records))
            checked_payload(reply)
            after = await self.get_key_bindings(types)
            actual = {binding.encode()[:3]: binding.function for binding in after}
            if any(actual.get(record[:3]) != record[3] for record in records):
                raise ReadbackMismatch(f"key bindings differ: {after}")
            return WriteResult(0x0401, reply.sequence, True, True, after)

    async def set_find_mode(self, enabled: bool) -> WriteResult:
        """Enter/exit FindMode as used by the APK's PlayToneStateMachine.

        No per-ear selector is present. Success is an application ACK, not an
        independent observation that a tone sounded. Remove earbuds first.
        """
        self._require_initialized(0x0400)
        if type(enabled) is not bool:
            raise ValueError("enabled must be bool")
        async with self.operation_lock:
            reply = await self.request(0x0400, bytes([int(enabled)]))
            checked_payload(reply)
            return WriteResult(0x0400, reply.sequence, True, False)

    async def find_for(self, seconds: float = 5) -> WriteResult:
        """Enter find mode, then explicitly exit while the connection is open."""
        if not 0 < seconds <= 30:
            raise ValueError("seconds must be > 0 and <= 30")
        try:
            await self.set_find_mode(True)
            await asyncio.sleep(seconds)
        finally:
            # Attempt stop even if the start ACK timed out after application.
            stopped = await self.set_find_mode(False)
        return stopped

    async def snapshot(self) -> dict:
        self._require_initialized()
        result = {}
        queries = [("features", 0x010D, self.get_features),
                   ("noise", 0x010C, self.get_noise_raw),
                   ("eq_mode", 0x010F, self.get_eq_mode),
                   ("equalizers", 0x0122, self.get_equalizers),
                   ("spatial_type", 0x012A, self.get_spatial_type),
                   ("keys", 0x0108, self.get_key_bindings)]
        for name, command, query in queries:
            if command not in self.capabilities:
                result[name] = {"supported_command": False}
                continue
            try:
                result[name] = await query()
            except (DeviceRejected, ProtocolError, TimeoutError) as error:
                result[name] = {"error": str(error)}
        return result
