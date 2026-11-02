"""0122 descriptors and 0418 payloads, reconstructed from CommandUtil.b."""
from __future__ import annotations

from dataclasses import dataclass
import struct

from .protocol import ProtocolError


@dataclass(frozen=True)
class Equalizer:
    eq_id: int
    name: str
    min_gain: int
    max_gain: int
    frequencies: tuple[int, ...]
    gains: tuple[int, ...]
    selected: int = 0

    def encode_setting(self, action: int) -> bytes:
        if action not in (1, 2, 3):
            raise ValueError("EQ action must be 1=create, 2=write/select, or 3=delete")
        if not 0 <= self.eq_id <= 255:
            raise ValueError("eq_id must fit uint8")
        name = self.name.encode("utf-8")
        if len(name) > 255:
            raise ValueError("UTF-8 EQ name exceeds uint8 length")
        if not -128 <= self.min_gain <= self.max_gain <= 127:
            raise ValueError("invalid signed gain limits")
        if not 1 <= len(self.frequencies) <= 255 or len(self.frequencies) != len(self.gains):
            raise ValueError("expected matching 1..255 frequency and gain entries")
        if any(type(f) is not int or not 0 <= f <= 65535 for f in self.frequencies):
            raise ValueError("frequency must fit uint16")
        if any(type(g) is not int or not self.min_gain <= g <= self.max_gain for g in self.gains):
            raise ValueError("gain must be an integer within the device's declared limits")
        return (struct.pack("<BbbBB", action, self.min_gain, self.max_gain, self.eq_id, len(name))
                + name + bytes([len(self.gains)])
                + b"".join(struct.pack("<Hb", f, g) for f, g in zip(self.frequencies, self.gains)))


def parse_equalizers(data: bytes) -> list[Equalizer]:
    """Input starts at count (application status has already been checked)."""
    if not data:
        raise ProtocolError("missing EQ descriptor count")
    offset = 1
    result = []
    for _ in range(data[0]):
        if offset + 5 > len(data):
            raise ProtocolError("truncated EQ descriptor header")
        selected, low, high, eq_id, name_size = struct.unpack_from("<BbbBB", data, offset)
        offset += 5
        if offset + name_size + 1 > len(data):
            raise ProtocolError("truncated EQ name/count")
        try:
            name = data[offset:offset+name_size].decode("utf-8")
        except UnicodeDecodeError as error:
            raise ProtocolError("invalid UTF-8 EQ name") from error
        offset += name_size
        bands = data[offset]
        offset += 1
        if not bands or offset + bands * 3 > len(data):
            raise ProtocolError("invalid EQ band count/length")
        values = [struct.unpack_from("<Hb", data, offset+3*i) for i in range(bands)]
        offset += bands * 3
        result.append(Equalizer(eq_id, name, low, high,
                                tuple(v[0] for v in values), tuple(v[1] for v in values), selected))
    if offset != len(data) or len({entry.eq_id for entry in result}) != len(result):
        raise ProtocolError("trailing EQ bytes or duplicate IDs")
    return result
