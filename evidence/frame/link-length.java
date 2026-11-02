    public static int b(byte[] bArr) {
        int i10 = 0;
        int i11 = 0;
        int i12 = 0;
        while (true) {
            i10++;
            byte b10 = bArr[i10];
            if ((b10 & 128) == 0) {
                return ((b10 & 127) << (i12 * 7)) | i11;
            }
            i11 |= (b10 & 127) << (i12 * 7);
            i12++;
        }
    }
