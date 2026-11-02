    public final void a(int i10, BluetoothDevice bluetoothDevice) {
        String address = bluetoothDevice.getAddress();
        if (i10 <= 0) {
            Q8.a.d("DeviceInfoManager", new o(i10, 17), address);
            return;
        }
        if (b.k(address)) {
            Q8.a.g("DeviceInfoManager", "addBluetoothDeviceWithProductId isLeOnlyDevice" + i10, address);
        } else if (this.f22176a.containsKey(address)) {
            Q8.a.b("DeviceInfoManager", "addBluetoothDeviceWithProductId: The device is already exists", address);
        } else {
            b(e(bluetoothDevice, address, i10, m.f6120d.f(bluetoothDevice)));
        }
    }
