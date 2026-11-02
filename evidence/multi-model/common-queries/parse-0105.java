    public final void K(String str, w8.a aVar) {
        byte[] bArr = aVar.f33774d;
        int iL = e.l(bArr);
        if (iL != 0) {
            J.b(iL, "Status is failed when receive remote version command. status = ", "PollCommandManager");
            return;
        }
        ArrayList arrayListM = e.m(1, bArr);
        if (arrayListM != null) {
            this.f22239d.obtainMessage(9, Pair.create(str, arrayListM)).sendToTarget();
        } else {
            Q8.a.f("PollCommandManager", "handleRecvRemoteVersion " + com.oplus.melody.common.util.J.c(bArr));
        }
    }
