# Enco Free4 reference SDK

See ../配置流程与API方案.md and ../API参考.md for the Chinese workflow, protocol sources, hardware limits and API examples.

Requires Python 3.11+. RFCOMM uses the standard library on Windows. The optional BLE transport uses Bleak and has not been hardware-validated.

From this directory:

~~~powershell
python -m enco_free4 --help
python -m enco_free4 profile
python -m unittest discover -s tests -v
~~~

Read your paired device's state, after replacing the placeholder classic MAC:

~~~powershell
python -m enco_free4 --address AA:BB:CC:DD:EE:FF --output before.json snapshot
~~~

Optional installation in an isolated environment:

~~~powershell
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install .
# For BLE instead:
.\.venv\Scripts\python.exe -m pip install '.[ble]'
~~~

Examples are explicit scripts. Importing the package performs no Bluetooth operations. Unit tests use offline vectors and a fake transport. On 2026-10-26, Windows RFCOMM capability/feature reads and game-mode on/off were validated on the user's Free4, with the original off state restored. Live timing and selected, privacy-filtered frames are in ../diagnostics/; see its README for omissions. Other features and persistence still need hardware validation.

Version 0.1.1 polls feature state after a successful write ACK (3-second polling window, 0.2-second interval), because firmware can briefly report the previous state. It sends the setting once. Each query has its own application reply timeout. Use --verify-timeout 5 before set-feature for a longer window.

These are independent subcommands:

~~~powershell
python -m enco_free4 --address AA:BB:CC:DD:EE:FF set-feature game_mode on
python -m enco_free4 --address AA:BB:CC:DD:EE:FF set-noise deep
python -m enco_free4 --address AA:BB:CC:DD:EE:FF keys
~~~
