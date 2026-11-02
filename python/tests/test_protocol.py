import unittest

from enco_free4.protocol import (FrameStream, Packet, ProtocolError, encode_frames,
                                make_windows_rfcomm_address)


class WireProtocolTests(unittest.TestCase):
    def test_empty_capability_request_matches_apk_layout(self):
        # AA, body length 7, control/reserved 0, cmd 0100 LE, seq 0, len 0.
        expected = bytes.fromhex("aa0700000001000000")
        self.assertEqual(encode_frames(Packet(0x0100, 0)), [expected])
        self.assertEqual(FrameStream().feed(expected), [Packet(0x0100, 0)])

    def test_feature_write_has_little_endian_opcode_and_payload_length(self):
        expected = bytes.fromhex("aa09000003041702000201")
        self.assertEqual(encode_frames(Packet(0x0403, 0x17, b"\x02\x01")), [expected])

    def test_fixed_response_survives_every_transport_boundary(self):
        raw = bytes.fromhex("aa0d00000d81170600000202010600")
        expected = Packet(0x810D, 0x17, bytes.fromhex("000202010600"))
        for split in range(len(raw)+1):
            stream = FrameStream()
            self.assertEqual(stream.feed(raw[:split]) + stream.feed(raw[split:]), [expected])
        stream = FrameStream()
        found = []
        for byte in raw:
            found += stream.feed(bytes([byte]))
        self.assertEqual(found, [expected])

    def test_uleb_length_boundary_includes_control_bytes(self):
        first = encode_frames(Packet(0x0100, 0, bytes(120)))[0]
        second = encode_frames(Packet(0x0100, 0, bytes(121)))[0]
        self.assertEqual(first[:4], bytes.fromhex("aa7f0000"))
        self.assertEqual(second[:5], bytes.fromhex("aa80010000"))

    def test_fixed_multi_frame_packet_and_order_validation(self):
        frames = [bytes.fromhex(x) for x in (
            "aa080100000001010600", "aa080200016162636465", "aa0403000266")]
        packet = Packet(0x0100, 1, b"abcdef")
        self.assertEqual(encode_frames(packet, 10), frames)
        self.assertEqual(FrameStream().feed(b"".join(frames)), [packet])
        stream = FrameStream()
        stream.feed(frames[0])
        with self.assertRaises(ProtocolError):
            stream.feed(frames[2])

    def test_malformed_frames_are_not_treated_as_success(self):
        for data in (b"\xAB", bytes.fromhex("aa0100"), bytes.fromhex("aa8080"),
                     bytes.fromhex("aa0700000001000100")):
            with self.subTest(data=data.hex()), self.assertRaises(ProtocolError):
                FrameStream().feed(data)

    def test_concatenated_packets_preserve_sequence(self):
        raw = bytes.fromhex("aa0700000001000000aa0700000001010000")
        self.assertEqual(FrameStream().feed(raw), [Packet(0x0100, 0), Packet(0x0100, 1)])

    def test_windows_sockaddr_uses_sdk_pack1_and_guid_byte_order(self):
        raw = make_windows_rfcomm_address("AA:BB:CC:DD:EE:FF", "00001107-d102-11e1-9b23-00025b00a5a5")
        self.assertEqual(len(raw), 30)
        self.assertEqual(raw[:10].hex(), "2000ffeeddccbbaa0000")
        self.assertEqual(raw[10:26].hex(), "0711000002d1e1119b2300025b00a5a5")
        self.assertEqual(raw[26:], bytes(4))


if __name__ == "__main__":
    unittest.main()
