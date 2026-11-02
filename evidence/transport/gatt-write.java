    public final void n(UUID uuid, UUID uuid2, byte[] bArr, M8.b.a aVar) {
        y.a aVar2 = Q8.a.f5077a;
        if (y.l()) {
            Q8.a.a("m_bt_le.GattConnection", "write, this = " + this + ", data: " + Wa.a.g(bArr));
        }
        BluetoothGattCharacteristic bluetoothGattCharacteristicF = f(uuid, uuid2);
        if (bluetoothGattCharacteristicF == null) {
            Q8.a.m("m_bt_le.GattConnection", "Write failed!");
            if (aVar != null) {
                new RuntimeException("Write failed. Didn't find characteristic!");
                aVar.b();
                return;
            }
            return;
        }
        this.f1888n = System.currentTimeMillis();
        n nVar = new n(bluetoothGattCharacteristicF, bArr, aVar);
        synchronized (this) {
            try {
                if (y.l()) {
                    Q8.a.a("m_bt_le.GattConnection", "runCommand-------->, forceDisconnect = " + this.f1884j + ", isNotificationOK: " + this.f1885k + ", " + this);
                }
                if (this.f1884j) {
                    Q8.a.a("m_bt_le.GattConnection", "Rejecting new command since we're disconnecting");
                    nVar.b(new RuntimeException("Disconnecting"));
                } else if (this.f1889o == null && this.f1885k) {
                    if (y.l()) {
                        Q8.a.a("m_bt_le.GattConnection", "Starting command directly: , mCommandList.size: " + this.f1879d.size() + ", cmd: " + nVar);
                    }
                    Handler handler = this.f1880e;
                    n0 n0Var = this.f1881f;
                    handler.removeCallbacks(n0Var);
                    handler.postDelayed(n0Var, 3000L);
                    this.f1889o = nVar;
                    nVar.a(this.f1890p);
                } else {
                    if (y.l()) {
                        Q8.a.a("m_bt_le.GattConnection", "Queuing command, list.size: " + this.f1879d.size() + ", cmd: " + nVar + ", exeCmd: " + this.f1889o);
                    }
                    this.f1879d.offer(nVar);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }
