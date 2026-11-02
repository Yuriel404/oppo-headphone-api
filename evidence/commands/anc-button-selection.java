        @Override // com.oplus.melody.ui.widget.devicecontrol.DeviceControlWidget.a
        public final void c(ModeItem modeItem, boolean z10) {
            WhitelistConfigDTO.NoiseReductionMode noiseReductionMode;
            Context context = NoiseReductionItem.this.getContext();
            if (NoiseReductionItem.this.mNoiseReductionVO == null) {
                y.h(NoiseReductionItem.ITEM_NAME, "onButtonClick mNoiseReductionVO is null!");
                return;
            }
            if (NoiseReductionItem.this.mNoiseReductionVO.getConnectionState() != 2) {
                y.y(NoiseReductionItem.ITEM_NAME, "onButtonClick not connected!");
                return;
            }
            if (modeItem != null && z10) {
                if (!NoiseReductionItem.this.mNoiseReductionVO.isCapabilityReady()) {
                    y.y(NoiseReductionItem.ITEM_NAME, "onButtonClick isCapabilityReady is false!");
                    return;
                }
                modeItem.v(true);
                synchronized (NoiseReductionItem.this.mNoiseReductionModeList) {
                    try {
                        if (NoiseReductionItem.this.mNoiseReductionVO != null) {
                            EarStatusDTO earStatus = NoiseReductionItem.this.mNoiseReductionVO.getEarStatus();
                            if (y.l()) {
                                y.b(NoiseReductionItem.ITEM_NAME, "onButtonClick isSupportEarStatus() " + NoiseReductionItem.this.mNoiseReductionVO.isSupportEarStatus() + ", earStatus = " + earStatus);
                            }
                            if (NoiseReductionItem.this.mNoiseReductionVO.isSupportEarStatus() && earStatus != null && ((NoiseReductionItem.this.mNoiseReductionVO.isSupportWearStatus() && earStatus.bothNotInEar()) || (!NoiseReductionItem.this.mNoiseReductionVO.isSupportWearStatus() && earStatus.bothInBox()))) {
                                NoiseReductionItem noiseReductionItem = NoiseReductionItem.this;
                                noiseReductionItem.updateActionView(noiseReductionItem.mActionView, NoiseReductionItem.this.mNoiseReductionVO, NoiseReductionItem.this.mNoiseReductionVO.getCurrentNoiseReductionModeIndex());
                                Toast.makeText(context, R.string.melody_ui_detail_main_need_wear_earphone2, 0).show();
                                return;
                            }
                        }
                        int i10 = modeItem.getId() != null ? Integer.parseInt(modeItem.getId()) : -1;
                        if (i10 == -1) {
                            y.h(NoiseReductionItem.ITEM_NAME, "onButtonClick position is -1!");
                            return;
                        }
                        if (i10 < NoiseReductionItem.this.mNoiseReductionModeList.size() && (noiseReductionMode = (WhitelistConfigDTO.NoiseReductionMode) NoiseReductionItem.this.mNoiseReductionModeList.get(i10)) != null) {
                            if (NoiseReductionItem.this.mSetCommandFuture != null) {
                                NoiseReductionItem.this.mSetCommandFuture.cancel(true);
                            }
                            NoiseReductionItem noiseReductionItem2 = NoiseReductionItem.this;
                            noiseReductionItem2.mSetCommandFuture = b.G().m0(noiseReductionMode.getProtocolIndex(), noiseReductionItem2.mViewModel.f24786b);
                            if (NoiseReductionItem.this.mSetCommandFuture != null) {
                                NoiseReductionItem.this.mSetCommandFuture.thenAccept((Consumer) new Ya.f(this, context, noiseReductionMode, 1)).exceptionally((Function<Throwable, ? extends Void>) new F(1, this, context));
                            }
                            if (!NoiseReductionItem.this.mIsInTutorialGuide) {
                                g gVar = NoiseReductionItem.this.mChildModeManager;
                                gVar.d(gVar.f7807d.get(Integer.valueOf(i10)), null, gVar.f7810g);
                            }
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                }
            }
        }
