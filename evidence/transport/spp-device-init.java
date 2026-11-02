    public d(Context context, DeviceInfo deviceInfo) {
        super(context, deviceInfo);
        this.f2660z = new H8.b.a(this);
        this.f2237E = false;
        this.f2238F = new a();
        this.f2239G = false;
        this.H = new b();
        DeviceInfoManager.a.f22177a.g(this.f1575c);
        int productId = deviceInfo.getProductId();
        p8.a aVar = p8.a.C0313a.f31524a;
        String deviceName = deviceInfo.getDeviceName();
        aVar.getClass();
        SupportDeviceConfig supportDeviceConfig = (SupportDeviceConfig) Optional.ofNullable(Y.a(aVar.b(), E.H(productId), deviceName)).map(new com.oplus.melody.model.repository.earphone.c(29)).orElse(null);
        if (supportDeviceConfig != null) {
            String uuid = supportDeviceConfig.getUuid();
            if (TextUtils.isEmpty(uuid)) {
                o(H8.b.f2659A);
            } else {
                o(UUID.fromString(uuid));
            }
        }
    }
