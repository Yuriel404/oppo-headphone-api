    public static void b(int i10, int i11, int i12, byte[] bArr) {
        if (i12 <= 0 || i12 > 4 || bArr.length < i11 + i12) {
            throw new IndexOutOfBoundsException("Length must be between 0 and 4");
        }
        for (int i13 = 0; i13 < i12; i13++) {
            bArr[i11 + i13] = (byte) (i10 >>> (i13 * 8));
        }
    }
