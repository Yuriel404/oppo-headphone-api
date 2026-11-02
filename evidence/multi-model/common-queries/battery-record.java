    public BatteryInfo(int i10, byte[] bArr) {
        this.mDeviceType = bArr[i10];
        byte b10 = bArr[i10 + 1];
        this.mLevel = b10 & 127;
        this.mCharging = (b10 & 128) == 0 ? 0 : 1;
    }
