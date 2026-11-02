"""CLI syntax for the feature switch and the two independent commands."""
import contextlib
import io
import unittest

from enco_free4.__main__ import parser
from enco_free4 import HeadsetClient


class CliTests(unittest.TestCase):
    def test_user_commands_are_independent_subcommands(self):
        for command, action in ((["set-feature", "game_mode", "on"], "set-feature"),
                                (["set-noise", "deep"], "set-noise"),
                                (["keys"], "keys")):
            with self.subTest(command=command):
                args = parser().parse_args(["--address", "AA:BB:CC:DD:EE:FF", *command])
                self.assertEqual(args.action, action)

    def test_verification_timeout_flag_is_parsed_before_command(self):
        args = parser().parse_args(["--verify-timeout", "5", "set-feature", "game_mode", "on"])
        self.assertEqual(args.verify_timeout, 5)

    def test_invalid_verification_timeouts_are_rejected_without_hardware(self):
        for value in ("-1", "nan", "inf"):
            with self.subTest(value=value), contextlib.redirect_stderr(io.StringIO()):
                with self.assertRaises(SystemExit):
                    parser().parse_args(["--verify-timeout", value, "keys"])

    def test_client_rejects_unbounded_verification_configuration(self):
        for kwargs in ({"verify_timeout": -1}, {"verify_timeout": float("nan")},
                       {"verify_timeout": float("inf")}, {"verify_interval": 0},
                       {"verify_interval": float("nan")}, {"verify_interval": float("inf")}):
            with self.subTest(kwargs=kwargs), self.assertRaises(ValueError):
                HeadsetClient(None, **kwargs)
