    public final DeviceInfo c(BluetoothDevice bluetoothDevice) {
        if (bluetoothDevice == null) {
            Q8.a.f("DeviceInfoManager", "checkGetDeviceInfo device is null!");
            return null;
        }
        DeviceInfo deviceInfoF = f(bluetoothDevice.getAddress());
        if (deviceInfoF != null) {
            return deviceInfoF;
        }
        WhitelistConfigDTO whitelistConfigDTOB = Y.b(bluetoothDevice, p8.a.C0313a.f31524a.b());
        a(whitelistConfigDTOB != null ? E.b(whitelistConfigDTOB.getId()) : 0, bluetoothDevice);
        return f(bluetoothDevice.getAddress());
    }
