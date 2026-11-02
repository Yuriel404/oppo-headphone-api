    public final void f(MelodyJumpPreference melodyJumpPreference, String str, Integer num) {
        o oVar = this.f7785q;
        String string = null;
        if (oVar != null && num != null && num.intValue() == 7) {
            int iB = k.b(oVar.getIntelligentNoiseReductionModeIndex(), oVar.getNoiseReductionModeList());
            boolean zSupportStrongNoiseReductionRealTime = oVar.supportStrongNoiseReductionRealTime();
            Context context = this.f7781a;
            if (context != null) {
                if (iB == 3) {
                    string = zSupportStrongNoiseReductionRealTime ? context.getString(R.string.melody_common_lite_noise_reduction_tip_new_v3) : context.getString(R.string.melody_common_lite_noise_reduction_tip_new);
                } else if (iB == 4) {
                    string = zSupportStrongNoiseReductionRealTime ? context.getString(R.string.melody_common_depth_noise_reduction_tip_new_v3) : context.getString(R.string.melody_common_depth_noise_reduction_tip_new);
                } else if (iB == 8) {
                    string = zSupportStrongNoiseReductionRealTime ? context.getString(R.string.melody_common_middle_noise_reduction_tip_new_v3) : context.getString(R.string.melody_common_middle_noise_reduction_tip_new);
                }
            }
        }
        if (TextUtils.isEmpty(string)) {
            if (melodyJumpPreference != null) {
                melodyJumpPreference.setSummary(str);
            }
        } else if (melodyJumpPreference != null) {
            melodyJumpPreference.setSummary(string);
        }
    }
