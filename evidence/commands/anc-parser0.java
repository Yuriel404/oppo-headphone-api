    public NoiseReductionInfo(int i10, byte[] bArr) {
        int i11 = i10 + 1;
        this.mAction = bArr[i10];
        int i12 = i10 + 2;
        this.mType = bArr[i11];
        if (i12 < bArr.length) {
            this.mValue = d.d(bArr, i12, Math.min(4, bArr.length - i12), true);
        }
    }
