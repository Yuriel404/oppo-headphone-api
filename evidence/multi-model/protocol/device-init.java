    public static DeviceInfo e(BluetoothDevice bluetoothDevice, String str, int i10, String str2) {
        DeviceInfo deviceInfo = new DeviceInfo();
        deviceInfo.setProductType(101);
        deviceInfo.setDeviceAddress(str);
        deviceInfo.setDeviceName(str2);
        deviceInfo.setDevice(bluetoothDevice);
        deviceInfo.setProductId(i10);
        deviceInfo.setMTU(6000);
        deviceInfo.setDeviceConnectState(3);
        deviceInfo.setDeviceBondState(m.f6120d.c(bluetoothDevice));
        p8.a aVar = p8.a.C0313a.f31524a;
        aVar.getClass();
        SupportDeviceConfig supportDeviceConfig = (SupportDeviceConfig) Optional.ofNullable(Y.a(aVar.b(), E.H(i10), str2)).map(new c(29)).orElse(null);
        if (supportDeviceConfig == null) {
            StringBuilder sb2 = new StringBuilder("createDeviceInfo FAILURE by ");
            sb2.append(E.H(i10));
            sb2.append('(');
            y.a aVar2 = Q8.a.f5077a;
            sb2.append(y.q(str2));
            sb2.append(')');
            Q8.a.g("DeviceInfoManager", sb2.toString(), str);
            return deviceInfo;
        }
        if (TextUtils.isEmpty(str2)) {
            deviceInfo.setDeviceName(supportDeviceConfig.getName());
        }
        deviceInfo.setType(supportDeviceConfig.getType());
        deviceInfo.setIsSupportSpp(supportDeviceConfig.isSupportSpp());
        StringBuilder sb3 = new StringBuilder("createDeviceInfo SUCCESS by ");
        sb3.append(E.H(i10));
        sb3.append('(');
        String deviceName = deviceInfo.getDeviceName();
        y.a aVar3 = Q8.a.f5077a;
        sb3.append(y.q(deviceName));
        sb3.append(')');
        Q8.a.n("DeviceInfoManager", sb3.toString(), str);
        return deviceInfo;
    }
