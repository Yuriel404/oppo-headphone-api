    public int getSetCommandByteLength() {
        int[] iArr = this.mFrequency;
        int length = iArr != null ? iArr.length * 2 : 0;
        int[] iArr2 = this.mDbValue;
        int length2 = iArr2 != null ? iArr2.length : 0;
        this.mNameLength = 0;
        if (!TextUtils.isEmpty(this.mName)) {
            this.mNameLength = this.mName.getBytes(StandardCharsets.UTF_8).length;
        }
        return this.mNameLength + 5 + length + length2;
    }
