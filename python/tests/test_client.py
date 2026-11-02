"""Offline simulator tests, not hardware captures or firmware validation."""
import asyncio
from dataclasses import replace
import struct
import unittest

from enco_free4 import (HeadsetClient, Packet, FrameStream, encode_frames, Feature,
                       KeyBinding, NoiseMode, Equalizer, DeviceRejected,
                       ReadbackMismatch, UnsupportedFeature)


class FakeTransport:
    def __init__(self):
        self.stream = FrameStream()
        self.requests = []
        self.features = {6: 0, 17: 0}
        self.noise = bytes.fromhex("01050900")  # action=1,type=5,mask=0x0009
        self.keys = [KeyBinding(1, 1, 3, 6), KeyBinding(2, 1, 3, 5)]
        self.eq = 0
        self.equalizer = Equalizer(10, "自定", -6, 6, (100, 1000), (-2, 3), 1)
        self.reject = False
        self.ignore_write = False
        self.stale_feature_reads = 0
        self.pending_features = {}
        self.omit = False
        self.wrong_sequence = False
        self.host_replies = []

    async def connect(self, receive, failed):
        self.receive, self.failed = receive, failed

    async def close(self):
        pass

    def emit(self, packet):
        data = b"".join(encode_frames(packet))
        # Every reply is split across notifications to exercise stream parsing.
        self.receive(data[:3])
        self.receive(data[3:])

    async def write(self, data):
        for packet in self.stream.feed(data):
            if packet.command >= 0x8000:
                self.host_replies.append(packet)
                continue
            self.requests.append(packet)
            command, body = packet.command, packet.payload
            if self.omit:
                if self.wrong_sequence:
                    self.emit(Packet(command | 0x8000, (packet.sequence + 1) & 255, b"\0"))
                return
            if command == 0x0100:
                payload = b"\0" + bytes([255] * 8 + [31])
            elif command == 0x0200:
                payload = bytes([0, 3, 3, 6, 0xF2])
            elif command == 0x0106:
                payload = bytes.fromhex("0003016402b203ff")
            elif command == 0x0105:
                payload = b"\x00\x021,0,Version_118,3,2,ABC"
            elif command == 0x010D:
                assert body[0] == len(body) - 1
                ids = [value for value in body[1:] if value in self.features]
                for feature_id in ids:
                    if feature_id in self.pending_features:
                        state, remaining = self.pending_features[feature_id]
                        if remaining:
                            self.pending_features[feature_id] = (state, remaining-1)
                        else:
                            self.features[feature_id] = state
                            del self.pending_features[feature_id]
                payload = bytes([0, len(ids)]) + b"".join(bytes([i, self.features[i]]) for i in ids)
            elif command == 0x0403:
                if not self.ignore_write and not self.reject:
                    if self.stale_feature_reads:
                        self.pending_features[body[0]] = (body[1], self.stale_feature_reads)
                    else:
                        self.features[body[0]] = body[1]
                payload = bytes([3 if self.reject else 0])
            elif command == 0x010C:
                assert body == bytes.fromhex("0101")
                payload = b"\0" + self.noise
            elif command == 0x0404:
                self.noise = body
                payload = b"\0"
            elif command == 0x0108:
                assert body[0] == len(body) - 1
                keys = [key for key in self.keys if key.device_type in body[1:]]
                payload = bytes([0, len(keys)]) + b"".join(key.encode() for key in keys)
            elif command == 0x0401:
                for i in range(body[0]):
                    raw = body[1+4*i:5+4*i]
                    self.keys = [KeyBinding(*raw) if key.encode()[:3] == raw[:3] else key for key in self.keys]
                payload = b"\0"
            elif command == 0x010F:
                payload = bytes([0, self.eq])
            elif command == 0x0406:
                self.eq = body[0]
                payload = b"\0"
            elif command == 0x0122:
                body = self.equalizer.encode_setting(2)
                payload = bytes([0, 1, self.equalizer.selected]) + body[1:]
            elif command == 0x0418:
                assert body[0] == 2
                from enco_free4 import parse_equalizers
                self.equalizer = parse_equalizers(bytes([1, 1]) + body[1:])[0]
                payload = b"\0"
            elif command == 0x0400:
                payload = b"\0"
            else:
                payload = b"\0"
            self.emit(Packet(command | 0x8000, packet.sequence, payload))


