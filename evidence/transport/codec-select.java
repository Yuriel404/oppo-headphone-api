    public final L8.a c(DeviceInfo deviceInfo) {
        N8.b bVar;
        if (deviceInfo != null && this.f1344g != null) {
            HashMap map = this.f1338a;
            L8.a aVar = (L8.a) map.get(deviceInfo.getDeviceAddress());
            if (aVar != null) {
                return aVar;
            }
            int productType = deviceInfo.getProductType();
            if (productType == 101 || productType == 102) {
                bVar = new N8.b();
                int mtu = deviceInfo.getMTU();
                if (mtu < 0) {
                    bVar.f4509u = 512;
                    bVar.f4506r = 512;
                } else {
                    bVar.f4509u = mtu;
                    bVar.f4506r = mtu;
                }
                bVar.f4508t = 0;
            } else {
                bVar = null;
            }
            if (bVar != null) {
                g gVar = this.f1344g;
                int productType2 = deviceInfo.getProductType();
                M8.a aVar2 = (productType2 == 101 || productType2 == 102) ? new M8.a(deviceInfo, gVar, bVar) : null;
                if (aVar2 != null) {
                    map.put(deviceInfo.getDeviceAddress(), aVar2);
                    aVar2.f4135e = this.f1342e;
                }
                return aVar2;
            }
        }
        return null;
    }
