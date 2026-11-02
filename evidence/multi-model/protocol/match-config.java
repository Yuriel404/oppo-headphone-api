/* JADX INFO: compiled from: WhitelistUtils.java */
/* JADX INFO: loaded from: classes3.dex */
public final class Y {
    public static WhitelistConfigDTO a(Collection<WhitelistConfigDTO> collection, String str, String str2) {
        if (collection == null || collection.isEmpty()) {
            return null;
        }
        boolean zIsEmpty = TextUtils.isEmpty(str2);
        boolean zIsEmpty2 = TextUtils.isEmpty(str);
        ArrayList arrayList = null;
        ArrayList arrayList2 = null;
        for (WhitelistConfigDTO whitelistConfigDTO : collection) {
            if (!zIsEmpty && p(str2, whitelistConfigDTO)) {
                if (arrayList == null) {
                    arrayList = new ArrayList();
                }
                arrayList.add(whitelistConfigDTO);
            }
            if (!zIsEmpty2 && whitelistConfigDTO != null && str.equalsIgnoreCase(whitelistConfigDTO.getId())) {
                if (arrayList2 == null) {
                    arrayList2 = new ArrayList();
                }
                arrayList2.add(whitelistConfigDTO);
            }
        }
        if (arrayList == null && arrayList2 == null) {
            if (!TextUtils.isEmpty(str) && !TextUtils.equals("000000", str)) {
                y.o(5, "WhitelistUtils", "findWhitelistConfig failed", MelodyException.f(404, "None by " + str + '(' + y.q(str2) + ')'));
            }
            return null;
        }
        if (arrayList == null) {
            WhitelistConfigDTO whitelistConfigDTO2 = (WhitelistConfigDTO) arrayList2.get(0);
            whitelistConfigDTO2.getId();
            whitelistConfigDTO2.getName();
            return whitelistConfigDTO2;
        }
        if (arrayList2 != null) {
            int size = arrayList.size();
            int i10 = 0;
            while (i10 < size) {
                Object obj = arrayList.get(i10);
                i10++;
                WhitelistConfigDTO whitelistConfigDTO3 = (WhitelistConfigDTO) obj;
                if (arrayList2.contains(whitelistConfigDTO3)) {
                    return whitelistConfigDTO3;
                }
            }
        }
        WhitelistConfigDTO whitelistConfigDTO4 = (WhitelistConfigDTO) arrayList.get(0);
        whitelistConfigDTO4.getId();
        whitelistConfigDTO4.getName();
        return whitelistConfigDTO4;
    }
