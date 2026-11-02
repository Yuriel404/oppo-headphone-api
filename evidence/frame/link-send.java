    public final void c(w8.a aVar, byte[] bArr) {
        long jCurrentTimeMillis;
        boolean z10;
        int length = bArr.length;
        ArrayList arrayList = new ArrayList();
        int i10 = this.f4147j;
        if (length <= i10) {
            arrayList.add(bArr);
        } else {
            int i11 = length % i10 > 0 ? (length / i10) + 1 : length / i10;
            int i12 = 0;
            while (i12 < i11) {
                int i13 = this.f4147j;
                int i14 = i12 == i11 + (-1) ? length - (i13 * i12) : i13;
                int i15 = i13 * i12;
                arrayList.add(Arrays.copyOfRange(bArr, i15, i14 + i15));
                i12++;
            }
        }
        int size = arrayList.size();
        for (int i16 = 0; i16 < size; i16++) {
            byte[] bArr2 = (byte[]) arrayList.get(i16);
            y.a aVar2 = Q8.a.f5077a;
            if (y.l()) {
                Q8.a.a("TLVDataProcessor", "sendLinkPackageCommand: 0x" + Integer.toHexString(aVar.a()) + " index=" + i16 + '/' + size + " dataLength=" + bArr2.length + ", productType=" + aVar.f33775e);
            }
            try {
                synchronized (this.f4140b) {
                    this.f4149l = true;
                }
                M8.a.b bVar = this.f4139a;
                a aVar3 = this.f4151n;
                M8.a aVar4 = M8.a.this;
                int iF = this == aVar4.f4134d ? aVar4.f4131a.f(this.f4142d, aVar, bArr2, aVar3) : -11;
                if (iF == 10) {
                    synchronized (this.f4140b) {
                        try {
                            if (this.f4149l) {
                                jCurrentTimeMillis = System.currentTimeMillis();
                                this.f4140b.wait(5000L);
                                z10 = this.f4149l;
                            } else {
                                jCurrentTimeMillis = 0;
                                z10 = false;
                            }
                            this.f4149l = false;
                        } catch (Throwable th) {
                            throw th;
                        }
                    }
                    if (z10) {
                        Q8.a.m("TLVDataProcessor", "sendLinkPackageCommand wait timeout: 0x" + Integer.toHexString(aVar.a()) + " index=" + i16 + '/' + size + " waitCostMs=" + (System.currentTimeMillis() - jCurrentTimeMillis) + ", productType=" + aVar.f33775e);
                    }
                } else {
                    synchronized (this.f4140b) {
                        this.f4149l = false;
                    }
                    Q8.a.m("TLVDataProcessor", "sendLinkPackageCommand: 0x" + Integer.toHexString(aVar.a()) + " error=" + iF + " index=" + i16 + '/' + size + ", productType=" + aVar.f33775e);
                }
                int i17 = this.f4148k;
                if (i17 > 0) {
                    Thread.sleep(i17);
                }
            } catch (InterruptedException e3) {
                Q8.a.h("TLVDataProcessor", "sendLinkPackageCommand: 0x" + Integer.toHexString(aVar.a()) + " index=" + i16 + '/' + size + ", productType=" + aVar.f33775e, e3);
            }
        }
    }
