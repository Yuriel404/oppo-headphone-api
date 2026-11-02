    public final boolean isSupportNoiseReductionModeValue(int index) {
        return ((1 << index) & this.value) != 0;
    }
