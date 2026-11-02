    public static final int b(int i10, List<WhitelistConfigDTO.NoiseReductionMode> list) {
        if (i10 == -1 || list == null || com.oplus.melody.common.util.e.a(list)) {
            return 1;
        }
        for (WhitelistConfigDTO.NoiseReductionMode noiseReductionMode : list) {
            if (noiseReductionMode != null) {
                if (noiseReductionMode.getProtocolIndex() == i10) {
                    return noiseReductionMode.getModeType();
                }
                List<WhitelistConfigDTO.NoiseReductionMode> childrenMode = noiseReductionMode.getChildrenMode();
                if (childrenMode == null) {
                    childrenMode = Collections.EMPTY_LIST;
                }
                for (WhitelistConfigDTO.NoiseReductionMode noiseReductionMode2 : childrenMode) {
                    if (noiseReductionMode2.getProtocolIndex() == i10) {
                        return noiseReductionMode2.getModeType();
                    }
                }
            }
        }
        return 1;
    }
