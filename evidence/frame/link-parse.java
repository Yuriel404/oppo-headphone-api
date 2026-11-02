    public final J8.a d(byte[] bArr) {
        int length = bArr.length;
        J8.a aVar = new J8.a();
        if (bArr.length < 4) {
            Q8.a.m("OPOv1Wrapper", "parseLinkLayerPacket, length is invalid with data = " + Wa.a.g(bArr));
            return null;
        }
        int i10 = b(bArr) > 127 ? 2 : 1;
        int i11 = bArr[i10 + 1] & 3;
        if (bArr[0] != -86) {
            Q8.a.m("OPOv1Wrapper", "parseLinkLayerPacket length is invalid with data = " + Wa.a.g(bArr));
            return null;
        }
        if (i11 == 0) {
            aVar.f3428c = false;
            aVar.f3426a = Arrays.copyOfRange(bArr, i10 + 3, bArr.length);
            aVar.f3427b = true;
            return aVar;
        }
        Q8.a.a("OPOv1Wrapper", "parseLinkLayerPacket controlFSNInfo is multi package.");
        aVar.f3428c = true;
        aVar.f3426a = Arrays.copyOfRange(bArr, i10 + 4, bArr.length);
        if (3 != i11) {
            aVar.f3427b = false;
            return aVar;
        }
        Q8.a.a("OPOv1Wrapper", "parseLinkLayerPacket Receive all frame.");
        aVar.f3427b = true;
        return aVar;
    }
