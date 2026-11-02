import unittest

from enco_free4 import Equalizer, parse_equalizers, load_profile, ProtocolError, Feature


class DescriptorTests(unittest.TestCase):
    def test_fixed_eq_descriptor_signed_fields_and_utf8_name(self):
        # count1, selected1, min-6,max6,id10,nameLen3,'EQ1',2 bands.
        raw = bytes.fromhex("0101fa060a03455131026400fed00703")
        self.assertEqual(parse_equalizers(raw), [Equalizer(10, "EQ1", -6, 6,
                                                          (100, 2000), (-2, 3), 1)])
        self.assertEqual(parse_equalizers(raw)[0].encode_setting(2).hex(),
                         "02fa060a03455131026400fed00703")

    def test_bad_eq_lengths_are_rejected(self):
        for raw in (b"", bytes.fromhex("0101fa06"), bytes.fromhex("0101fa060a0345"),
                    bytes.fromhex("0101fa060a0000"), bytes.fromhex("0000")):
            with self.subTest(raw=raw.hex()), self.assertRaises(ProtocolError):
                parse_equalizers(raw)

    def test_eq_name_length_is_utf8_bytes(self):
        eq = Equalizer(10, "自定", -6, 6, (100,), (0,))
        encoded = eq.encode_setting(2)
        self.assertEqual(encoded[4], 6)
        self.assertEqual(parse_equalizers(bytes([1, 1]) + encoded[1:])[0].name, "自定")

    def test_free4_profile_controls_uuid_and_optional_features(self):
        profile = load_profile()
        self.assertEqual(profile.service_uuid, "0000079a-d102-11e1-9b23-00025b00a5a5")
        self.assertEqual(profile.feature_ids, (6, 17, 24, 27))
        self.assertIn(11, profile.noise_indices)
        self.assertNotIn(Feature.GAME_MASTER, profile.feature_ids)

    def test_eq_firmware_gates_and_model_variants_stay_distinct(self):
        ordinary = load_profile("068C10")
        special = load_profile("06C010")
        ids = lambda profile, fw=None: {entry["protocolIndex"] for entry in profile.eq_options(fw)}
        self.assertEqual(ids(ordinary), {0, 1, 2})
        self.assertEqual(ids(ordinary, 118), {0, 1, 2, 7})
        self.assertEqual(ids(special), {0, 1, 2, 3})
        self.assertEqual(ids(special, 136), {0, 1, 2, 3, 7, 8})


if __name__ == "__main__":
    unittest.main()
