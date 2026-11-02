    /* JADX WARN: Multi-variable type inference failed */
    public static List<EqInfo> b(int i10, byte[] bArr) {
        ArrayList arrayList;
        byte[] bArr2;
        List<EqInfo> list = null;
        if (bArr == null || bArr.length <= i10) {
            Q8.a.a("CommandUtil", "The length of data is not valid when all eq data");
            return null;
        }
        int i11 = i10 + 1;
        int i12 = bArr[i10] & 255;
        if (i12 <= 0) {
            return Collections.EMPTY_LIST;
        }
        ArrayList arrayList2 = new ArrayList(i12);
        int i13 = 0;
        while (i13 < i12) {
            int i14 = i11 + 1;
            try {
                if (i14 > bArr.length) {
                    Q8.a.f("CommandUtil", "parseAllEqData isSelect error i:" + i13 + " offset:" + i11 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                    return list;
                }
                int iD = n7.d.d(bArr, i11, 1, true);
                int i15 = i11 + 2;
                if (i15 > bArr.length) {
                    Q8.a.f("CommandUtil", "parseAllEqData minValue error i:" + i13 + " offset:" + i14 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                    return list;
                }
                byte b10 = bArr[i14];
                int i16 = i11 + 3;
                List<EqInfo> list2 = list;
                if (i16 > bArr.length) {
                    Q8.a.f("CommandUtil", "parseAllEqData maxValue error i:" + i13 + " offset:" + i15 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                    return list2;
                }
                byte b11 = bArr[i15];
                int i17 = i11 + 4;
                if (i17 > bArr.length) {
                    Q8.a.f("CommandUtil", "parseAllEqData eqId error i:" + i13 + " offset:" + i16 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                    return list2;
                }
                int iD2 = n7.d.d(bArr, i16, 1, true);
                int i18 = i11 + 5;
                if (i18 > bArr.length) {
                    Q8.a.f("CommandUtil", "parseAllEqData nameLength error i:" + i13 + " offset:" + i17 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                    return list2;
                }
                int iD3 = n7.d.d(bArr, i17, 1, true);
                int i19 = i18 + iD3;
                if (i19 > bArr.length) {
                    Q8.a.f("CommandUtil", "parseAllEqData name error i:" + i13 + " offset:" + i18 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                    return list2;
                }
                if (iD3 > 0) {
                    byte[] bArr3 = new byte[iD3];
                    System.arraycopy(bArr, i18, bArr3, 0, iD3);
                    i18 = i19;
                    bArr2 = bArr3;
                } else {
                    Q8.a.m("CommandUtil", "parseAllEqData nameLength error, nameLength = " + iD3 + ", i:" + i13 + " offset:" + i18 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                    bArr2 = list2;
                }
                int i20 = i18 + 1;
                ArrayList arrayList3 = arrayList2;
                try {
                    if (i20 > bArr.length) {
                        Q8.a.f("CommandUtil", "parseAllEqData frequencyNum error i:" + i13 + " offset:" + i18 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                        return list2;
                    }
                    int iD4 = n7.d.d(bArr, i18, 1, true);
                    if (iD4 < 1) {
                        Q8.a.f("CommandUtil", "parseAllEqData frequencyNum error, frequencyNum = " + iD4 + ", i:" + i13 + " offset:" + i20 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                        return list2;
                    }
                    int[] iArr = new int[iD4];
                    int[] iArr2 = new int[iD4];
                    int i21 = 0;
                    while (i21 < iD4) {
                        int i22 = iD4;
                        int i23 = i20 + 2;
                        int[] iArr3 = iArr2;
                        int[] iArr4 = iArr;
                        byte b12 = b11;
                        if (i23 > bArr.length) {
                            Q8.a.f("CommandUtil", "parseAllEqData frequency error i:" + i13 + ", k:" + i21 + ", offset:" + i20 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                            return list2;
                        }
                        byte b13 = b10;
                        iArr4[i21] = n7.d.d(bArr, i20, 2, true);
                        i20 += 3;
                        if (i20 > bArr.length) {
                            Q8.a.f("CommandUtil", "parseAllEqData dbValue error i:" + i13 + ", k:" + i21 + ", offset:" + i23 + " len:" + bArr.length + " data:" + Wa.a.g(bArr));
                            return list2;
                        }
                        iArr3[i21] = bArr[i23];
                        i21++;
                        iD4 = i22;
                        iArr2 = iArr3;
                        iArr = iArr4;
                        b11 = b12;
                        b10 = b13;
                    }
                    byte b14 = b11;
                    int[] iArr5 = iArr;
                    byte b15 = b10;
                    int[] iArr6 = iArr2;
                    EqInfo eqInfo = new EqInfo();
                    eqInfo.setEqId(iD2);
                    if (bArr2 != 0) {
                        eqInfo.setName(new String(bArr2, Charset.defaultCharset()));
                    }
                    eqInfo.setNameLength(iD3);
                    eqInfo.setIsSelected(iD);
                    eqInfo.setMinValue(b15);
                    eqInfo.setMaxValue(b14);
                    eqInfo.setFrequency(iArr5);
                    eqInfo.setDbValue(iArr6);
                    arrayList = arrayList3;
                    try {
                        arrayList.add(eqInfo);
                        Q8.a.c("CommandUtil", new c(eqInfo, 0));
                        i13++;
                        arrayList2 = arrayList;
                        i11 = i20;
                        list = list2;
                        i12 = i12;
                    } catch (Exception e3) {
                        e = e3;
                        Q8.a.f("CommandUtil", "parseAllEqData throws Exception:" + e);
                        return arrayList;
                    }
                } catch (Exception e10) {
                    e = e10;
                    arrayList = arrayList3;
                }
            } catch (Exception e11) {
                e = e11;
                arrayList = arrayList2;
            }
        }
        return arrayList2;
    }
