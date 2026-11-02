    @Override // L8.a
    public final void b(DeviceInfo deviceInfo, w8.a aVar) {
        N8.b bVar = this.f4132b;
        if (bVar != null) {
            bVar.f4510v = aVar.f33775e;
            bVar.f4507s = deviceInfo.getUpgradeMTU();
        }
        M8.b bVar2 = this.f4134d;
        bVar2.getClass();
        if (aVar.f33774d == null) {
            Q8.a.m("TLVDataProcessor", "sendData: packet or data is null");
            return;
        }
        Integer.toHexString(aVar.a());
        O8.a.C0049a.f4629a.a();
        Message messageObtain = Message.obtain();
        messageObtain.what = 1;
        messageObtain.obj = aVar;
        bVar2.f4144f.sendMessage(messageObtain);
    }
