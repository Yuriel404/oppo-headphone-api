    public static WhitelistConfigDTO b(BluetoothDevice bluetoothDevice, Collection<WhitelistConfigDTO> collection) {
        String strF = U8.m.f6120d.f(bluetoothDevice);
        if (TextUtils.isEmpty(strF)) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (WhitelistConfigDTO whitelistConfigDTO : collection) {
            if (p(strF, whitelistConfigDTO)) {
                arrayList.add(whitelistConfigDTO);
            }
        }
        if (arrayList.isEmpty()) {
            y.j("WhitelistUtils", "findWhitelistConfigByDevice NOT_FOUND name=" + y.q(strF));
            return null;
        }
        if (arrayList.size() > 1) {
            Set<UUID> setJ = U8.m.f6120d.j(bluetoothDevice);
            try {
                int size = arrayList.size();
                int i10 = 0;
                while (i10 < size) {
                    Object obj = arrayList.get(i10);
                    i10++;
                    WhitelistConfigDTO whitelistConfigDTO2 = (WhitelistConfigDTO) obj;
                    if (!TextUtils.isEmpty(whitelistConfigDTO2.getUuid())) {
                        UUID uuidFromString = UUID.fromString(whitelistConfigDTO2.getUuid());
                        if (setJ.contains(uuidFromString)) {
                            return whitelistConfigDTO2;
                        }
                        if (setJ.contains(new UUID(Long.reverseBytes(uuidFromString.getLeastSignificantBits()), Long.reverseBytes(uuidFromString.getMostSignificantBits())))) {
                            return whitelistConfigDTO2;
                        }
                    }
                }
            } catch (Exception e3) {
                y.o(4, "WhitelistUtils", "findWhitelistConfigByDevice NOT_FOUND name=" + y.q(strF), e3);
            }
            y.x("WhitelistUtils", "检测到重复蓝牙名称：size=" + arrayList.size() + " name=" + y.q(strF), null);
        }
        return (WhitelistConfigDTO) arrayList.get(0);
    }
