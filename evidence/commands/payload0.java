    public byte[] getData() {
        byte[] bArr = new byte[0];
        if (!isModeBitmaskType(this.mType)) {
            int i10 = this.mType;
            return i10 == 2 ? new byte[]{1, (byte) i10, (byte) this.mLevel} : bArr;
        }
        int length = (this.mOpenNoiseReductionMode.length - 1) / 8;
        int i11 = length + 1;
        byte[] bArr2 = new byte[length + 3];
        bArr2[0] = 1;
        bArr2[1] = (byte) this.mType;
        byte[] bArr3 = new byte[i11];
        int i12 = 0;
        byte b10 = 0;
        int i13 = 0;
        int i14 = 0;
        while (true) {
            boolean[] zArr = this.mOpenNoiseReductionMode;
            if (i12 >= zArr.length) {
                System.arraycopy(bArr3, 0, bArr2, 2, i11);
                return bArr2;
            }
            b10 = (byte) (b10 | (zArr[i12] ? 1 << i13 : 0));
            i13++;
            if (i13 == 8) {
                bArr3[i14] = b10;
                i14++;
                b10 = 0;
                i13 = 0;
            }
            i12++;
        }
    }