class ClientTests(unittest.IsolatedAsyncioTestCase):
    async def asyncSetUp(self):
        self.transport = FakeTransport()
        self.client = HeadsetClient(self.transport, timeout=0.05,
                                   verify_timeout=0.03, verify_interval=0.005)
        await self.client.connect()
        await self.client.initialize()

    async def asyncTearDown(self):
        await self.client.close()

    async def test_multipoint_uses_explicit_feature_query_then_ack_and_readback(self):
        result = await self.client.set_multipoint(True)
        self.assertTrue(result.verified)
        sent = self.transport.requests[-3:]
        self.assertEqual([(p.command, p.payload.hex()) for p in sent],
                         [(0x010D, "0111"), (0x0403, "1101"), (0x010D, "0111")])

    async def test_anc_read_preserves_action_and_type_offsets(self):
        current = await self.client.get_noise_raw()
        self.assertEqual(current, {"action": 1, "type": 5, "data_hex": "0900", "raw_hex": "01050900"})
        result = await self.client.set_noise_raw(5, bytes.fromhex("1200"))
        self.assertTrue(result.verified)
        self.assertEqual(self.transport.requests[-2].payload.hex(), "01051200")

    async def test_rejected_write_is_not_reported_as_success(self):
        self.transport.reject = True
        with self.assertRaises(DeviceRejected) as raised:
            await self.client.set_game_mode(True)
        self.assertEqual(raised.exception.status, 3)

    async def test_success_ack_with_wrong_readback_is_failure(self):
        self.transport.ignore_write = True
        with self.assertRaisesRegex(ReadbackMismatch, r"expected 1, got 0.*readbacks, before=0"):
            await self.client.set_multipoint(True)
        self.assertEqual(sum(p.command == 0x0403 for p in self.transport.requests), 1)

    async def test_game_mode_waits_for_stale_reads_in_both_directions_without_resending(self):
        self.transport.stale_feature_reads = 2
        self.client.verify_timeout = 1
        for enabled in (True, False):
            with self.subTest(enabled=enabled):
                start = len(self.transport.requests)
                result = await self.client.set_game_mode(enabled)
                self.assertTrue(result.acknowledged)
                self.assertTrue(result.verified)
                self.assertEqual(result.readback, {6: int(enabled)})
                sent = self.transport.requests[start:]
                self.assertEqual([p.payload for p in sent if p.command == 0x0403],
                                 [bytes([6, int(enabled)])])
                self.assertEqual(sum(p.command == 0x010D for p in sent), 4)

    async def test_zero_verification_window_reads_once_and_reports_stale_state(self):
        self.client.verify_timeout = 0
        self.transport.stale_feature_reads = 2
        start = len(self.transport.requests)
        with self.assertRaisesRegex(ReadbackMismatch, "1 readbacks"):
            await self.client.set_game_mode(True)
        sent = self.transport.requests[start:]
        self.assertEqual([p.command for p in sent], [0x010D, 0x0403, 0x010D])

    async def test_feature_readback_timeout_does_not_resend_the_setting(self):
        self.transport.stale_feature_reads = 2
        original_write = self.transport.write

        async def stop_replies_after_ack(data):
            await original_write(data)
            if self.transport.requests[-1].command == 0x0403:
                self.transport.omit = True

        self.transport.write = stop_replies_after_ack
        with self.assertRaises(TimeoutError):
            await self.client.set_game_mode(True)
        self.assertEqual(sum(p.command == 0x0403 for p in self.transport.requests), 1)

    async def test_missing_feature_is_not_written(self):
        with self.assertRaises(UnsupportedFeature):
            await self.client.set_feature(Feature.BASS_ENGINE, True)
        self.assertNotIn(0x0403, [p.command for p in self.transport.requests])

    async def test_capability_gate_prevents_optional_write(self):
        self.client.capabilities.discard(0x0403)
        before = len(self.transport.requests)
        with self.assertRaises(UnsupportedFeature):
            await self.client.set_multipoint(True)
        self.assertEqual(len(self.transport.requests), before)

    async def test_wrong_sequence_does_not_complete_request(self):
        self.transport.omit = self.transport.wrong_sequence = True
        with self.assertRaises(TimeoutError):
            await self.client.request(0x010D, b"\x01\x11")
        self.assertEqual(self.client.pending, {})
        event = await self.client.next_event(timeout=0.1)
        self.assertEqual(event.command, 0x810D)

    async def test_notifications_do_not_complete_an_outstanding_query(self):
        self.transport.omit = True
        pending = asyncio.create_task(self.client.request(0x010D, b"\x01\x11"))
        await asyncio.sleep(0)
        self.transport.emit(Packet(0x0204, 1, bytes.fromhex("0601")))
        with self.assertRaises(TimeoutError):
            await pending
        event = await self.client.next_event(timeout=0.1)
        self.assertEqual(event.command, 0x0204)

    async def test_host_requests_keep_received_sequence(self):
        self.transport.emit(Packet(0x0500, 201, b""))
        self.transport.emit(Packet(0x051C, 202, b""))
        await asyncio.sleep(0)
        replies = self.transport.host_replies
        self.assertEqual([(p.command, p.sequence) for p in replies], [(0x8500, 201), (0x851C, 202)])
        self.assertEqual(len(replies[0].payload), 5)
        self.assertEqual(replies[1].payload, b"\0\0\0")
        self.assertGreater(struct.unpack("<I", replies[0].payload[1:])[0], 1_700_000_000)

    async def test_key_write_preserves_identity_uses_0401_and_reads_back(self):
        key = (await self.client.get_key_bindings((1, 2)))[0]
        result = await self.client.set_key_bindings([replace(key, function=5)])
        self.assertTrue(result.verified)
        self.assertEqual(self.transport.requests[-2].command, 0x0401)
        self.assertEqual(self.transport.requests[-2].payload.hex(), "0101010305")

    async def test_key_write_refuses_an_unread_identity(self):
        with self.assertRaises(UnsupportedFeature):
            await self.client.set_key_bindings([KeyBinding(1, 9, 9, 5)])

    async def test_eq_mode_is_verified(self):
        result = await self.client.set_eq_mode(2)
        self.assertTrue(result.verified)
        self.assertEqual(result.readback, 2)

    async def test_adaptive_noise_uses_two_byte_mask_and_type_one(self):
        result = await self.client.set_noise_mode(NoiseMode.ADAPTIVE)
        self.assertTrue(result.verified)
        self.assertEqual(self.transport.requests[-2].payload.hex(), "01010008")

    async def test_custom_eq_retains_frequencies_and_reads_back_signed_gains(self):
        result = await self.client.update_equalizer(10, [-3, 4], name="自定2")
        self.assertTrue(result.verified)
        self.assertEqual(result.readback.gains, (-3, 4))
        self.assertEqual(result.readback.frequencies, (100, 1000))
        self.assertEqual(result.readback.name, "自定2")

    async def test_custom_eq_rejects_gain_outside_device_limits_before_write(self):
        with self.assertRaises(ValueError):
            await self.client.update_equalizer(10, [-7, 0])
        self.assertNotIn(0x0418, [packet.command for packet in self.transport.requests])

    async def test_find_is_acknowledged_without_claiming_audible_verification(self):
        result = await self.client.set_find_mode(False)
        self.assertTrue(result.acknowledged)
        self.assertFalse(result.verified)

    async def test_disconnect_fails_pending_request(self):
        self.transport.omit = True
        pending = asyncio.create_task(self.client.request(0x010D, b"\x01\x11"))
        await asyncio.sleep(0)
        self.transport.failed(ConnectionError("simulated disconnect"))
        with self.assertRaisesRegex(ConnectionError, "simulated disconnect"):
            await pending
        self.assertEqual(self.client.pending, {})

    async def test_notification_discovery_is_separate_from_command_bitmap(self):
        info = await self.client.initialize(subscribe=True)
        self.assertEqual(info["subscribed_events"], [3, 6])
        self.assertEqual(self.transport.requests[-1].command, 0x0205)
        self.assertEqual(self.transport.requests[-1].payload, bytes([2, 3, 6]))
        self.assertNotIn(0x0200, self.client.capabilities)


if __name__ == "__main__":
    unittest.main()
