"""Unofficial, statically reconstructed Enco control reference API."""
from .protocol import Packet, ProtocolError, FrameStream, encode_frames
from .transports import WindowsRfcommTransport, BleakTransport, scan_ble, inspect_gatt
from .client import HeadsetClient, WriteResult, UnsupportedFeature, DeviceRejected, ReadbackMismatch
from .models import Feature, KeyBinding, NoiseMode
from .profiles import ModelProfile, load_profile
from .equalizer import Equalizer, parse_equalizers
from .catalog import list_models, get_model, catalog_summary
from .device_info import BatteryReading, VersionReading, parse_batteries, parse_versions

__all__ = ["Packet", "ProtocolError", "FrameStream", "encode_frames",
           "WindowsRfcommTransport", "BleakTransport", "scan_ble", "inspect_gatt",
           "HeadsetClient", "WriteResult", "UnsupportedFeature", "DeviceRejected", "ReadbackMismatch",
           "Feature", "KeyBinding", "NoiseMode", "ModelProfile", "load_profile",
           "Equalizer", "parse_equalizers", "list_models", "get_model", "catalog_summary",
           "BatteryReading", "VersionReading", "parse_batteries", "parse_versions"]
