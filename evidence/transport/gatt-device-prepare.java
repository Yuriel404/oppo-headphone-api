    @Override // E8.e
    public final void b() {
        j jVar;
        j jVar2;
        Q8.a.c("m_bt_le.GattDevice", new k(this, 0));
        BluetoothDevice bluetoothDevice = this.f1575c;
        if (bluetoothDevice != null && this.f1903C == null) {
            this.f1903C = n8.b.b(bluetoothDevice.getAddress());
        }
        if (this.f1904D) {
            Q8.a.c("m_bt_le.GattDevice", new E8.d(this, 2));
            if ((!n8.b.h(bluetoothDevice) || ((jVar2 = this.f1901A) != null && jVar2.h())) && (!n8.b.h(this.f1903C) || ((jVar = this.f1902B) != null && jVar.h()))) {
                Q8.a.a("m_bt_le.GattDevice", "is connected not need connect");
                h(this.f1901A, bluetoothDevice);
                return;
            }
        }
        Q8.a.c("m_bt_le.GattDevice", new l(this, 1));
        a aVar = this.f1905E;
        Context context = this.f1573a;
        if (bluetoothDevice != null) {
            if (this.f1901A == null) {
                this.f1901A = new j(context, bluetoothDevice, aVar);
            }
            if (!n8.b.h(bluetoothDevice) || this.f1901A.h()) {
                Q8.a.m("m_bt_le.GattDevice", "begin gattConnect, mGattConnection profile not ready, mGattConnection: " + this.f1901A);
            } else {
                this.f1901A.d();
            }
        }
        BluetoothDevice bluetoothDevice2 = this.f1903C;
        if (bluetoothDevice2 != null) {
            if (this.f1902B == null) {
                this.f1902B = new j(context, bluetoothDevice2, aVar);
            }
            if (!n8.b.h(this.f1903C) || this.f1902B.h()) {
                Q8.a.m("m_bt_le.GattDevice", "begin gattConnect, mSubGattConnection profile not ready, mSubGattConnection: " + this.f1902B);
            } else {
                this.f1902B.d();
            }
        }
        Q8.a.c("Device", new E8.d(this, 0));
        this.f1582v = false;
        E8.e.a aVar2 = this.f1584x;
        E8.e.b bVar = this.f1585y;
        aVar2.removeCallbacks(bVar);
        aVar2.postDelayed(bVar, 300000L);
    }
