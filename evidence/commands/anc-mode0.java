    private String getNoiseReductionModeName(int i10) {
        DeviceControlWidget deviceControlWidget;
        if (this.mNoiseReductionModeList.isEmpty()) {
            return null;
        }
        for (int i11 = 0; i11 < this.mNoiseReductionModeList.size() - 1; i11++) {
            if (this.mNoiseReductionModeList.get(i11).getModeType() == i10 && (deviceControlWidget = this.mActionView) != null && deviceControlWidget.getModeList().size() > i11) {
                return this.mActionView.getModeList().get(i11).getName();
            }
        }
        return null;
    }
