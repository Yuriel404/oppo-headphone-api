        @Override // android.bluetooth.BluetoothGattCallback
        public final void onMtuChanged(BluetoothGatt bluetoothGatt, final int i10, final int i11) {
            j.this.f1880e.post(new Runnable() { // from class: F8.h
                @Override // java.lang.Runnable
                public final void run() {
                    j.a aVar = this.f1869a;
                    y.a aVar2 = Q8.a.f5077a;
                    boolean zL = y.l();
                    j jVar = j.this;
                    if (zL) {
                        Q8.a.a("m_bt_le.GattConnection", "onMtuChanged new mtu: " + i10 + ", status " + i11 + ", " + jVar);
                    }
                    m.a aVar3 = jVar.f1878c;
                    if (aVar3 != null) {
                        m mVar = m.this;
                        Objects.toString(mVar);
                        Iterator<E8.f> it = mVar.f1576p.iterator();
                        while (it.hasNext()) {
                            it.next().getClass();
                        }
                    }
                }
            });
            super.onMtuChanged(bluetoothGatt, i10, i11);
        }
