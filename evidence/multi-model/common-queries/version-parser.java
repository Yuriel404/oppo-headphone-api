    /* JADX WARN: Code duplicated, block: B:18:0x005c  */
    /* JADX WARN: Code duplicated, block: B:20:0x0062  */
    /* JADX WARN: Code duplicated, block: B:22:0x006d A[LOOP:0: B:21:0x006b->B:22:0x006d, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:25:0x008c  */
    public static ArrayList m(int i10, byte[] bArr) {
        String[] strArrSplit;
        int length;
        ArrayList arrayList;
        int i11;
        if (bArr == null || bArr.length <= i10) {
            Q8.a.f("CommandUtil", "There is no continue value when parse key type value.");
        } else {
            int i12 = i10 + 1;
            int i13 = bArr[i10] & 255;
            if (bArr.length > i12) {
                String str = new String(bArr, i12, bArr.length - i12, StandardCharsets.UTF_8);
                strArrSplit = str.split(",");
                if (strArrSplit == null || strArrSplit.length != i13 * 3) {
                    Q8.a.f("CommandUtil", "The number is not valid " + i13 + ", raw string = " + str + ", count = 3");
                }
                if (strArrSplit == null) {
                    Q8.a.f("CommandUtil", "Parse value failed when receive remote version command");
                    return null;
                }
                length = strArrSplit.length / 3;
                arrayList = new ArrayList(length);
                for (i11 = 0; i11 < length; i11++) {
                    int i14 = i11 * 3;
                    arrayList.add(new VersionInfo(strArrSplit[i14], strArrSplit[i14 + 1], strArrSplit[i14 + 2]));
                }
                com.oplus.melody.common.util.y.a aVar = Q8.a.f5077a;
                if (com.oplus.melody.common.util.y.l()) {
                    Q8.a.c("CommandUtil", new Fa.B(arrayList, 5));
                }
                return arrayList;
            }
            g0.c.d(new StringBuilder("The length of data is not valid "), bArr.length, "CommandUtil");
        }
        strArrSplit = null;
        if (strArrSplit == null) {
            Q8.a.f("CommandUtil", "Parse value failed when receive remote version command");
            return null;
        }
        length = strArrSplit.length / 3;
        arrayList = new ArrayList(length);
        while (i11 < length) {
            int i15 = i11 * 3;
            arrayList.add(new VersionInfo(strArrSplit[i15], strArrSplit[i15 + 1], strArrSplit[i15 + 2]));
        }
        com.oplus.melody.common.util.y.a aVar2 = Q8.a.f5077a;
        if (com.oplus.melody.common.util.y.l()) {
            Q8.a.c("CommandUtil", new Fa.B(arrayList, 5));
        }
        return arrayList;
    }
