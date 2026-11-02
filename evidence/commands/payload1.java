    public CurrentNoiseModeInfo(int i10, byte[] bArr) {
        this.mOpenNoiseReductionMode = new boolean[8];
        byte b10 = bArr[i10];
        this.mType = b10;
        if (!isModeBitmaskType(b10)) {
            if (this.mType == 2) {
                this.mLevel = bArr[i10 + 1];
                return;
            }
            return;
        }
        int length = (bArr.length - i10) - 1;
        int i11 = length * 8;
        this.mOpenNoiseReductionMode = new boolean[i11];
        int i12 = i10 + 1;
        byte b11 = bArr[i12];
        int i13 = 0;
        int i14 = 0;
        for (int i15 = 0; i15 < i11; i15++) {
            this.mOpenNoiseReductionMode[i15] = ((1 << i13) & b11) != 0;
            i13++;
            if (i13 == 8) {
                i14++;
                b11 = i14 < length ? bArr[i12 + i14] : b11;
                i13 = 0;
            }
        }
    }
