"""Model options from the packaged APK whitelist, with firmware gates kept."""
from __future__ import annotations

from dataclasses import dataclass
from importlib.resources import files
import json
from pathlib import Path

from .models import Feature


@dataclass(frozen=True)
class ModelProfile:
    raw: dict

    @property
    def product_id(self) -> str:
        return self.raw["id"]

    @property
    def name(self) -> str:
        return self.raw["name"]

    @property
    def service_uuid(self) -> str:
        return self.raw["uuid"].lower()

    @property
    def feature_ids(self) -> tuple[int, ...]:
        function = self.raw["function"]
        names = ((Feature.GAME_MODE, "gameMode"),
                 (Feature.MULTIPOINT, "multiDevicesConnect"),
                 (Feature.HIGH_QUALITY_AUDIO, "highToneQuality"),
                 (Feature.SPATIAL_AUDIO, "spatialTypes"),
                 (Feature.BASS_ENGINE, "bassEngineSupport"),
                 (Feature.GAME_EQ, "gameEqPkgList"),
                 (Feature.GAME_SOUND, "gameSoundList"),
                 (Feature.GAME_MASTER, "gameSoundList"))
        return tuple(int(value) for value, key in names if function.get(key))

    @property
    def noise_indices(self) -> set[int]:
        result = set()
        for mode in self.raw["function"].get("noiseReductionMode", []):
            result.add(mode["protocolIndex"])
            result.update(child["protocolIndex"] for child in mode.get("childrenMode", []))
        return result

    def eq_options(self, firmware_version: int | None = None,
                   app_version: int = 17006005) -> list[dict]:
        """Unknown firmware exposes base modes only; gates are never guessed.

        firmware_version is the APK comparator's model version integer, not a
        Windows driver version or an arbitrary dotted version string.
        """
        function = self.raw["function"]
        modes = []
        for group in ("equalizerMode", "equalizerModeCompat", "equalizerModeByVersion"):
            for entry in function.get(group, []):
                minimum = entry.get("minFirmVersion")
                if minimum is not None and (firmware_version is None or firmware_version < minimum):
                    continue
                if app_version < entry.get("minAppVersion", 0):
                    continue
                labels = {26: "至臻原音", 28: "纯享人声", 29: "澎湃低音",
                          30: "丹拿特调", 34: "活力动感", 40: "丹拿人声"}
                modes.append({**entry, "label_zh": labels.get(entry["modeType"])})
        return sorted(modes, key=lambda entry: entry.get("order", entry["protocolIndex"]))


def load_profile(product_id: str = "068C10", *, path: str | Path | None = None) -> ModelProfile:
    content = (Path(path).read_text(encoding="utf-8") if path is not None else
               files("enco_free4").joinpath("data/enco-free4.json").read_text(encoding="utf-8"))
    bundle = json.loads(content)
    for profile in bundle["profiles"]:
        if profile["id"].upper() == product_id.upper():
            return ModelProfile(profile)
    raise ValueError(f"unknown profile product ID: {product_id}")
