    public m(Context context, DeviceInfo deviceInfo) {
        super(context, deviceInfo);
        this.f1904D = false;
        this.f1905E = new a();
        DeviceInfoManager deviceInfoManager = DeviceInfoManager.a.f22177a;
        BluetoothDevice bluetoothDevice = this.f1575c;
        deviceInfoManager.g(bluetoothDevice);
        if (bluetoothDevice != null) {
            this.f1903C = n8.b.b(bluetoothDevice.getAddress());
        }
        int productId = deviceInfo.getProductId();
        p8.a aVar = p8.a.C0313a.f31524a;
        String deviceName = deviceInfo.getDeviceName();
        aVar.getClass();
        SupportDeviceConfig supportDeviceConfig = (SupportDeviceConfig) Optional.ofNullable(Y.a(aVar.b(), E.H(productId), deviceName)).map(new com.oplus.melody.model.repository.earphone.c(29)).orElse(null);
        if (supportDeviceConfig != null) {
            String uuid = supportDeviceConfig.getUuid();
            if (TextUtils.isEmpty(uuid)) {
                this.f1906z = f1898F;
            } else {
                this.f1906z = UUID.fromString(uuid);
            }
        }
        Q8.a.c("m_bt_le.GattDevice", new E8.d(this, 1));
    }
