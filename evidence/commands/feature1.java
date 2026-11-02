    public boolean copyIntoData(byte[] bArr, int i10) {
        if (i10 + 4 > bArr.length) {
            c.d(A0.k(i10, "The length of data is not valid. offset = ", ", len = "), bArr.length, TAG);
            return false;
        }
        bArr[i10] = (byte) this.mDeviceType;
        bArr[i10 + 1] = (byte) this.mButton;
        bArr[i10 + 2] = (byte) this.mButtonAction;
        bArr[i10 + 3] = (byte) this.mFunction;
        return true;
    }
