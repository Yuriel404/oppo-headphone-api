    public void setCurrentNoiseReductionModeValue(int i10, boolean z10) {
        if (i10 >= this.mOpenNoiseReductionMode.length) {
            growArray(i10);
        }
        this.mOpenNoiseReductionMode[i10] = z10;
    }
