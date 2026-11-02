"""Raw battery/version parsers from commands.e.d/m and BatteryInfo.

No model-specific ear-side labels, battery corrections or firmware comparisons
are inferred here. Inputs exclude the application status byte.
"""
from dataclasses import dataclass

from .protocol import ProtocolError


@dataclass(frozen=True)
class BatteryReading:
    device_type: int
    level_raw: int
    charging: bool
    value_raw: int


def parse_batteries(data: bytes) -> list[BatteryReading]:
    if not data or data[0] == 0 or len(data) != 1 + data[0] * 2:
        raise ProtocolError("invalid battery record count or length")
    return [BatteryReading(data[i], data[i + 1] & 0x7F,
                           bool(data[i + 1] & 0x80), data[i + 1])
            for i in range(1, len(data), 2)]


@dataclass(frozen=True)
class VersionReading:
    device_type_raw: str
    version_type_raw: str
    version_raw: str


def parse_versions(data: bytes) -> list[VersionReading]:
    if not data or data[0] == 0 or len(data) < 2:
        raise ProtocolError("missing version records")
    try:
        parts = data[1:].decode("utf-8").split(",")
    except UnicodeDecodeError as exc:
        raise ProtocolError("invalid version UTF-8") from exc
    if len(parts) != data[0] * 3 or any(not part for part in parts):
        raise ProtocolError("version count does not match nonempty CSV triples")
    # Preserve raw strings rather than applying APK trimVersion/device aliases.
    return [VersionReading(*parts[i:i + 3]) for i in range(0, len(parts), 3)]
