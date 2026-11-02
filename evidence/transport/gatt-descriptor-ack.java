        @Override // android.bluetooth.BluetoothGattCallback
        public final void onDescriptorWrite(BluetoothGatt bluetoothGatt, BluetoothGattDescriptor bluetoothGattDescriptor, int i10) {
            j jVar = j.this;
            Objects.toString(jVar);
            jVar.getClass();
            Q8.a.a("m_bt_le.GattConnection", "stopNotifyTimeout");
            Handler handler = jVar.f1880e;
            handler.removeCallbacks(jVar.h);
            if (i10 != 133) {
                handler.post(new o(this, i10, 1));
                return;
            }
            jVar.m();
            if (jVar.f1890p != null && jVar.f1891q == GattConnectionAttempt.f22306c) {
                jVar.f1891q = GattConnectionAttempt.f22308q;
            }
            jVar.a();
            jVar.d();
        }
