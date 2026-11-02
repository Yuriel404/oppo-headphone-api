    public final void d() {
        CurrentNoiseModeDTO currentNoiseModeDTO = new CurrentNoiseModeDTO();
        int i10 = 1;
        currentNoiseModeDTO.setType(1);
        int i11 = this.f25675x;
        currentNoiseModeDTO.setCurrentNoiseReductionModeValue(0, false);
        currentNoiseModeDTO.setCurrentNoiseReductionModeValue(1, false);
        currentNoiseModeDTO.setCurrentNoiseReductionModeValue(2, false);
        currentNoiseModeDTO.setCurrentNoiseReductionModeValue(3, false);
        currentNoiseModeDTO.setCurrentNoiseReductionModeValue(4, false);
        if (i11 == 1) {
            currentNoiseModeDTO.setCurrentNoiseReductionModeValue(0, true);
        } else if (i11 == 2) {
            currentNoiseModeDTO.setCurrentNoiseReductionModeValue(1, true);
        } else if (i11 == 4) {
            currentNoiseModeDTO.setCurrentNoiseReductionModeValue(2, true);
        } else if (i11 == 8) {
            currentNoiseModeDTO.setCurrentNoiseReductionModeValue(3, true);
        } else if (i11 == 16) {
            currentNoiseModeDTO.setCurrentNoiseReductionModeValue(4, true);
        }
        int i12 = this.f25675x;
        if (i12 == 4 || i12 == 8 || i12 == 16) {
            Type type = MelodyAlivePreferencesHelper.f22321a;
            MelodyAlivePreferencesHelper.d(getContext()).edit().putInt("key_last_noise_reduction_mode", this.f25675x).apply();
        }
        NoiseReductionInfoDTO noiseReductionInfoDTO = this.f25670s;
        String address = this.f25669r.getAddress();
        if ((currentNoiseModeDTO.isNoiseReductionModeOpened(2) || currentNoiseModeDTO.isNoiseReductionModeOpened(3) || currentNoiseModeDTO.isNoiseReductionModeOpened(4)) && noiseReductionInfoDTO != null) {
            if (noiseReductionInfoDTO.isSupportNoiseReductionModeValue(2) || noiseReductionInfoDTO.isSupportNoiseReductionModeValue(3) || noiseReductionInfoDTO.isSupportNoiseReductionModeValue(4)) {
                noiseReductionInfoDTO.setSupportNoiseReductionModeValue(2, false);
                noiseReductionInfoDTO.setSupportNoiseReductionModeValue(3, false);
                noiseReductionInfoDTO.setSupportNoiseReductionModeValue(4, false);
                if (currentNoiseModeDTO.isNoiseReductionModeOpened(2)) {
                    noiseReductionInfoDTO.setSupportNoiseReductionModeValue(2, true);
                }
                if (currentNoiseModeDTO.isNoiseReductionModeOpened(3)) {
                    noiseReductionInfoDTO.setSupportNoiseReductionModeValue(3, true);
                }
                if (currentNoiseModeDTO.isNoiseReductionModeOpened(4)) {
                    noiseReductionInfoDTO.setSupportNoiseReductionModeValue(4, true);
                }
            }
            b.G().G0(k.f22410a, address, noiseReductionInfoDTO);
        }
        CompletableFuture<SetCommandStateDTO> completableFuture = this.f25668q;
        if (completableFuture != null) {
            completableFuture.cancel(true);
        }
        b bVarG = b.G();
        String address2 = this.f25669r.getAddress();
        int i13 = this.f25675x;
        if (i13 != 2) {
            if (i13 == 4) {
                i10 = 2;
            } else if (i13 != 8) {
                i10 = i13 != 16 ? 0 : 4;
            } else {
                i10 = 3;
            }
        }
        CompletableFuture<SetCommandStateDTO> completableFutureM0 = bVarG.m0(i10, address2);
        this.f25668q = completableFutureM0;
        if (completableFutureM0 != null) {
            completableFutureM0.thenAccept((Consumer<? super SetCommandStateDTO>) new w0(this, 11)).exceptionally((Function<Throwable, ? extends Void>) new j(this, 20));
        }
    }
