    public final void d() {
        j jVar;
        this.f1891q = GattConnectionAttempt.f22305b;
        U8.m.f6120d.getClass();
        boolean zM = U8.m.m();
        Q8.a.c("m_bt_le.GattConnection", new E9.b(this, zM, 1));
        if (!zM) {
            Q8.a.f("m_bt_le.GattConnection", "Bluetooth is not enabled, just wait for it to be enabled!");
            return;
        }
        Q8.a.c("m_bt_le.GattConnection", new b(this, 1));
        int i10 = this.f1886l;
        if (i10 == 1 || i10 == 2) {
            return;
        }
        BluetoothDevice bluetoothDevice = this.f1877b;
        if (bluetoothDevice == null) {
            Q8.a.f("m_bt_le.GattConnection", "startActiveConnect The device is null when start active connect.");
            return;
        }
        m mVar = m.this;
        j jVar2 = mVar.f1901A;
        if (jVar2 != null && jVar2.g() != 2 && (jVar = mVar.f1902B) != null && jVar.g() != 2) {
            mVar.f1584x.sendEmptyMessage(127);
        }
        synchronized (this) {
            this.f1886l = 1;
        }
        this.f1891q = GattConnectionAttempt.f22306c;
        Q8.a.c("m_bt_le.GattConnection", new d(0));
        Handler handler = this.f1880e;
        Ab.k kVar = this.f1882g;
        handler.removeCallbacks(kVar);
        handler.postDelayed(kVar, 30000L);
        this.f1890p = bluetoothDevice.connectGatt(this.f1876a, false, this.f1892r, 2);
        this.f1885k = false;
        this.f1888n = System.currentTimeMillis();
    }
