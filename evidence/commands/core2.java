    public final void M0(String str, EqInfo eqInfo, int i10) {
        A a3 = this.mSetCommandManager;
        if (!a3.f22195d.c(1048, str)) {
            Q8.a.d("SetCommandManager", new u(1), str);
            return;
        }
        if (eqInfo == null) {
            Q8.a.f("SetCommandManager", "setEqInfo return false, eqInfo is null");
            return;
        }
        byte[] bArr = new byte[eqInfo.getSetCommandByteLength() + 1];
        try {
            bArr[0] = (byte) i10;
            bArr[1] = (byte) eqInfo.getMinValue();
            bArr[2] = (byte) eqInfo.getMaxValue();
            bArr[3] = (byte) eqInfo.getEqId();
            int i11 = 5;
            if (TextUtils.isEmpty(eqInfo.getName())) {
                bArr[4] = (byte) 0;
            } else {
                byte[] bytes = eqInfo.getName().getBytes(StandardCharsets.UTF_8);
                int length = bytes.length;
                bArr[4] = (byte) length;
                System.arraycopy(bytes, 0, bArr, 5, length);
                i11 = 5 + length;
            }
            if (eqInfo.getFrequency() != null && eqInfo.getFrequency().length != 0) {
                if (eqInfo.getDbValue() != null && eqInfo.getDbValue().length != 0) {
                    if (eqInfo.getFrequency().length != eqInfo.getDbValue().length) {
                        Q8.a.f("SetCommandManager", "setEqInfo return false, eqInfo.getFrequency().length not equals eqInfo.getDbValue().length!");
                        return;
                    }
                    bArr[i11] = (byte) eqInfo.getFrequency().length;
                    for (int i12 = 0; i12 < eqInfo.getFrequency().length; i12++) {
                        n7.d.b(eqInfo.getFrequency()[i12], i11 + 1, 2, bArr);
                        i11 += 3;
                        bArr[i11] = (byte) eqInfo.getDbValue()[i12];
                    }
                    a3.f22193b.z0(str, a3.f22192a.a(str, 1048, bArr));
                    return;
                }
                Q8.a.f("SetCommandManager", "setEqInfo return false, eqInfo.getDbValue() is empty");
                return;
            }
            Q8.a.f("SetCommandManager", "setEqInfo return false, eqInfo.getFrequency() is empty");
        } catch (Exception e3) {
            Q8.a.h("SetCommandManager", "setEqInfo eqInfo = " + eqInfo, e3);
        }
    }
