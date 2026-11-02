    @Override // java.util.function.Supplier
    public final Object get() {
        switch (this.f24379a) {
            case 0:
                String str = this.f24382d;
                int i10 = this.f24380b;
                int i11 = this.f24381c;
                HeyMelodyApplication heyMelodyApplication = com.oplus.melody.common.util.k.f22410a;
                Intent intentJ = Wa.a.j(heyMelodyApplication, ab.A.DEFAULT_VIDEO_HEIGHT);
                intentJ.putExtra("param_address", str);
                intentJ.putExtra("param_type", i10);
                intentJ.putExtra("param_value", i11);
                Wa.a.N(heyMelodyApplication, intentJ);
                return new U8.T(5L, TimeUnit.SECONDS);
            case 1:
                int i12 = this.f24380b;
                int i13 = this.f24381c;
                String str2 = this.f24382d;
                CurrentNoiseModeInfo currentNoiseModeInfo = new CurrentNoiseModeInfo();
                currentNoiseModeInfo.setType(i12);
                currentNoiseModeInfo.setCurrentNoiseReductionModeValue(i13, true);
                HeyMelodyApplication heyMelodyApplication2 = com.oplus.melody.common.util.k.f22410a;
                Intent intentJ2 = Wa.a.j(heyMelodyApplication2, 1014);
                intentJ2.putExtra("param_address", str2);
                intentJ2.putExtra("param_current_noise_mode_info", currentNoiseModeInfo);
                Wa.a.N(heyMelodyApplication2, intentJ2);
                return new U8.T(5L, TimeUnit.SECONDS);
            case 2:
                return "downloadFetchResource productId=" + this.f24382d + ", color=" + this.f24380b + ", modelId=" + this.f24381c;
            case 3:
                StringBuilder sb2 = new StringBuilder("startForegroundUpgrade upgradeStatus=");
                sb2.append(this.f24380b);
                sb2.append(" upgradeType=");
                sb2.append(this.f24381c);
                sb2.append(" address=");
                return k1.l(sb2, this.f24382d);
            default:
                StringBuilder sb3 = new StringBuilder("handleBinauralRecordConnectionStateChanged state = ");
                sb3.append(this.f24380b);
                sb3.append(", preState = ");
                sb3.append(this.f24381c);
                sb3.append(", address = ");
                com.oplus.melody.common.util.y.a aVar = Q8.a.f5077a;
                return k1.l(sb3, this.f24382d);
        }
    }
