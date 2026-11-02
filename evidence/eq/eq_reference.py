"""Reference EQ wire codec reconstructed from APK evidence. No Bluetooth I/O."""
from dataclasses import dataclass
import struct

@dataclass(frozen=True)
class EqProfile:
    eq_id: int
    name: str
    min_value: int
    max_value: int
    frequencies: tuple[int, ...]
    gains: tuple[int, ...]
    selected: int = 0

def parse_eq_list(payload: bytes) -> list[EqProfile]:
    """Decode 0x8122 payload [status, count, entries...], strictly bounded."""
    offset = 0

    def take(n):
        nonlocal offset
        if n < 0 or offset + n > len(payload):
            raise ValueError("Truncated EQ list")
        result = payload[offset:offset+n]
        offset += n
        return result

    status, count = take(2)
    if status:
        raise ValueError(f"EQ query failed with status {status}")
    result = []
    for _ in range(count):
        selected, min_value, max_value, eq_id, name_len = struct.unpack("<BbbBB", take(5))
        name = take(name_len).decode("utf-8")
        band_count = take(1)[0]
        if band_count < 1:
            raise ValueError("EQ band count must be positive")
        bands = [struct.unpack("<Hb", take(3)) for _ in range(band_count)]
        result.append(EqProfile(
            eq_id, name, min_value, max_value,
            tuple(f for f, _ in bands),
            tuple(g for _, g in bands), selected,
        ))
    if offset != len(payload):
        raise ValueError("Unrecognized trailing EQ data")
    return result

def build_eq_payload(action: int, profile: EqProfile) -> bytes:
    """Encode 0x0418 payload. 1=create, 2=update/select, 3=delete."""
    if action not in (1, 2, 3):
        raise ValueError("Action must be 1, 2 or 3")
    name = profile.name.encode("utf-8")
    count = len(profile.frequencies)
    if len(name) > 255:
        raise ValueError("EQ name exceeds u8 UTF-8 byte length")
    if not 1 <= count <= 255 or count != len(profile.gains):
        raise ValueError("Frequency and gain arrays must have equal positive lengths")
    if not -128 <= profile.min_value <= profile.max_value <= 127:
        raise ValueError("Invalid signed gain limits")
    if any(g < profile.min_value or g > profile.max_value for g in profile.gains):
        raise ValueError("Gain is outside this profile's limits")
    return (
        struct.pack("<BbbBB", action, profile.min_value, profile.max_value, profile.eq_id, len(name))
        + name + bytes([count])
        + b"".join(struct.pack("<Hb", f, g) for f, g in zip(profile.frequencies, profile.gains))
    )

if __name__ == "__main__":
    p = EqProfile(128, "\u6d4b\u8bd5", -6, 6, (60, 15000), (-6, 6), 1)
    q = EqProfile(129, "Flat", -6, 6, (100, 1000, 10000), (0, 0, 0), 0)
    encoded_p = build_eq_payload(2, p)
    encoded_q = build_eq_payload(2, q)
    fixture = bytes([0, 2, p.selected]) + encoded_p[1:] + bytes([q.selected]) + encoded_q[1:]
    assert parse_eq_list(fixture) == [p, q]
    assert encoded_p.hex(" ") == "02 fa 06 80 06 e6 b5 8b e8 af 95 02 3c 00 fa 98 3a 06"
    for invalid in (fixture[:-1], bytes([0, 1, 0]), fixture + b"\x00"):
        try:
            parse_eq_list(invalid)
        except ValueError:
            pass
        else:
            raise AssertionError("Malformed fixture accepted")
    print("EQ codec reference: UTF-8, signed gains, u16 little endian, multiple entries and truncated input verified.")
