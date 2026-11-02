"""Explicit change: python examples/change_multipoint.py AA:BB:CC:DD:EE:FF on

This script sends a real setting only when explicitly run with an address.
"""
import argparse
import asyncio
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from enco_free4 import HeadsetClient, WindowsRfcommTransport, load_profile


async def main(address, enabled):
    profile = load_profile()
    transport = WindowsRfcommTransport(address, service_uuid=profile.service_uuid)
    async with HeadsetClient(transport, profile=profile) as headset:
        await headset.initialize()
        result = await headset.set_multipoint(enabled)
        print(result)
    # A separate reconnect checks persistence, in addition to immediate readback.
    transport = WindowsRfcommTransport(address, service_uuid=profile.service_uuid)
    async with HeadsetClient(transport, profile=profile) as headset:
        await headset.initialize()
        final = await headset.get_features([17])
        if final.get(17) != int(enabled):
            raise RuntimeError(f"multipoint state after reconnect: {final}")
        print("Multipoint readback also matched after reconnect.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("address")
    parser.add_argument("state", choices=("on", "off"))
    args = parser.parse_args()
    asyncio.run(main(args.address, args.state == "on"))
