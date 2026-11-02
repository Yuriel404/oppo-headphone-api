"""Run from python/: python examples/read_state.py AA:BB:CC:DD:EE:FF

Reads settings only. Replace the placeholder with the paired classic MAC.
"""
import argparse
import asyncio
from dataclasses import asdict, is_dataclass
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from enco_free4 import HeadsetClient, WindowsRfcommTransport, load_profile


async def main(address, product_id):
    profile = load_profile(product_id)
    transport = WindowsRfcommTransport(address, service_uuid=profile.service_uuid)
    async with HeadsetClient(transport, profile=profile) as headset:
        capabilities = await headset.initialize()
        state = await headset.snapshot()
        print(json.dumps({"capabilities": capabilities, "state": state},
                         ensure_ascii=False, indent=2,
                         default=lambda value: asdict(value) if is_dataclass(value) else value.hex()))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("address")
    parser.add_argument("--profile", default="068C10", choices=("068C10", "06C010"))
    args = parser.parse_args()
    asyncio.run(main(args.address, args.profile))
