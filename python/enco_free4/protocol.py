"""OPOv1 control framing reconstructed from HeyMelody 17.6.5.

Sources: w8.a, w8.b, M8.b$HandlerC0041b, N8.b, n7.d.b.
Derived from static evidence; capability/feature/game-mode exchanges were
verified on one Free4 via Windows RFCOMM. See ../../validation.json for scope.
"""
from __future__ import annotations

from dataclasses import dataclass
import struct


class ProtocolError(ValueError):
    pass


@dataclass(frozen=True)
class Packet:
    command: int
    sequence: int
    payload: bytes = b""

    def encode(self) -> bytes:
        if not 0 <= self.command <= 0xFFFF:
            raise ValueError("command must fit in uint16")
        if not 0 <= self.sequence <= 255:
            raise ValueError("sequence must fit in uint8")
        if len(self.payload) > 65535:
            raise ValueError("payload exceeds uint16 length")
        return struct.pack("<HBH", self.command, self.sequence, len(self.payload)) + self.payload

    @classmethod
    def decode(cls, data: bytes) -> Packet:
        if len(data) < 5:
            raise ProtocolError("application packet shorter than 5 bytes")
        command, seq, count = struct.unpack_from("<HBH", data)
        if len(data) != 5 + count:
            raise ProtocolError(f"application length mismatch: declared={count}, actual={len(data)-5}")
        return cls(command, seq, bytes(data[5:]))


def uleb128(value: int) -> bytes:
    if not 0 <= value <= 0x3FFF:
        raise ValueError("control link length must fit in two ULEB128 bytes")
    if value < 128:
        return bytes([value])
    return bytes([(value & 0x7F) | 0x80, value >> 7])


def _frame(payload: bytes, control: int = 0, index: int | None = None) -> bytes:
    body = bytes([control, 0])
    if index is not None:
        body += bytes([index])
    body += payload
    return b"\xAA" + uleb128(len(body)) + body


def encode_frames(packet: Packet, max_frame_size: int = 660) -> list[bytes]:
    """OPOv1 frame fragmentation, separate from BLE ATT write chunking.

    660 is the normal control frame limit selected by the APK's wrapper.
    Firmware/OTA special cases are deliberately outside this implementation.
    """
    if not 10 <= max_frame_size <= 0x3FFF:
        raise ValueError("max_frame_size must be 10..16383")
    app = packet.encode()
    single = _frame(app)
    if len(single) <= max_frame_size:
        return [single]
    size = max_frame_size - 5
    while 1 + len(uleb128(size + 3)) + 3 + size > max_frame_size:
        size -= 1
    chunks = [app[i:i+size] for i in range(0, len(app), size)]
    if len(chunks) > 256:
        raise ValueError("fragment index would overflow; use a larger frame limit")
    return [_frame(part, 1 if i == 0 else 3 if i == len(chunks)-1 else 2, i)
            for i, part in enumerate(chunks)]


class FrameStream:
    """Incremental decoder for RFCOMM streams and split BLE notifications.

    Validates fragment order and packet lengths more strictly than the APK.
    Call reset on every new connection. Invalid data is an error, never an ACK.
    """
    def __init__(self) -> None:
        self.reset()

    def reset(self) -> None:
        self.buffer = bytearray()
        self.fragments: bytearray | None = None
        self.next_index = 0

    def feed(self, data: bytes) -> list[Packet]:
        self.buffer.extend(data)
        if len(self.buffer) > 131072:
            raise ProtocolError("receive buffer limit exceeded")
        result: list[Packet] = []
        while self.buffer:
            if self.buffer[0] != 0xAA:
                raise ProtocolError("missing OPOv1 SOF 0xAA")
            if len(self.buffer) < 2:
                break
            first = self.buffer[1]
            if first & 0x80:
                if len(self.buffer) < 3:
                    break
                if self.buffer[2] & 0x80:
                    raise ProtocolError("unsupported OPOv1 length encoding")
                count = (first & 0x7F) | (self.buffer[2] << 7)
                header = 3
                if count < 128:
                    raise ProtocolError("noncanonical OPOv1 length")
            else:
                count = first
                header = 2
            if count < 2:
                raise ProtocolError("link body shorter than control/reserved fields")
            if len(self.buffer) < header + count:
                break
            body = bytes(self.buffer[header:header+count])
            del self.buffer[:header+count]
            control = body[0] & 3
            if control == 0:
                if self.fragments is not None:
                    raise ProtocolError("single frame interrupted a fragmented packet")
                result.append(Packet.decode(body[2:]))
                continue
            if len(body) < 4:
                raise ProtocolError("fragment lacks index or data")
            index, part = body[2], body[3:]
            if control == 1:
                if self.fragments is not None or index != 0:
                    raise ProtocolError("invalid first fragment")
                self.fragments = bytearray(part)
                self.next_index = 1
                continue
            if self.fragments is None or index != self.next_index:
                raise ProtocolError("missing or out-of-order fragment")
            self.fragments.extend(part)
            self.next_index += 1
            if len(self.fragments) > 65540:
                raise ProtocolError("fragmented application packet too large")
            if control == 3:
                result.append(Packet.decode(bytes(self.fragments)))
                self.fragments = None
                self.next_index = 0
        return result


def make_windows_rfcomm_address(address: str, service_uuid: str, channel: int = 0) -> bytes:
    """Packed SOCKADDR_BTH: ws2bth.h uses pshpack1.h (30 bytes)."""
    from uuid import UUID
    compact = address.replace(":", "").replace("-", "")
    if len(compact) != 12 or any(c not in "0123456789abcdefABCDEF" for c in compact):
        raise ValueError("expected a 48-bit Bluetooth MAC address")
    if not 0 <= channel <= 30:
        raise ValueError("RFCOMM channel must be 0 (SDP lookup) or 1..30")
    return struct.pack("<HQ16sI", 32, int(compact, 16), UUID(service_uuid).bytes_le, channel)
