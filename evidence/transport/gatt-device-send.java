    @Override // E8.e
    public final int k(byte[] bArr, M8.b.a aVar) {
        Q8.a.m("m_bt_le.GattDevice", "sendMessage start, mIsConnected: " + this.f1904D + ", " + this);
        if (this.f1904D) {
            j jVar = this.f1901A;
            UUID uuid = f1899G;
            if (jVar != null && jVar.h()) {
                this.f1901A.n(this.f1906z, uuid, bArr, aVar);
                return 10;
            }
            j jVar2 = this.f1902B;
            if (jVar2 != null && jVar2.h()) {
                this.f1902B.n(this.f1906z, uuid, bArr, aVar);
                return 10;
            }
        } else if (aVar != null) {
            new RuntimeException("Not connected");
            aVar.b();
        }
        Q8.a.m("m_bt_le.GattDevice", "sendMessage end, Not connected return, mIsConnected: " + this.f1904D + ", data: " + Wa.a.g(bArr) + " this: " + this);
        return -10;
    }
