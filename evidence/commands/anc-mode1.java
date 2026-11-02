    private boolean isNoiseReductionModeSupported(WhitelistConfigDTO.NoiseReductionMode noiseReductionMode, NoiseReductionInfoDTO noiseReductionInfoDTO) {
        if (noiseReductionMode == null || (noiseReductionMode.getDecideByEarDevice() && (noiseReductionInfoDTO == null || !noiseReductionInfoDTO.isSupportNoiseReductionModeValue(noiseReductionMode.getProtocolIndex())))) {
            y.c(ITEM_NAME, new h(noiseReductionMode, 22));
            return false;
        }
        noiseReductionMode.getModeType();
        return true;
    }
