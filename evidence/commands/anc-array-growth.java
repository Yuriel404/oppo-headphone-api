    private void growArray(int i10) {
        this.mOpenNoiseReductionMode = Arrays.copyOf(this.mOpenNoiseReductionMode, ((i10 / 8) + 1) * 8);
    }
