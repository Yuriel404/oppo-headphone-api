    public final void a(String str, w8.a aVar, int i10) {
        f fVar;
        SetCommandStateInfo setCommandStateInfo = new SetCommandStateInfo();
        setCommandStateInfo.mAddress = str;
        setCommandStateInfo.mSetStatus = i10;
        setCommandStateInfo.mResponseCommand = aVar.f33771a;
        byte[] bArr = aVar.f33774d;
        if (bArr != null && bArr.length > 1) {
            setCommandStateInfo.mRspValue = bArr[1];
        }
        BluetoothReceiveData bluetoothReceiveData = new BluetoothReceiveData(1048576, setCommandStateInfo);
        HeadsetCoreService.d.f22187a.getClass();
        HeadsetCoreService.p0(bluetoothReceiveData);
        WeakReference<f> weakReferenceRemove = this.f22196e.remove(Integer.valueOf(aVar.a()));
        if (weakReferenceRemove == null || (fVar = weakReferenceRemove.get()) == null) {
            return;
        }
        if (i10 == 0) {
            fVar.a();
        } else {
            fVar.b();
        }
    }
