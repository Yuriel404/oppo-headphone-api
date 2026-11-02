"""CLI defaults to reading. No hardware operation occurs on import."""
from __future__ import annotations

import argparse
import asyncio
from dataclasses import asdict, is_dataclass
from datetime import datetime, timezone
import json
import math
from pathlib import Path
import sys

from . import (HeadsetClient, WindowsRfcommTransport, BleakTransport,
               scan_ble, inspect_gatt, Feature, KeyBinding, NoiseMode)
from .profiles import load_profile
from .client import ReadbackMismatch


def number(value: str) -> int:
    return int(value, 0)


def non_negative_seconds(value: str) -> float:
    seconds = float(value)
    if not math.isfinite(seconds) or seconds < 0:
        raise argparse.ArgumentTypeError("expected finite seconds >= 0")
    return seconds


def serialize(value):
    if is_dataclass(value):
        return asdict(value)
    if isinstance(value, (bytes, bytearray)):
        return value.hex()
    if isinstance(value, set):
        return sorted(value)
    raise TypeError(type(value).__name__)


def parser() -> argparse.ArgumentParser:
    root = argparse.ArgumentParser(
        description="Enco Free4 APK-derived reference API",
        epilog="Examples: --address MAC set-feature game_mode on; "
               "--address MAC set-noise deep; --address MAC keys. "
               "set-noise and keys are standalone commands.")
    root.add_argument("--transport", choices=("rfcomm", "ble"), default="rfcomm")
    root.add_argument("--address", help="classic MAC for RFCOMM, discovered BLE address for BLE")
    root.add_argument("--profile", choices=("068C10", "06C010"), default="068C10")
    root.add_argument("--service-uuid", help="override the APK model UUID after service discovery")
    root.add_argument("--channel", type=int, default=0, help="RFCOMM channel; 0 asks Windows SDP")
    root.add_argument("--pair", action="store_true", help="request BLE pairing")
    root.add_argument("--timeout", type=float, default=10, help="application reply timeout")
    root.add_argument("--verify-timeout", type=non_negative_seconds, default=3,
                      help="feature readback polling window after ACK, seconds (default: 3; 0: one read)")
    root.add_argument("--trace", help="write TX/RX hex JSONL to this file")
    root.add_argument("--output", help="write result JSON to this file")
    commands = root.add_subparsers(dest="action")
    commands.add_parser("scan", help="BLE scan only; requires optional bleak dependency")
    commands.add_parser("gatt", help="list GATT services; requires bleak")
    commands.add_parser("profile", help="show packaged model configuration without Bluetooth")
    commands.add_parser("snapshot", help="discover capabilities and read settings")
    commands.add_parser("features", help="read this profile's feature switches")
    commands.add_parser("noise", help="read current ANC raw state")
    commands.add_parser("equalizers", help="read custom EQ descriptors")
    noise_set = commands.add_parser("set-noise", help="select a Free4 noise mode")
    noise_set.add_argument("mode", choices=[item.name.lower() for item in NoiseMode])
    keys = commands.add_parser("keys", help="read original key identities")
    keys.add_argument("--types", nargs="+", type=number, default=[3, 1])
    feature = commands.add_parser("set-feature", help="write one model-supported boolean feature")
    feature.add_argument("feature", choices=[item.name.lower() for item in Feature])
    feature.add_argument("state", choices=("on", "off"))
    eq = commands.add_parser("set-eq", help="select a preset by protocol index")
    eq.add_argument("mode_id", type=number)
    eq.add_argument("--firmware-version", type=int, help="confirmed APK model-version integer")
    custom = commands.add_parser("update-eq", help="update/select an existing custom EQ")
    custom.add_argument("eq_id", type=number)
    custom.add_argument("gains", type=int, nargs="+")
    custom.add_argument("--name")
    spatial = commands.add_parser("set-spatial-type", help="set a model spatial type")
    spatial.add_argument("type_id", type=number)
    key = commands.add_parser("set-key", help="change function on an existing key identity")
    for name in ("device_type", "button", "gesture", "function"):
        key.add_argument(name, type=number)
    find = commands.add_parser("find", help="enter find mode briefly, then explicitly exit")
    find.add_argument("--seconds", type=float, default=5)
    find.add_argument("--earbuds-removed", action="store_true", required=True,
                      help="confirm earbuds are out of ears before a find tone")
    commands.add_parser("stop-find", help="send exit-find command")
    return root


