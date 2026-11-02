    /* JADX WARN: Code duplicated, block: B:30:0x0085  */
    /* JADX WARN: Code duplicated, block: B:32:0x0099  */
    /* JADX WARN: Code duplicated, block: B:33:0x009f  */
    /* JADX WARN: Code duplicated, block: B:35:0x00a3  */
    /* JADX WARN: Code duplicated, block: B:36:0x00a9 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:37:0x00ab  */
    public final void h() {
        int i10;
        long jElapsedRealtime = SystemClock.elapsedRealtime() - this.f25674w;
        if (jElapsedRealtime < 1000) {
            y.y("NoiseReductionButtonSeekBarView", "switchToCurrentMode interval too short, return! duration=" + jElapsedRealtime);
            return;
        }
        CurrentNoiseModeDTO currentNoiseModeDTO = this.f25671t;
        if (currentNoiseModeDTO == null) {
            y.h("NoiseReductionButtonSeekBarView", "switchToCurrentMode mCurrentNoiseReductionInfo is null, return!");
            return;
        }
        if (currentNoiseModeDTO.isNoiseReductionModeOpened(2)) {
            this.f25666c.setThumbIndex(0);
        } else if (this.f25671t.isNoiseReductionModeOpened(3)) {
            this.f25666c.setThumbIndex(2);
        } else if (this.f25671t.isNoiseReductionModeOpened(4)) {
            this.f25666c.setThumbIndex(1);
        } else {
            NoiseReductionInfoDTO noiseReductionInfoDTO = this.f25670s;
            if (noiseReductionInfoDTO == null) {
                Type type = MelodyAlivePreferencesHelper.f22321a;
                i10 = MelodyAlivePreferencesHelper.d(getContext()).getInt("key_last_noise_reduction_mode", 16);
                if (i10 == 4) {
                    this.f25666c.setThumbIndex(0);
                } else if (i10 == 8) {
                    this.f25666c.setThumbIndex(2);
                } else if (i10 == 16) {
                    this.f25666c.setThumbIndex(1);
                }
            } else if (noiseReductionInfoDTO.isSupportNoiseReductionModeValue(2)) {
                this.f25666c.setThumbIndex(0);
            } else if (this.f25670s.isSupportNoiseReductionModeValue(3)) {
                this.f25666c.setThumbIndex(2);
            } else if (this.f25670s.isSupportNoiseReductionModeValue(4)) {
                this.f25666c.setThumbIndex(1);
            } else {
                Type type2 = MelodyAlivePreferencesHelper.f22321a;
                i10 = MelodyAlivePreferencesHelper.d(getContext()).getInt("key_last_noise_reduction_mode", 16);
                if (i10 == 4) {
                    this.f25666c.setThumbIndex(0);
                } else if (i10 == 8) {
                    this.f25666c.setThumbIndex(2);
                } else if (i10 == 16) {
                    this.f25666c.setThumbIndex(1);
                }
            }
        }
        if (this.f25671t.isNoiseReductionModeOpened(0)) {
            g(1);
            return;
        }
        if (this.f25671t.isNoiseReductionModeOpened(1)) {
            g(2);
            return;
        }
        g(0);
        boolean zIsNoiseReductionModeOpened = this.f25671t.isNoiseReductionModeOpened(2);
        c cVar = this.f25664a;
        if (zIsNoiseReductionModeOpened) {
            cVar.a(0);
        } else if (this.f25671t.isNoiseReductionModeOpened(4)) {
            cVar.a(1);
        } else if (this.f25671t.isNoiseReductionModeOpened(3)) {
            cVar.a(2);
        }
    }
