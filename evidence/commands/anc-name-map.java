/* JADX INFO: compiled from: NoiseReductionContentUtils.kt */
/* JADX INFO: loaded from: classes3.dex */
public final class k {
    public static final String a(Context context, Integer num) {
        if (context == null) {
            return null;
        }
        if (num != null && num.intValue() == 7) {
            return context.getString(R.string.melody_common_intelligent_noise_reduction_title_v2);
        }
        if (num != null && num.intValue() == 4) {
            return context.getString(R.string.melody_common_depth_noise_reduction_title);
        }
        if (num != null && num.intValue() == 8) {
            return context.getString(R.string.melody_common_middle_noise_reduction_title);
        }
        if (num != null && num.intValue() == 3) {
            return context.getString(R.string.melody_common_lite_noise_reduction_title);
        }
        return null;
    }
