    /* JADX WARN: Code duplicated, block: B:213:0x048a  */
    /* JADX WARN: Code duplicated, block: B:268:0x060a  */
    /* JADX WARN: Code duplicated, block: B:269:0x0611  */
    /* JADX WARN: Code duplicated, block: B:281:0x064a  */
    /* JADX WARN: Code duplicated, block: B:283:0x0650  */
    /* JADX WARN: Code duplicated, block: B:53:0x012b  */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r19v0, types: [com.oplus.melody.btsdk.protocol.commands.i] */
    /* JADX WARN: Type inference failed for: r2v24 */
    /* JADX WARN: Type inference failed for: r2v25, types: [int] */
    /* JADX WARN: Type inference failed for: r2v29 */
    @SuppressLint({"SwitchIntDef"})
    public final void b(String str, int i10, byte[] bArr, w8.a aVar) {
        UserInteractionEventInfo userInteractionEventInfo;
        byte b10;
        int i11;
        ConnectDevicesInfo connectDevicesInfo;
        int i12;
        ?? r10;
        byte[] bArr2;
        byte[] bytes;
        HeadMotionTryResult headMotionTryResult;
        int iD;
        ArrayList arrayList;
        byte b11;
        byte b12;
        PersonalizedNoiseReductionResult personalizedNoiseReductionResult;
        byte b13 = bArr[i10];
        int i13 = i10 + 1;
        Q8.a.c("NotificationCommandManager", new F(b13, 23));
        boolean z10 = true;
        int i14 = 6;
        int iD2 = -1;
        Handler handler = this.f22223a;
        switch (b13) {
            case -15:
                if (bArr.length > i13) {
                    if (bArr.length < i10 + 6) {
                        g0.c.d(new StringBuilder("Length is not valid when receive user interaction event info, length = "), bArr.length, "CommandUtil");
                    } else {
                        userInteractionEventInfo = new UserInteractionEventInfo(i13, bArr);
                    }
                    if (userInteractionEventInfo == null) {
                        handler.obtainMessage(19, new Pair(str, userInteractionEventInfo)).sendToTarget();
                    } else {
                        Q8.a.f("NotificationCommandManager", "parse user interaction event info error. eventInfo is null");
                    }
                } else {
                    Q8.a.a("CommandUtil", "The length of data is not valid when parse user interaction info");
                }
                userInteractionEventInfo = null;
                if (userInteractionEventInfo == null) {
                    handler.obtainMessage(19, new Pair(str, userInteractionEventInfo)).sendToTarget();
                } else {
                    Q8.a.f("NotificationCommandManager", "parse user interaction event info error. eventInfo is null");
                }
                break;
            case -14:
                if (bArr.length > i13) {
                    int i15 = i10 + 2;
                    int i16 = bArr[i13] & 255;
                    if (i16 > 0) {
                        ArrayList arrayList2 = new ArrayList(i16);
                        int i17 = 0;
                        while (true) {
                            if (i17 >= i16) {
                                b10 = b13;
                                i11 = 0;
                                ConnectDevicesInfo connectDevicesInfo2 = new ConnectDevicesInfo();
                                try {
                                    connectDevicesInfo2.setList(arrayList2);
                                    connectDevicesInfo2.setAddress(str);
                                    connectDevicesInfo = connectDevicesInfo2;
                                } catch (Exception e3) {
                                    e = e3;
                                    connectDevicesInfo = connectDevicesInfo2;
                                    Q8.a.f("CommandUtil", "parseConnectDevicesInfo throws Exception: " + e);
                                }
                                if (connectDevicesInfo == null) {
                                    Q8.a.f("NotificationCommandManager", "parse earphone connect devices info event error. status value is -1");
                                    i12 = 1;
                                } else {
                                    handler.obtainMessage(39, connectDevicesInfo).sendToTarget();
                                    i12 = i11;
                                }
                                d(i12, b10, null, str, aVar);
                            } else {
                                int i18 = i15 + 6;
                                try {
                                    if (i18 > bArr.length) {
                                        Q8.a.f("CommandUtil", "parseConnectDevicesInfo addr error i:" + i17 + " offset:" + i15 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                                    } else {
                                        try {
                                            int i19 = i16;
                                            String strD = J.d(bArr, i15, i14, true, ":");
                                            int i20 = i15 + 8;
                                            int i21 = i14;
                                            if (i20 <= bArr.length) {
                                                int iD3 = n7.d.d(bArr, i18, 2, true);
                                                int i22 = i15 + 9;
                                                if (i22 > bArr.length) {
                                                    Q8.a.f("CommandUtil", "parseConnectDevicesInfo nameLen error i:" + i17 + " offset:" + i20 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                                                } else {
                                                    int iD4 = n7.d.d(bArr, i20, 1, true);
                                                    i15 = i22 + iD4;
                                                    b10 = b13;
                                                    try {
                                                        if (i15 > bArr.length) {
                                                            Q8.a.f("CommandUtil", "parseConnectDevicesInfo name error i:" + i17 + " offset:" + i22 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                                                            break;
                                                        } else {
                                                            byte[] bArr3 = new byte[iD4];
                                                            i11 = 0;
                                                            try {
                                                                System.arraycopy(bArr, i22, bArr3, 0, iD4);
                                                                arrayList2.add(new ConnectDevice(strD, iD3, bArr3, iD4));
                                                                i17++;
                                                                i16 = i19;
                                                                i14 = i21;
                                                                b13 = b10;
                                                            } catch (Exception e10) {
                                                                e = e10;
                                                            }
                                                        }
                                                    } catch (Exception e11) {
                                                        e = e11;
                                                        i11 = 0;
                                                        connectDevicesInfo = null;
                                                        Q8.a.f("CommandUtil", "parseConnectDevicesInfo throws Exception: " + e);
                                                    }
                                                }
                                                i11 = 0;
                                                connectDevicesInfo = null;
                                                if (connectDevicesInfo == null) {
                                                    Q8.a.f("NotificationCommandManager", "parse earphone connect devices info event error. status value is -1");
                                                    i12 = 1;
                                                } else {
                                                    handler.obtainMessage(39, connectDevicesInfo).sendToTarget();
                                                    i12 = i11;
                                                }
                                                d(i12, b10, null, str, aVar);
                                            } else {
                                                Q8.a.f("CommandUtil", "parseConnectDevicesInfo connect times error i:" + i17 + " offset:" + i18 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                                            }
                                        } catch (Exception e12) {
                                            e = e12;
                                            b10 = b13;
                                        }
                                    }
                                } catch (Exception e13) {
                                    e = e13;
                                    b10 = b13;
                                }
                            }
                            e = e10;
                            connectDevicesInfo = null;
                            Q8.a.f("CommandUtil", "parseConnectDevicesInfo throws Exception: " + e);
                            if (connectDevicesInfo == null) {
                                Q8.a.f("NotificationCommandManager", "parse earphone connect devices info event error. status value is -1");
                                i12 = 1;
                            } else {
                                handler.obtainMessage(39, connectDevicesInfo).sendToTarget();
                                i12 = i11;
                            }
                            d(i12, b10, null, str, aVar);
                        }
                    } else {
                        g0.c.d(A0.k(i16, "parseConnectDevicesInfo error number: ", ", length = "), bArr.length, "CommandUtil");
                    }
                } else {
                    Q8.a.c("CommandUtil", new a(bArr, 0));
                }
                b10 = b13;
                i11 = 0;
                connectDevicesInfo = null;
                if (connectDevicesInfo == null) {
                    Q8.a.f("NotificationCommandManager", "parse earphone connect devices info event error. status value is -1");
                    i12 = 1;
                } else {
                    handler.obtainMessage(39, connectDevicesInfo).sendToTarget();
                    i12 = i11;
                }
                d(i12, b10, null, str, aVar);
                break;
            case -13:
            case -6:
            case -5:
            case -4:
            case -3:
            case ListPopupWindow.WRAP_CONTENT /* -2 */:
            case -1:
            case 0:
            case 7:
            case 12:
            default:
                Q8.a.c("NotificationCommandManager", new r0(b13, 25));
                break;
            case -12:
                try {
                    int length = bArr.length - i13;
                    Charset charset = StandardCharsets.UTF_8;
                    String str2 = new String(bArr, i13, length, charset);
                    DiagnosisJsonDataInfo diagnosisJsonDataInfo = new DiagnosisJsonDataInfo();
                    diagnosisJsonDataInfo.setAddress(str);
                    diagnosisJsonDataInfo.setJsonData(str2);
                    handler.obtainMessage(49, diagnosisJsonDataInfo).sendToTarget();
                    try {
                        if (com.oplus.melody.common.util.y.l()) {
                            Q8.a.e("NotificationCommandManager", "DEVICES_BURIED_POINT_EVENT, len: " + bArr.length + ", jsonData: " + str2);
                        }
                        if (TextUtils.isEmpty(str2)) {
                            bytes = null;
                        } else {
                            String strH = JsonUtils.h((DiagnosisJsonDataInfo.BaseReq) JsonUtils.c(DiagnosisJsonDataInfo.BaseReq.class, str2));
                            if (!TextUtils.isEmpty(strH)) {
                                bytes = strH.getBytes(charset);
                            } else {
                                bytes = null;
                            }
                        }
                        bArr2 = bytes;
                        r10 = 0;
                    } catch (Exception e14) {
                        e = e14;
                        z10 = false;
                        com.oplus.melody.common.util.y.o(5, Q8.a.k("NotificationCommandManager"), "DEVICES_BURIED_POINT_EVENT", e);
                        r10 = z10;
                        bArr2 = null;
                    }
                } catch (Exception e15) {
                    e = e15;
                }
                d(r10, b13, bArr2, str, aVar);
                break;
            case -11:
                Q8.a.a("NotificationCommandManager", "HEAD_MOTION_TYPE_EVENT");
                if (bArr.length <= i13) {
                    Q8.a.a("CommandUtil", "The length of data is not valid when parse head motion type");
                } else {
                    iD2 = n7.d.d(bArr, i13, 1, true);
                }
                handler.obtainMessage(89, new Pair(str, Integer.valueOf(iD2))).sendToTarget();
                break;
            case -10:
                Q8.a.a("NotificationCommandManager", "HEAD_MOTION_TRY_RESULT_EVENT");
                if (str == null) {
                    headMotionTryResult = null;
                } else if (bArr.length <= i13) {
                    Q8.a.m("CommandUtil", "The length of data is not valid when parse head motion try result code!");
                    headMotionTryResult = null;
                } else {
                    headMotionTryResult = new HeadMotionTryResult(str, n7.d.d(bArr, i13, 1, true));
                }
                if (headMotionTryResult != null) {
                    handler.obtainMessage(90, new Pair(str, headMotionTryResult)).sendToTarget();
                } else {
                    Q8.a.f("NotificationCommandManager", "HEAD_MOTION_TRY_RESULT_EVENT headMotionTryResult is null!");
                }
                break;
            case -9:
                Q8.a.a("NotificationCommandManager", "GMN_VOICE_ASSIST_CONTROL_TYPE_EVENT");
                handler.obtainMessage(91, new Pair(str, e.j(str, i13, bArr))).sendToTarget();
                break;
            case -8:
                if (bArr.length > i13) {
                    LeBrSwitchStateInfo leBrSwitchStateInfoK = e.k(i13, bArr);
                    Q8.a.d("NotificationCommandManager", new Ub.a(leBrSwitchStateInfoK, 15), str);
                    handler.obtainMessage(92, new Pair(str, leBrSwitchStateInfoK)).sendToTarget();
                } else {
                    Q8.a.a("NotificationCommandManager", "LE_BR_SWITCH_STATE_INFO_EVENT: invalid length");
                }
                break;
            case -7:
                if (bArr.length <= i13) {
                    Q8.a.a("NotificationCommandManager", "AI_TRANSLATION_AUDIO_FOCUS: invalid length");
                    break;
                } else {
                    if (bArr.length <= i13) {
                        Q8.a.m("CommandUtil", "parseAITranslationAudioFocus, The length of data is not valid");
                        iD = -1;
                    } else {
                        iD = n7.d.d(bArr, i13, 1, true);
                    }
                    Q8.a.d("NotificationCommandManager", new S(iD, 29), str);
                    if (iD != -1) {
                        handler.obtainMessage(93, new Pair(str, Integer.valueOf(iD))).sendToTarget();
                        break;
                    }
                }
                break;
            case 1:
                ArrayList arrayListD = e.d(i13, bArr);
                if (arrayListD != null) {
                    if (com.oplus.melody.common.util.y.l()) {
                        Q8.a.d("NotificationCommandManager", new C9.f(arrayListD, 5), str);
                    }
                    handler.obtainMessage(10, new Pair(str, arrayListD)).sendToTarget();
                } else {
                    Q8.a.f("NotificationCommandManager", "Error, when receive battery information.");
                }
                break;
            case 2:
                ArrayList arrayListE = e.e(i13, bArr);
                if (arrayListE != null) {
                    arrayListE.toString();
                    Message messageObtainMessage = handler.obtainMessage(12, new Pair(str, arrayListE));
                    messageObtainMessage.arg1 = 33282;
                    messageObtainMessage.sendToTarget();
                } else {
                    Q8.a.f("NotificationCommandManager", "Error, when receive ear bud status change notification.");
                }
                break;
            case 3:
                try {
                    ByteBuffer byteBufferWrap = ByteBuffer.wrap(bArr);
                    byteBufferWrap.position(i13);
                    byte b14 = byteBufferWrap.get();
                    if (b14 == 2) {
                        NoiseReductionInfo noiseReductionInfo = new NoiseReductionInfo(i13, bArr);
                        if (com.oplus.melody.common.util.y.l()) {
                            Q8.a.c("NotificationCommandManager", new h(noiseReductionInfo, 0));
                        }
                        handler.obtainMessage(20, new Pair(str, noiseReductionInfo)).sendToTarget();
                    } else if (b14 == 1) {
                        CurrentNoiseModeInfo currentNoiseModeInfo = new CurrentNoiseModeInfo(i10 + 2, bArr);
                        if (com.oplus.melody.common.util.y.l()) {
                            Q8.a.c("NotificationCommandManager", new a8.c(currentNoiseModeInfo, 10));
                        }
                        handler.obtainMessage(23, new Pair(str, currentNoiseModeInfo)).sendToTarget();
                    } else if (b14 == 4) {
                        IntelligentNoiseModeInfo intelligentNoiseModeInfo = new IntelligentNoiseModeInfo(i10 + 2, bArr);
                        if (com.oplus.melody.common.util.y.l()) {
                            Q8.a.c("NotificationCommandManager", new X7.b(intelligentNoiseModeInfo, 12));
                        }
                        handler.obtainMessage(44, new Pair(str, intelligentNoiseModeInfo)).sendToTarget();
                    }
                } catch (Exception e16) {
                    Q8.a.h("NotificationCommandManager", "parser action", e16);
                    return;
                }
                break;
            case 4:
                if (bArr.length > i13) {
                    if (bArr.length < i10 + 5) {
                        g0.c.d(new StringBuilder("Length is not valid when receive compactness detection event info, length = "), bArr.length, "CommandUtil");
                    } else {
                        arrayList = new ArrayList(2);
                        CompactnessDetectionInfo compactnessDetectionInfo = new CompactnessDetectionInfo(i13, bArr);
                        CompactnessDetectionInfo compactnessDetectionInfo2 = new CompactnessDetectionInfo(i10 + 3, bArr);
                        arrayList.add(compactnessDetectionInfo);
                        arrayList.add(compactnessDetectionInfo2);
                    }
                    if (arrayList == null && !arrayList.isEmpty()) {
                        handler.obtainMessage(21, new Pair(str, arrayList)).sendToTarget();
                        break;
                    }
                } else {
                    Q8.a.a("CommandUtil", "The length of data is not valid when parse Compactness detection info");
                }
                arrayList = null;
                if (arrayList == null) {
                }
                break;
            case 5:
                DeviceInfoManager.a.f22177a.getClass();
                int iV = Z4.f.v(str);
                if (402448 != iV && 403472 != iV && 406544 != iV && 405520 != iV) {
                    z10 = false;
                }
                if (bArr.length <= i13) {
                    Q8.a.a("CommandUtil", "The length of data is not valid when parse game mode info");
                } else if (bArr.length >= i10 + 2) {
                    if (z10) {
                        int i23 = i10 + 3;
                        if (bArr.length < i10 + 4) {
                            g0.c.d(new StringBuilder("shouldOffset2 Length is not valid when receive game mode  event info, length = "), bArr.length, "CommandUtil");
                        } else {
                            b11 = bArr[i23];
                        }
                    } else {
                        b11 = bArr[i13];
                    }
                    Q8.a.c("NotificationCommandManager", new g(b11, 0, z10));
                    handler.obtainMessage(51, new Pair(str, Integer.valueOf(b11))).sendToTarget();
                } else {
                    g0.c.d(new StringBuilder("Length is not valid when receive game mode  event info, length = "), bArr.length, "CommandUtil");
                }
                b11 = 0;
                Q8.a.c("NotificationCommandManager", new g(b11, 0, z10));
                handler.obtainMessage(51, new Pair(str, Integer.valueOf(b11))).sendToTarget();
                break;
            case 6:
                MultiConnectInformations multiConnectInformationsH = e.h(str, i13, bArr);
                if (multiConnectInformationsH != null) {
                    handler.obtainMessage(34, multiConnectInformationsH).sendToTarget();
                } else {
                    Q8.a.f("NotificationCommandManager", "parse earphone multi connect status event info error. status value is -1");
                }
                break;
            case 8:
                int i24 = i10 + 2;
                try {
                    byte b15 = bArr[i13];
                    byte b16 = bArr[i24];
                    if (b15 == 2 && b16 != 0) {
                        handler.obtainMessage(25, b15, -1, new Pair(str, Integer.valueOf(b16))).sendToTarget();
                    } else if (b15 == 4) {
                        handler.obtainMessage(45, b15, -1, new Pair(str, Integer.valueOf(b16))).sendToTarget();
                    }
                } catch (Exception e17) {
                    Q8.a.h("NotificationCommandManager", "HEARING_ENHANCE_DETECTION_STATUS_CHANGED", e17);
                    return;
                }
                break;
            case 9:
                ArrayList arrayListA = u8.a.C0338a.f33177a.a(str, aVar, bArr);
                if (!arrayListA.isEmpty()) {
                    handler.obtainMessage(26, new Pair(str, arrayListA)).sendToTarget();
                }
                break;
            case 10:
                if (bArr.length <= i13) {
                    Q8.a.f("CommandUtil", "The length of data is not valid when parse zenmode switch status");
                    b12 = -1;
                } else {
                    b12 = bArr[i13];
                }
                if (b12 != -1) {
                    handler.obtainMessage(35, new Pair(str, Integer.valueOf(b12))).sendToTarget();
                } else {
                    Q8.a.f("NotificationCommandManager", "parse earphone zenmode status event info error. status value is -1");
                }
                break;
            case 11:
                if (bArr.length > i13) {
                    if (bArr.length < i10 + 2) {
                        Q8.a.c("CommandUtil", new b(bArr, 0));
                    } else {
                        personalizedNoiseReductionResult = new PersonalizedNoiseReductionResult(i13, bArr);
                    }
                    if (personalizedNoiseReductionResult == null) {
                        handler.obtainMessage(29, new Pair(str, personalizedNoiseReductionResult)).sendToTarget();
                        break;
                    }
                } else {
                    Q8.a.a("CommandUtil", "parseNoiseReductionResult: The length of data is not valid when parseNoiseReductionResult");
                }
                personalizedNoiseReductionResult = null;
                if (personalizedNoiseReductionResult == null) {
                    handler.obtainMessage(29, new Pair(str, personalizedNoiseReductionResult)).sendToTarget();
                    break;
                }
                break;
            case 13:
                Q8.a.a("NotificationCommandManager", "TRIANGLE_INFO_CHANGED");
                handler.obtainMessage(61, new Pair(str, new TriangleInfo(i13, bArr))).sendToTarget();
                break;
            case 14:
                HearingEnhancementEarScanResult hearingEnhancementEarScanResultF = e.f(i13, bArr);
                if (hearingEnhancementEarScanResultF != null) {
                    hearingEnhancementEarScanResultF.setAddress(str);
                    handler.obtainMessage(46, new Pair(str, hearingEnhancementEarScanResultF)).sendToTarget();
                }
                break;
            case 15:
                int i25 = i10 + 3;
                if (bArr.length <= i25) {
                    g0.c.d(new StringBuilder("handlePublicEvent Length is not valid! length = "), bArr.length, "NotificationCommandManager");
                    break;
                } else {
                    int iD5 = n7.d.d(bArr, i13, 2, true);
                    if ((iD5 & 1) != 0) {
                        handler.obtainMessage(78, new Pair(str, Integer.valueOf(bArr[i25]))).sendToTarget();
                        break;
                    } else if ((iD5 & 2) == 0) {
                        if ((iD5 & 4) != 0) {
                            handler.obtainMessage(79, new Pair(str, new HandheldDeviceInfo(str, i25, bArr, true))).sendToTarget();
                        } else if ((iD5 & 16) != 0) {
                            handler.obtainMessage(86, new Pair(str, new TapLevelSettingInfo(i25, bArr, true))).sendToTarget();
                        }
                        break;
                    }
                }
                break;
            case 16:
                Q8.a.a("NotificationCommandManager", "ONESHOT_EVENT");
                OneshotStateInfo oneshotStateInfo = new OneshotStateInfo();
                oneshotStateInfo.initEventData(str, i13, bArr);
                handler.obtainMessage(81, new Pair(str, oneshotStateInfo)).sendToTarget();
                break;
            case 17:
                Q8.a.a("NotificationCommandManager", "TONE_CHANGE_EVENT");
                if (i13 < bArr.length) {
                    ArrayList arrayListG = e.g(i13, bArr);
                    if (arrayListG != null) {
                        handler.obtainMessage(52, new Pair(str, arrayListG)).sendToTarget();
                    } else {
                        Q8.a.f("NotificationCommandManager", "TONE_CHANGE_EVENT: parseEarToneResult failed");
                    }
                } else {
                    Q8.a.f("NotificationCommandManager", "TONE_CHANGE_EVENT: empty payload");
                }
                break;
        }
    }
