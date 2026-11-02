    public static int d(byte[] bArr, int i10, int i11, boolean z10) {
        if (i11 <= 0 || i11 > 4 || bArr.length < i10 + i11) {
            throw new IndexOutOfBoundsException("Length must be between 0 and 4, src.len=" + bArr.length + ", length=" + i11);
        }
        int i12 = 0;
        for (int i13 = 0; i13 < i11; i13++) {
            i12 |= (bArr[(z10 ? i13 : (i11 - i13) - 1) + i10] & 255) << (i13 * 8);
        }
        return i12;
    }
