    @Override // E8.g
    public final int f(DeviceInfo deviceInfo, w8.a aVar, byte[] bArr, M8.b.a aVar2) {
        if (deviceInfo == null) {
            Q8.a.a("DeviceInteractionImpl", "sendMessage deviceInfo == null ");
            return -11;
        }
        e eVar = (e) this.f2826e.get(deviceInfo.getDeviceAddress());
        try {
            e eVar2 = (e) this.f2827f.get(deviceInfo.getDeviceAddress());
            if ((eVar instanceof m) && eVar2 != null && eVar2.g()) {
                int i10 = aVar.f33771a;
                int i11 = i10 & 32767;
                int[][] iArr = i8.a.f28901a;
                if ((i10 & 32512) == 768 || i8.a.f28903c.contains(Integer.valueOf(i11))) {
                    StringBuilder sb2 = new StringBuilder("m_spp_le.sendMessage.overGattDevice, mIsConnected: ");
                    sb2.append(eVar2.g());
                    sb2.append(", overGattDevice ");
                    sb2.append(eVar2);
                    sb2.append(", dataLen ");
                    sb2.append(bArr != null ? bArr.length : 0);
                    Q8.a.e("DeviceInteractionImpl", sb2.toString());
                    return eVar2.k(bArr, aVar2);
                }
            }
        } catch (Exception e3) {
            Q8.a.h("DeviceInteractionImpl", "sendMessage, error: ", e3);
        }
        if (eVar == null) {
            return -11;
        }
        if (deviceInfo.getProductType() != aVar.f33775e) {
            Q8.a.m("DeviceInteractionImpl", "m_bt_le.sendMessage productType not match, connected: " + eVar.g() + ", productType " + aVar.f33775e + ", cmd = 0x" + Integer.toHexString(aVar.a()) + ", device " + eVar);
            return -11;
        }
        y.a aVar3 = Q8.a.f5077a;
        if (y.l()) {
            Q8.a.e("DeviceInteractionImpl", "m_bt_le.sendMessage, connected: " + eVar.g() + ", productType " + aVar.f33775e + ", cmd = 0x" + Integer.toHexString(aVar.a()) + ", device " + eVar);
        }
        return eVar.k(bArr, aVar2);
    }
