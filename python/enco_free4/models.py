"""Small wire models; numeric values are from the APK, not a public OPPO SDK."""
from __future__ import annotations

from dataclasses import dataclass
from enum import IntEnum


class Feature(IntEnum):
    GAME_MODE = 6
    MULTIPOINT = 17
    HIGH_QUALITY_AUDIO = 24
    SPATIAL_AUDIO = 27
    BASS_ENGINE = 29
    GAME_EQ = 33
    GAME_SOUND = 39
    GAME_MASTER = 40


DEFAULT_FEATURES = tuple(int(value) for value in Feature)


class NoiseMode(IntEnum):
    OFF = 0
    ANC = 1
    TRANSPARENCY = 2
    DEEP = 4
    MODERATE = 5
    MILD = 6
    SMART = 7
    ADAPTIVE = 11


@dataclass(frozen=True)
class KeyBinding:
    device_type: int
    button: int
    action: int
    function: int

    def encode(self) -> bytes:
        values = (self.device_type, self.button, self.action, self.function)
        if any(type(value) is not int or not 0 <= value <= 255 for value in values):
            raise ValueError("key binding fields must be uint8")
        return bytes(values)


def byte_ids(values, *, label: str, allow_empty: bool = False) -> tuple[int, ...]:
    result = tuple(values)
    if len(result) > 255 or (not result and not allow_empty):
        raise ValueError(f"{label}: expected 1..255 IDs")
    if any(not isinstance(x, int) or not 0 <= x <= 255 for x in result):
        raise ValueError(f"{label}: IDs must fit uint8")
    if len(set(result)) != len(result):
        raise ValueError(f"{label}: duplicate IDs")
    return result
