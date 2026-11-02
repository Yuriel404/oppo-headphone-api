        @Override // android.bluetooth.BluetoothGattCallback
        public final void onServicesDiscovered(BluetoothGatt bluetoothGatt, int i10) {
            y.a aVar = Q8.a.f5077a;
            boolean zL = y.l();
            j jVar = j.this;
            if (zL) {
                Q8.a.a("m_bt_le.GattConnection", "onServicesDiscovered, status = " + i10 + ", " + jVar);
            }
            if (i10 != 133) {
                jVar.f1880e.post(new z(this, bluetoothGatt, i10, 1));
                return;
            }
            jVar.m();
            if (jVar.f1890p != null && jVar.f1891q == GattConnectionAttempt.f22306c) {
                jVar.f1891q = GattConnectionAttempt.f22308q;
            }
            jVar.a();
            jVar.d();
        }
