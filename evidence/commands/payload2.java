    public final void j1(String str, int i10, boolean z10, boolean z11) {
        Integer numValueOf;
        int i11 = 2;
        A a3 = this.mSetCommandManager;
        a3.getClass();
        Q8.a.c("SetCommandManager", new w(i10, z10));
        if (a3.f22195d.c(1027, str) || i10 == 31) {
            byte[] bArr = {(byte) i10, z10 ? (byte) 1 : (byte) 0};
            if (i10 == 31) {
                StringBuilder sbP = p.p("m_bt_le.setSwitchFeature.CMD_SWITCH_FEATURE_LEA, status = ", ", cmd = ", z10);
                sbP.append(Wa.a.D(1027));
                Q8.a.m("SetCommandManager", sbP.toString());
            }
            w8.a aVarA = a3.f22192a.a(str, 1027, bArr);
            a3.f22193b.z0(str, aVarA);
            numValueOf = Integer.valueOf(aVarA.f33772b & 255);
        } else {
            Q8.a.d("SetCommandManager", new u(i11), str);
            numValueOf = null;
        }
        if (z11) {
            return;
        }
        Q8.a.c("HeadsetCoreService", new Fa.m(i10, numValueOf, 11));
        this.mNoGetStateSet.add(numValueOf);
    }
