    public static ArrayList i(int i10, byte[] bArr) {
        if (bArr == null || bArr.length <= i10) {
            Q8.a.a("CommandUtil", "The length of data is not valid when feature switch info");
            return null;
        }
        int i11 = i10 + 1;
        int i12 = bArr[i10] & 255;
        if (i12 == 0 || bArr.length < (i12 * 2) + i11) {
            g0.c.d(A0.k(i12, "Length is not valid when receive feature switch information. number = ", ", length = "), bArr.length, "CommandUtil");
            return null;
        }
        ArrayList arrayList = new ArrayList(i12);
        for (int i13 = 0; i13 < i12; i13++) {
            FeatureSwitchInfo featureSwitchInfo = new FeatureSwitchInfo(i11, bArr);
            i11 += 2;
            arrayList.add(featureSwitchInfo);
        }
        return arrayList;
    }
