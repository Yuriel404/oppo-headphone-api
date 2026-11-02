    /* JADX WARN: Multi-variable type inference failed */
    public final boolean G(String str, w8.a aVar) {
        int i10 = 1;
        byte[] bArr = aVar.f33774d;
        int iL = e.l(bArr);
        if (iL != 0) {
            String strG = androidx.appcompat.widget.a.g(iL, "Get capability error code ");
            com.oplus.melody.common.util.y.a aVar2 = Q8.a.f5077a;
            com.oplus.melody.common.util.y.x("PollCommandManager", strG, null);
            return false;
        }
        if (bArr.length <= 1) {
            Q8.a.f("PollCommandManager", "The length of data is 1, not valid when receive remote capability.");
            return false;
        }
        androidx.collection.b bVar = new androidx.collection.b(0);
        int length = (bArr.length - 1) * 8;
        int[][] iArr = i8.a.f28901a;
        int iMin = Math.min(length, 69);
        int i11 = 0;
        int i12 = 0;
        int i13 = 0;
        while (i11 < iMin) {
            int i14 = i12 + 1;
            if ((bArr[i14] & 255 & (i10 << i13)) != 0) {
                int[] iArr2 = i8.a.f28901a[i11];
                int length2 = iArr2.length;
                int i15 = 0;
                while (i15 < length2) {
                    int i16 = iArr2[i15];
                    Integer.toHexString(i16);
                    bVar.add(Integer.valueOf(i16));
                    i15++;
                    i10 = i10;
                }
            }
            int i17 = i10;
            i13++;
            if (i13 == 8) {
                i13 = 0;
                i12 = i14;
            }
            i11++;
            i10 = i17;
        }
        boolean z10 = i10;
        s8.c cVar = this.f22238c;
        Set<Integer> setPut = cVar.f32709a.put(str, Collections.unmodifiableSet(bVar));
        com.oplus.melody.common.util.y.a aVar3 = Q8.a.f5077a;
        if (com.oplus.melody.common.util.y.l()) {
            Q8.a.d("PollCommandManager", new c0(13, setPut, bVar), str);
        }
        boolean zC = cVar.c(274, str);
        Handler handler = this.f22239d;
        handler.obtainMessage(37, zC ? 1 : 0, -1, str).sendToTarget();
        handler.obtainMessage(40, cVar.c(1032, str) ? 1 : 0, -1, str).sendToTarget();
        handler.obtainMessage(55, cVar.c(1048, str) ? 1 : 0, -1, str).sendToTarget();
        handler.obtainMessage(58, cVar.c(1052, str) ? 1 : 0, -1, str).sendToTarget();
        handler.obtainMessage(60, cVar.c(284, str) ? 1 : 0, -1, str).sendToTarget();
        return z10;
    }
