    public final boolean t(int i10, String str) {
        if (!this.f22238c.c(i10, str)) {
            Q8.a.d("PollCommandManager", new A9.l(i10, 20), str);
            return false;
        }
        w8.b bVar = this.f22237b;
        ArrayList arrayList = new ArrayList();
        if (!S.u(com.oplus.melody.common.util.k.f22410a)) {
            arrayList.add(Byte.valueOf((byte) 2));
        }
        arrayList.add(Byte.valueOf((byte) 3));
        arrayList.add(Byte.valueOf((byte) 1));
        int size = arrayList.size();
        int i11 = size + 1;
        byte[] bArr = new byte[i11];
        bArr[0] = (byte) (size & 255);
        for (int i12 = 1; i12 < i11; i12++) {
            bArr[i12] = ((Byte) arrayList.get(i12 - 1)).byteValue();
        }
        Q8.a.c("PollCommandManager", new a(bArr, 1));
        this.f22236a.z0(str, bVar.a(str, i10, bArr));
        return true;
    }
