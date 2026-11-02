    /* JADX INFO: Access modifiers changed from: private */
    public void updateActionView(DeviceControlWidget deviceControlWidget, o oVar, int i10) {
        Context context = getContext();
        List<WhitelistConfigDTO.NoiseReductionMode> noiseReductionModeList = oVar.getNoiseReductionModeList();
        NoiseReductionInfoDTO supportNoiseReductionInfo = oVar.getSupportNoiseReductionInfo();
        y.c(ITEM_NAME, new M(noiseReductionModeList, 3));
        if (!e.a(noiseReductionModeList)) {
            int iB = k.b(i10, noiseReductionModeList);
            y.c(ITEM_NAME, new l(iB, 14));
            HashMap map = new HashMap();
            for (WhitelistConfigDTO.NoiseReductionMode noiseReductionMode : noiseReductionModeList) {
                if (noiseReductionMode != null) {
                    map.put(Integer.valueOf(noiseReductionMode.getModeType()), noiseReductionMode);
                }
            }
            synchronized (this.mNoiseReductionModeList) {
                try {
                    this.mNoiseReductionModeList.clear();
                    ArrayList arrayList = new ArrayList();
                    ArrayList<Integer> arrayListA = Ma.y.a(oVar.getNoiseReductionUIVersion());
                    int size = arrayListA.size();
                    int i11 = 0;
                    int i12 = 0;
                    while (i12 < size) {
                        int i13 = i12 + 1;
                        int iIntValue = arrayListA.get(i12).intValue();
                        boolean z10 = true;
                        if (iIntValue == 4 && map.containsKey(4)) {
                            WhitelistConfigDTO.NoiseReductionMode noiseReductionMode2 = (WhitelistConfigDTO.NoiseReductionMode) map.get(4);
                            if (isNoiseReductionModeSupported(noiseReductionMode2, supportNoiseReductionInfo)) {
                                Drawable drawableT = Wa.a.t(context, R.drawable.melody_ui_reduction_noise_strong);
                                String string = context.getString(R.string.melody_ui_noise_reduction_action_strong_reduction);
                                if (iB != 4) {
                                    z10 = false;
                                }
                                arrayList.add(createModeItem(context, i11, drawableT, string, z10, false));
                                this.mNoiseReductionModeList.add(noiseReductionMode2);
                                i11++;
                            }
                        } else if (iIntValue == 3 && map.containsKey(3)) {
                            WhitelistConfigDTO.NoiseReductionMode noiseReductionMode3 = (WhitelistConfigDTO.NoiseReductionMode) map.get(3);
                            if (isNoiseReductionModeSupported(noiseReductionMode3, supportNoiseReductionInfo)) {
                                Drawable drawableT2 = Wa.a.t(context, R.drawable.melody_ui_reduction_noise_weak);
                                String string2 = context.getString(R.string.melody_ui_noise_reduction_action_weak_reduction);
                                if (iB != 3) {
                                    z10 = false;
                                }
                                arrayList.add(createModeItem(context, i11, drawableT2, string2, z10, false));
                                this.mNoiseReductionModeList.add(noiseReductionMode3);
                                i11++;
                            }
                        } else if (iIntValue == 5 && map.containsKey(5)) {
                            WhitelistConfigDTO.NoiseReductionMode noiseReductionMode4 = (WhitelistConfigDTO.NoiseReductionMode) map.get(5);
                            if (isNoiseReductionModeSupported(noiseReductionMode4, supportNoiseReductionInfo)) {
                                arrayList.add(createModeItem(context, i11, Wa.a.t(context, R.drawable.melody_ui_reduction_noise_strong), context.getString(R.string.melody_ui_noise_reduction_action_reduction), k.c(noiseReductionMode4, iB), false));
                                this.mNoiseReductionModeList.add(noiseReductionMode4);
                                i11++;
                            }
                        } else if (iIntValue == 10 && map.containsKey(10)) {
                            WhitelistConfigDTO.NoiseReductionMode noiseReductionMode5 = (WhitelistConfigDTO.NoiseReductionMode) map.get(10);
                            if (isNoiseReductionModeSupported(noiseReductionMode5, supportNoiseReductionInfo)) {
                                arrayList.add(createModeItem(context, i11, Wa.a.t(context, R.drawable.melody_ui_reduction_noise_adaptive), context.getString(R.string.melody_common_noise_reduction_action_auto), k.c(noiseReductionMode5, iB), false));
                                this.mNoiseReductionModeList.add(noiseReductionMode5);
                                i11++;
                            }
                        } else if (iIntValue == 1 && map.containsKey(1)) {
                            WhitelistConfigDTO.NoiseReductionMode noiseReductionMode6 = (WhitelistConfigDTO.NoiseReductionMode) map.get(1);
                            if (isNoiseReductionModeSupported(noiseReductionMode6, supportNoiseReductionInfo)) {
                                Drawable drawableT3 = Wa.a.t(context, R.drawable.melody_ui_reduction_noise_close);
                                String string3 = context.getString(R.string.melody_ui_noise_reduction_action_close_reduction);
                                if (iB != 1) {
                                    z10 = false;
                                }
                                arrayList.add(createModeItem(context, i11, drawableT3, string3, z10, false));
                                this.mNoiseReductionModeList.add(noiseReductionMode6);
                                i11++;
                            }
                        } else if (iIntValue == 2 && map.containsKey(2)) {
                            WhitelistConfigDTO.NoiseReductionMode noiseReductionMode7 = (WhitelistConfigDTO.NoiseReductionMode) map.get(2);
                            if (isNoiseReductionModeSupported(noiseReductionMode7, supportNoiseReductionInfo)) {
                                arrayList.add(createModeItem(context, i11, Wa.a.t(context, R.drawable.melody_ui_reduction_noise_transparent), context.getString(R.string.melody_ui_noise_reduction_action_pass_through_reduction), k.c(noiseReductionMode7, iB), false));
                                this.mNoiseReductionModeList.add(noiseReductionMode7);
                                i11++;
                            }
                        } else if (iIntValue == 6 && map.containsKey(6)) {
                            WhitelistConfigDTO.NoiseReductionMode noiseReductionMode8 = (WhitelistConfigDTO.NoiseReductionMode) map.get(6);
                            if (isNoiseReductionModeSupported(noiseReductionMode8, supportNoiseReductionInfo)) {
                                Drawable drawableT4 = Wa.a.t(context, R.drawable.melody_ui_reduction_noise_transparent);
                                String string4 = context.getString(R.string.melody_ui_noise_reduction_action_pass_through_reduction_voice);
                                if (iB != 6) {
                                    z10 = false;
                                }
                                arrayList.add(createModeItem(context, i11, drawableT4, string4, z10, false));
                                this.mNoiseReductionModeList.add(noiseReductionMode8);
                            }
                        }
                        i12 = i13;
                    }
                    if (!this.mIsInTutorialGuide) {
                        this.mChildModeManager.a(this.mNoiseReductionModeList, iB, oVar);
                    }
                    if (y.l()) {
                        y.b(ITEM_NAME, "updateActionView noiseItemList = " + arrayList);
                    }
                    if (arrayList.size() > 0) {
                        deviceControlWidget.b(arrayList);
                    }
                } catch (Throwable th) {
                    throw th;
                }
            }
        }
        setItemSoundEffectDisabled();
    }
