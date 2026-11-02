"""Offline regression cases for cross-model distinctions and shared reads."""
import unittest
from unittest.mock import patch

from enco_free4 import (list_models, get_model, catalog_summary, load_profile,
                       parse_batteries, parse_versions, ProtocolError,
                       HeadsetClient, UnsupportedFeature)
from enco_free4.__main__ import parser, run
from test_client import FakeTransport


class CatalogTests(unittest.TestCase):
    def test_catalog_keeps_all_ids_and_same_name_variants(self):
        records = list_models()
        self.assertEqual(len(records), 85)
        self.assertEqual(len({row["id"] for row in records}), 85)
        self.assertEqual({row["id"] for row in records if row["name"] == "OnePlus Buds Z"},
                         {"060814", "068814"})
        self.assertEqual(catalog_summary()["summary"]["hidden_records"], 28)

    def test_search_preserves_hidden_alias_and_brand_choices(self):
        self.assertEqual(len(list_models(brand="ONEPLUS")), 32)
        self.assertEqual(len(list_models(include_hidden=False)), 57)
        self.assertEqual(list_models("bohr")[0]["id"], "06EC10")
        self.assertEqual(get_model("063c10")["name"], "OPPO Enco X2")
        with self.assertRaises(ValueError):
            get_model("OnePlus Buds Z")

    def test_model_values_are_not_free4_enums_or_boolean_capabilities(self):
        x = get_model("061410")
        modes = {row["protocolIndex"]: row["modeType"] for row in x["function"]["noiseReductionMode"]}
        self.assertEqual(modes[1], 2)  # Enco X: transparency, not Free4 ANC.
        self.assertEqual(modes[3], 4)  # Enco X: deep ANC.
        self.assertEqual(get_model("06EC10")["function"]["multiDevicesConnect"], 2)
        self.assertNotIn("spatialTypes", get_model("063C10")["function"])
        with self.assertRaises(ValueError):
            load_profile("061410")  # Catalog presence does not open write profiles.

    def test_results_do_not_share_mutable_state(self):
        row = get_model("061410")
        row["function"].clear()
        self.assertTrue(get_model("061410")["function"])


class DeviceInfoParserTests(unittest.TestCase):
    def test_battery_flags_preserve_unknown_levels_and_identity(self):
        readings = parse_batteries(bytes.fromhex("03016402b2ffff"))
        self.assertEqual([(r.device_type, r.level_raw, r.charging, r.value_raw) for r in readings],
                         [(1, 100, False, 100), (2, 50, True, 178), (255, 127, True, 255)])
        self.assertEqual(parse_batteries(bytes.fromhex("010100"))[0].level_raw, 0)

    def test_bad_battery_counts_and_trailing_data_fail(self):
        for data in (b"", b"\0", bytes.fromhex("020164"), bytes.fromhex("01016400")):
            with self.subTest(data=data), self.assertRaises(ProtocolError):
                parse_batteries(data)

    def test_version_triples_preserve_prefix_and_unknown_types(self):
        rows = parse_versions(b"\x021,0,Version_118,99,42,v1.2-beta")
        self.assertEqual(rows[0].version_raw, "Version_118")
        self.assertEqual(rows[1].device_type_raw, "99")
        self.assertEqual(rows[1].version_type_raw, "42")

    def test_malformed_versions_fail_without_guessing(self):
        for data in (b"", b"\x00", b"\x021,0,v1", b"\x011,0,", b"\x011,0,\xff"):
            with self.subTest(data=data), self.assertRaises(ProtocolError):
                parse_versions(data)


class DeviceInfoClientTests(unittest.IsolatedAsyncioTestCase):
    async def test_reads_use_empty_payload_and_require_initialization(self):
        transport = FakeTransport()
        async with HeadsetClient(transport) as client:
            with self.assertRaises(RuntimeError):
                await client.get_batteries()
            self.assertEqual(transport.requests, [])
            await client.initialize()
            self.assertEqual((await client.get_batteries())[1].level_raw, 50)
            self.assertEqual((await client.get_versions())[0].version_raw, "Version_118")
            self.assertEqual([(p.command, p.payload) for p in transport.requests[-2:]],
                             [(0x0106, b""), (0x0105, b"")])
            client.capabilities.discard(0x0105)
            count = len(transport.requests)
            with self.assertRaises(UnsupportedFeature):
                await client.get_versions()
            self.assertEqual(len(transport.requests), count)

    async def test_catalog_cli_never_creates_a_transport(self):
        with patch("enco_free4.__main__.WindowsRfcommTransport", side_effect=AssertionError("hardware")):
            rows = await run(parser().parse_args(["models", "--brand", "oppo", "--visible-only"]))
            self.assertTrue(rows)
            row = await run(parser().parse_args(["model-info", "061410"]))
            self.assertEqual(row["id"], "061410")
