    @Override // E8.g
    public final void c(DeviceInfo deviceInfo) {
        int i10;
        ConcurrentHashMap concurrentHashMap = this.f2826e;
        e dVar = (e) concurrentHashMap.get(deviceInfo.getDeviceAddress());
        if (dVar == null || dVar.d() != deviceInfo.getProductType()) {
            a aVar = this.f2828g;
            if (dVar != null) {
                d(deviceInfo);
                e eVar = (e) concurrentHashMap.remove(deviceInfo.getDeviceAddress());
                if (eVar != null) {
                    eVar.f1576p.remove(aVar);
                    eVar.j();
                    deviceInfo.setDeviceConnectState(3);
                }
            }
            deviceInfo.setProductType(n8.b.d(deviceInfo.getDeviceAddress()));
            int productType = deviceInfo.getProductType();
            Context context = this.f2824c;
            if (productType != 101) {
                dVar = productType != 102 ? null : new m(context, deviceInfo);
            } else {
                dVar = new d(context, deviceInfo);
            }
            StringBuilder sb2 = new StringBuilder("m_bt_le.createDevice, addr: ");
            String deviceAddress = deviceInfo.getDeviceAddress();
            y.a aVar2 = Q8.a.f5077a;
            sb2.append(y.r(deviceAddress));
            sb2.append(", name: ");
            sb2.append(y.q(deviceInfo.getDeviceName()));
            sb2.append(", infoType: ");
            sb2.append(deviceInfo.getProductType());
            sb2.append("\n device: ");
            sb2.append(dVar);
            Q8.a.m("DeviceInteractionImpl", sb2.toString());
            concurrentHashMap.put(deviceInfo.getDeviceAddress(), dVar);
            dVar.f1576p.add(aVar);
        } else {
            StringBuilder sb3 = new StringBuilder("m_bt_le.getDeviceOrCreateDevice, addr: ");
            String deviceAddress2 = deviceInfo.getDeviceAddress();
            y.a aVar3 = Q8.a.f5077a;
            sb3.append(y.r(deviceAddress2));
            sb3.append(", name: ");
            sb3.append(y.q(deviceInfo.getDeviceName()));
            sb3.append(", devType: ");
            sb3.append(dVar.d());
            sb3.append(", infoType: ");
            sb3.append(deviceInfo.getProductType());
            sb3.append("\n device: ");
            sb3.append(dVar);
            Q8.a.m("DeviceInteractionImpl", sb3.toString());
        }
        StringBuilder sb4 = new StringBuilder("m_bt_le.connectDevice, addr: ");
        sb4.append(y.r(deviceInfo.getDeviceAddress()));
        sb4.append(", connectState: ");
        synchronized (dVar.f1574b) {
            i10 = dVar.f1577q;
        }
        sb4.append(i10);
        sb4.append(", devType: ");
        sb4.append(dVar.d());
        sb4.append(", infoType: ");
        sb4.append(deviceInfo.getProductType());
        sb4.append("\n device: ");
        sb4.append(dVar);
        Q8.a.m("DeviceInteractionImpl", sb4.toString());
        dVar.b();
    }
