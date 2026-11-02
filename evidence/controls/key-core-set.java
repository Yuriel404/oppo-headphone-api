    public final void X0(int i10, String str, ArrayList arrayList) {
        A a3 = this.mSetCommandManager;
        if (arrayList == null) {
            a3.getClass();
            return;
        }
        if (!a3.f22195d.c(i10, str)) {
            Q8.a.d("SetCommandManager", new F(i10, 28), str);
            return;
        }
        int size = arrayList.size();
        if (size == 0) {
            Q8.a.f("SetCommandManager", "The size is 0 when set key function.");
            return;
        }
        int i11 = 1;
        byte[] bArr = new byte[(size * 4) + 1];
        bArr[0] = (byte) (size & 255);
        for (int i12 = 0; i12 < size; i12++) {
            if (!((KeyFunctionInfo) arrayList.get(i12)).copyIntoData(bArr, i11)) {
                Q8.a.f("SetCommandManager", "Failed when set key function.");
                return;
            }
            i11 += 4;
        }
        a3.f22193b.z0(str, a3.f22192a.a(str, i10, bArr));
        this.mPollCommandManager.t(264, str);
    }