async def run(args):
    profile = load_profile(args.profile)
    action = args.action or "snapshot"
    if action == "profile":
        return profile.raw
    if action == "scan":
        return await scan_ble()
    if not args.address:
        raise ValueError("--address is required (or use scan/profile)")
    if action == "gatt":
        return await inspect_gatt(args.address, pair=args.pair)
    uuid = args.service_uuid or profile.service_uuid
    transport = (WindowsRfcommTransport(args.address, service_uuid=uuid, channel=args.channel)
                 if args.transport == "rfcomm" else
                 BleakTransport(args.address, service_uuid=uuid, pair=args.pair))
    trace_file = Path(args.trace).open("w", encoding="utf-8") if args.trace else None

    def trace(direction, data):
        trace_file.write(json.dumps({"at": datetime.now(timezone.utc).isoformat(),
                                     "direction": direction, "hex": data.hex()}) + "\n")
        trace_file.flush()

    try:
        async with HeadsetClient(transport, timeout=args.timeout,
                                 trace=trace if trace_file else None, profile=profile,
                                 verify_timeout=args.verify_timeout) as device:
            info = await device.initialize()
            if action == "snapshot":
                state = await device.snapshot()
                return {"profile": profile.product_id, "discovery": info, "state": state}
            if action == "features":
                return await device.get_features(profile.feature_ids)
            if action == "noise":
                return await device.get_noise_raw()
            if action == "equalizers":
                return await device.get_equalizers()
            if action == "set-noise":
                return await device.set_noise_mode(NoiseMode[args.mode.upper()])
            if action == "keys":
                return await device.get_key_bindings(args.types)
            if action == "set-feature":
                value = Feature[args.feature.upper()]
                if value not in profile.feature_ids:
                    raise ValueError("feature absent from selected model profile")
                return await device.set_feature(value, args.state == "on")
            if action == "set-eq":
                if args.mode_id not in {m["protocolIndex"] for m in profile.eq_options(args.firmware_version)}:
                    raise ValueError("preset absent or firmware gate unknown; use API with a confirmed version")
                return await device.set_eq_mode(args.mode_id, firmware_version=args.firmware_version)
            if action == "update-eq":
                return await device.update_equalizer(args.eq_id, args.gains, name=args.name)
            if action == "set-spatial-type":
                if args.type_id not in profile.raw["function"].get("spatialTypes", []):
                    raise ValueError("spatial type absent from selected profile")
                return await device.set_spatial_type(args.type_id)
            if action == "set-key":
                return await device.set_key_bindings([KeyBinding(args.device_type, args.button,
                                                                 args.gesture, args.function)])
            if action == "find":
                return await device.find_for(args.seconds)
            if action == "stop-find":
                return await device.set_find_mode(False)
    finally:
        if trace_file:
            trace_file.close()


def main() -> int:
    args = parser().parse_args()
    try:
        result = asyncio.run(run(args))
        content = json.dumps(result, ensure_ascii=False, indent=2, default=serialize) + "\n"
        if args.output:
            Path(args.output).write_text(content, encoding="utf-8")
        print(content, end="")
        return 0
    except (Exception, KeyboardInterrupt) as error:
        print(f"{type(error).__name__}: {error}", file=sys.stderr)
        if isinstance(error, ReadbackMismatch) and args.action == "set-feature":
            print("Tip: add --verify-timeout 5 --trace game-mode.jsonl before the subcommand "
                  "to wait longer and record TX/RX; the setting is not resent.", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
