    public a(byte[] bArr) throws SDKException {
        this.f33775e = 101;
        int length = bArr.length - 5;
        if (length < 0) {
            throw new SDKException();
        }
        int iD = d.d(bArr, 0, 2, true);
        this.f33771a = iD;
        this.f33772b = bArr[2] & 255;
        int iD2 = d.d(bArr, 3, 2, true);
        if (iD2 > length) {
            this.f33773c = length;
            String str = String.format(Locale.CHINA, "检测到包长度错误：cmd=%04x expect %d but %d", Integer.valueOf(iD), Integer.valueOf(iD2), Integer.valueOf(length));
            y.a aVar = Q8.a.f5077a;
            y.x("Packet", str, null);
        } else {
            this.f33773c = iD2;
        }
        byte[] bArr2 = new byte[length];
        this.f33774d = bArr2;
        if (length > 0) {
            System.arraycopy(bArr, 5, bArr2, 0, length);
        }
    }
