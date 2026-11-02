    @Override // java.util.function.Consumer
    public final void accept(Object obj) {
        switch (this.f24375a) {
            case 0:
                O o6 = (O) this.f24376b;
                EarphoneStatusDO earphoneStatusDO = (EarphoneStatusDO) this.f24377c;
                DeviceInfo deviceInfo = (DeviceInfo) this.f24378d;
                FeatureSwitchInfo featureSwitchInfo = (FeatureSwitchInfo) obj;
                o6.getClass();
                if (com.oplus.melody.common.util.y.l()) {
                    com.oplus.melody.common.util.y.b("EarphoneRepository", "refreshSwitch, featureSwitchInfo=" + featureSwitchInfo);
                }
                int status = featureSwitchInfo.getStatus();
                int i10 = status != 0 ? status != 1 ? -1 : 1 : 0;
                int featureType = featureSwitchInfo.getFeatureType();
                if (featureType != 4) {
                    if (featureType != 6) {
                        if (featureType != 9) {
                            if (featureType != 15) {
                                if (featureType != 17) {
                                    if (featureType != 33) {
                                        if (featureType != 61) {
                                            if (featureType != 39) {
                                                if (featureType != 40) {
                                                    if (featureType != 52) {
                                                        if (featureType != 53) {
                                                            switch (featureType) {
                                                                case 11:
                                                                    earphoneStatusDO.setHearingEnhanceUsageStatus(i10);
                                                                    break;
                                                                case 12:
                                                                    earphoneStatusDO.setPersonalNoiseStatus(i10);
                                                                    break;
                                                                case 13:
                                                                    earphoneStatusDO.setClickToTakePhotoStatus(i10);
                                                                    break;
                                                                default:
                                                                    switch (featureType) {
                                                                        case 19:
                                                                            earphoneStatusDO.setHeadsetSoundRecordStatus(i10);
                                                                            break;
                                                                        case 20:
                                                                            earphoneStatusDO.setVoiceAssistStatus(i10);
                                                                            break;
                                                                        case 21:
                                                                            earphoneStatusDO.setFreeDialogStatus(i10);
                                                                            break;
                                                                        case 22:
                                                                            earphoneStatusDO.setSafeRemindStatus(i10);
                                                                            break;
                                                                        case 23:
                                                                            earphoneStatusDO.setLongPowerModeStatus(i10);
                                                                            break;
                                                                        case 24:
                                                                            earphoneStatusDO.setHiQualityAudioStatus(i10);
                                                                            break;
                                                                        case 25:
                                                                            earphoneStatusDO.setVoiceCommandStatus(i10);
                                                                            break;
                                                                        default:
                                                                            switch (featureType) {
                                                                                case 27:
                                                                                    earphoneStatusDO.setSpatialSoundStatus(i10);
                                                                                    break;
                                                                                case 28:
                                                                                    earphoneStatusDO.setAutoVolumeStatus(i10);
                                                                                    break;
                                                                                case 29:
                                                                                    earphoneStatusDO.setBassEngineStatus(i10);
                                                                                    break;
                                                                                case 30:
                                                                                    earphoneStatusDO.setSaveLogStatus(i10);
                                                                                    break;
                                                                                default:
                                                                                    switch (featureType) {
                                                                                        case 48:
                                                                                            earphoneStatusDO.setAdaptiveVolume(i10);
                                                                                            break;
                                                                                        case 49:
                                                                                            earphoneStatusDO.setAdaptiveEar(i10);
                                                                                            break;
                                                                                        case 50:
                                                                                            earphoneStatusDO.setSpeechPerception(i10);
                                                                                            break;
                                                                                        default:
                                                                                            switch (featureType) {
                                                                                                case 55:
                                                                                                    earphoneStatusDO.setSwiftPair(i10);
                                                                                                    break;
                                                                                                case 56:
                                                                                                    earphoneStatusDO.setHearingOptimizeStatus(i10);
                                                                                                    break;
                                                                                                case 57:
                                                                                                    earphoneStatusDO.setVoiceIncomingCallControlStatus(i10);
                                                                                                    break;
                                                                                                case 58:
                                                                                                    earphoneStatusDO.setSleepDetection(i10);
                                                                                                    break;
                                                                                                case 59:
                                                                                                    earphoneStatusDO.setHeadMotion(i10);
                                                                                                    break;
                                                                                                default:
                                                                                                    com.oplus.melody.common.util.y.y("EarphoneRepository", "updateFeatureSwitchToStatus IGNORE " + featureSwitchInfo.getFeatureType());
                                                                                                    break;
                                                                                            }
                                                                                            break;
                                                                                    }
                                                                                    break;
                                                                            }
                                                                            break;
                                                                    }
                                                                    break;
                                                            }
                                                        } else {
                                                            earphoneStatusDO.setLongPressVolume(i10);
                                                            break;
                                                        }
                                                    } else {
                                                        earphoneStatusDO.setMicControl(i10);
                                                        if (i10 == 1) {
                                                            U8.Q.b.f6060a.execute(new T7.a(deviceInfo, 2));
                                                        }
                                                        break;
                                                    }
                                                } else {
                                                    earphoneStatusDO.setGameModeMainStatus(i10);
                                                    break;
                                                }
                                            } else {
                                                earphoneStatusDO.setGameSoundStatus(i10);
                                                break;
                                            }
                                        } else {
                                            earphoneStatusDO.setGmnAssistantSwitch(i10);
                                            com.oplus.melody.common.util.y.c("EarphoneRepository", new com.oplus.melody.btsdk.protocol.commands.j(i10, 21));
                                            if (i10 == 1) {
                                                HeyMelodyApplication heyMelodyApplication = com.oplus.melody.common.util.k.f22410a;
                                                g0.e.e(heyMelodyApplication, 1103, "param_address", deviceInfo.getDeviceAddress(), heyMelodyApplication);
                                            }
                                            break;
                                        }
                                    } else {
                                        earphoneStatusDO.setGameEqualizerStatus(i10);
                                        break;
                                    }
                                } else {
                                    earphoneStatusDO.setMultiConnectStatus(i10);
                                    break;
                                }
                            } else {
                                earphoneStatusDO.setZenModeStatus(i10);
                                break;
                            }
                        } else {
                            earphoneStatusDO.setVocalEnhanceStatus(i10);
                            break;
                        }
                    } else {
                        earphoneStatusDO.setGameModeStatus(i10);
                        break;
                    }
                } else {
                    earphoneStatusDO.setWearDetectionStatus(i10);
                    break;
                }
                break;
            default:
                va.m mVar = (va.m) this.f24376b;
                va.o oVar = (va.o) this.f24377c;
                String str = (String) this.f24378d;
                File file = (File) obj;
                mVar.getClass();
                int i11 = oVar.f33497c.get();
                int i12 = oVar.f33501g;
                com.oplus.melody.common.util.y.c("FirmwareRepository", new y(i11, i12, str, 3));
                int i13 = 0;
                if (i11 != 2) {
                    if (oVar.a(i11, 2)) {
                        mVar.v(file, str, 0);
                    }
                    break;
                } else if (i12 != 0) {
                    va.o oVarR = mVar.r(str);
                    oVarR.getClass();
                    com.oplus.melody.common.util.y.c("FirmwareRepositoryValueHolder", new va.n(oVarR, i13, 0));
                    oVarR.f33501g = 0;
                    HeyMelodyApplication heyMelodyApplication2 = com.oplus.melody.common.util.k.f22410a;
                    Intent intentJ = Wa.a.j(heyMelodyApplication2, DataTypeConstants.COMMON_BATCH);
                    intentJ.putExtra("param_upgrade_type", 0);
                    intentJ.putExtra("param_address", str);
                    Wa.a.N(heyMelodyApplication2, intentJ);
                    break;
                }
                break;
        }
    }
