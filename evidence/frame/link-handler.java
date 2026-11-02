        @Override // android.os.Handler
        public final void handleMessage(Message message) {
            int i10;
            ArrayList arrayList;
            byte[] bArr;
            byte b10 = 0;
            byte b11 = 2;
            byte b12 = 3;
            byte b13 = 1;
            int i11 = message.what;
            if (i11 != 1) {
                if (i11 != 2) {
                    return;
                }
                synchronized (b.this.h) {
                    try {
                        if (b.this.h.size() == 0) {
                            return;
                        }
                        byte[] bArr2 = (byte[]) b.this.h.remove(0);
                        b bVar = b.this;
                        synchronized (bVar) {
                            try {
                                if (bArr2 == null) {
                                    Q8.a.a("TLVDataProcessor", "handleMTUData: dataContent is null");
                                    return;
                                }
                                N8.b bVar2 = bVar.f4143e;
                                if (bVar2 == null) {
                                    Q8.a.a("TLVDataProcessor", "handleMTUData: mMessageWrapper is null");
                                    return;
                                }
                                List<byte[]> listE = bVar2.e(bArr2);
                                if (listE != null && !listE.isEmpty()) {
                                    Iterator<byte[]> it = listE.iterator();
                                    while (it.hasNext()) {
                                        bVar.a(it.next());
                                    }
                                    return;
                                }
                                Q8.a.a("TLVDataProcessor", "handleMTUData: spliceMTUPackages is empty");
                                return;
                            } catch (Throwable th) {
                                throw th;
                            }
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
            }
            Object obj = message.obj;
            if (obj instanceof w8.a) {
                w8.a aVar = (w8.a) obj;
                b bVar3 = b.this;
                if (aVar == null) {
                    Q8.a.m("TLVDataProcessor", "sendWrapData: packet is null, mMessageWrapper=" + bVar3.f4143e);
                    return;
                }
                bVar3.getClass();
                byte[] bArr3 = aVar.f33774d;
                int length = bArr3.length + 5;
                byte[] bArr4 = new byte[length];
                n7.d.b(aVar.f33771a, 0, 2, bArr4);
                n7.d.b(aVar.f33772b, 2, 1, bArr4);
                n7.d.b(aVar.f33773c, 3, 2, bArr4);
                System.arraycopy(bArr3, 0, bArr4, 5, bArr3.length);
                N8.b bVar4 = bVar3.f4143e;
                if (bVar4 == null) {
                    Q8.a.m("TLVDataProcessor", "sendWrapData: mMessageWrapper is null");
                    return;
                }
                bVar3.f4148k = bVar4.f4508t;
                if (length == 0) {
                    arrayList = null;
                } else {
                    ArrayList arrayList2 = new ArrayList();
                    if (length >= 10 && ((bArr4[1] << 8) | bArr4[0]) == 768) {
                        bVar4.f4501a = bArr4[9] == 3;
                    }
                    if (bVar4.f4510v == 102) {
                        if (length <= 2 || ((bArr4[1] << 8) | bArr4[0]) != 770) {
                            bVar4.f4506r = CustomChartAnimator.DEF_ANI_TIME;
                            bVar4.f4509u = CustomChartAnimator.DEF_ANI_TIME;
                        } else {
                            int i12 = bVar4.f4507s;
                            if (i12 <= 0 || i12 >= 660) {
                                bVar4.f4506r = 660;
                                bVar4.f4509u = 660;
                            } else {
                                bVar4.f4506r = i12;
                                bVar4.f4509u = i12;
                            }
                        }
                    } else if (length > 2) {
                        byte b14 = bArr4[1];
                        byte b15 = bArr4[0];
                        if (((b14 << 8) | b15) == 770 && bVar4.f4501a) {
                            bVar4.f4506r = 12388;
                            bVar4.f4509u = 12388;
                        } else if (length <= 2 || ((b14 << 8) | b15) != 770 || (i10 = bVar4.f4507s) <= 0 || i10 >= 660) {
                            bVar4.f4506r = 660;
                            bVar4.f4509u = 660;
                        } else {
                            bVar4.f4506r = i10;
                            bVar4.f4509u = i10;
                        }
                    } else {
                        bVar4.f4506r = 660;
                        bVar4.f4509u = 660;
                    }
                    int i13 = 0;
                    int i14 = 0;
                    byte b16 = 0;
                    int i15 = 0;
                    while (length > 0) {
                        int i16 = bVar4.f4509u;
                        byte b17 = b10;
                        byte b18 = (i16 > 129 && (i13 != 0 ? length > 124 : length > 125)) ? b11 : b13;
                        int i17 = i16 - b18;
                        byte b19 = b11;
                        int i18 = i17 - 3;
                        if (i13 == 0) {
                            if (length <= i18) {
                                b12 = b12;
                                b13 = b13;
                                i14 = length;
                                b13 = b17;
                                b16 = b13;
                            } else {
                                i14 = i17 - 4;
                                b12 = b12;
                                b16 = b13;
                                b13 = b16;
                            }
                        } else if (i13 > 0) {
                            int i19 = i17 - 4;
                            if (length <= i19) {
                                b16 = b12;
                                i14 = length;
                            } else {
                                i14 = i19;
                                b16 = b19;
                            }
                            y.a aVar2 = Q8.a.f5077a;
                            if (y.l()) {
                                StringBuilder sbJ = A0.j(b18, i18, "getFrameList, lengthSize = ", ", payloadSizeAndFSNSize = ", ", mDeviceMaxFrameSize = ");
                                sbJ.append(bVar4.f4509u);
                                sbJ.append("  , curFramePayloadSize = ");
                                sbJ.append(i14);
                                Q8.a.a("OPOv1Wrapper", sbJ.toString());
                            }
                            b13 = b13;
                        } else {
                            b12 = b12;
                            b13 = b13;
                        }
                        int i20 = b13 != 0 ? i14 + 3 : i14 + 2;
                        byte[] bArr5 = new byte[i20 + 1 + b18];
                        bArr5[b17] = -86;
                        if (i20 == 0) {
                            bArr = new byte[b13];
                            bArr[b17] = b17;
                        } else {
                            int i21 = b17;
                            byte b20 = b13;
                            for (int i22 = i20; i22 != 0; i22 >>>= 7) {
                                i21++;
                            }
                            byte[] bArr6 = new byte[i21];
                            int i23 = b17;
                            while (i23 < i21) {
                                byte b21 = b18;
                                if (i23 == i21 - 1) {
                                    bArr6[i23] = (byte) (i20 & 127);
                                } else {
                                    bArr6[i23] = (byte) ((i20 & 127) | com.oplus.mydevices.sdk.device.DeviceInfo.FEATURE_SUPPORT_IN_EAR_DETECTION_MUSIC_MUTE);
                                }
                                i20 >>>= 7;
                                i23++;
                                b20 = 1;
                                b18 = b21;
                            }
                            bArr = bArr6;
                        }
                        byte b22 = b18;
                        int i24 = b17;
                        while (i24 < bArr.length) {
                            int i25 = i24 + 1;
                            bArr5[i25] = bArr[i24];
                            i24 = i25;
                        }
                        bArr5[b22 + 1] = b16;
                        bArr5[b22 + 2] = b17;
                        int i26 = b22 + 3;
                        if (b13 != 0) {
                            bArr5[i26] = (byte) i13;
                            i26 = b22 + 4;
                        }
                        int i27 = i15 + i14;
                        byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr4, i15, i27);
                        int length2 = bArrCopyOfRange.length;
                        for (int i28 = b17; i28 < length2; i28++) {
                            bArr5[i26 + i28] = bArrCopyOfRange[i28];
                        }
                        arrayList2.add(bArr5);
                        i13++;
                        length -= i14;
                        i15 = i27;
                        b10 = b17;
                        b11 = b19;
                        b12 = b12;
                        b13 = 1;
                    }
                    arrayList = arrayList2;
                }
                byte b23 = b10;
                bVar3.f4147j = bVar3.f4143e.f4506r;
                if (arrayList == null || bVar3.f4139a == null) {
                    return;
                }
                int size = arrayList.size();
                for (int i29 = b23; i29 < size; i29++) {
                    byte[] bArr7 = (byte[]) arrayList.get(i29);
                    y.a aVar3 = Q8.a.f5077a;
                    if (y.l()) {
                        Q8.a.a("TLVDataProcessor", "sendWrapData, cmd=0x" + Integer.toHexString(aVar.a()) + " index=" + i29 + '/' + size + " dataLength=" + bArr7.length);
                    }
                    synchronized (bVar3.f4141c) {
                        bVar3.c(aVar, bArr7);
                    }
                }
            }
        }
