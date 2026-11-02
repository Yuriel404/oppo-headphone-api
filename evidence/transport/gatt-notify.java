    @SuppressLint({"MissingPermission"})
    public final void l(UUID uuid, UUID uuid2) {
        y.a aVar = Q8.a.f5077a;
        if (y.l()) {
            Q8.a.a("m_bt_le.GattConnection", "setNotification, this = " + this);
        }
        Q8.a.a("m_bt_le.GattConnection", "startNotifyTimeout");
        Handler handler = this.f1880e;
        l0 l0Var = this.h;
        handler.removeCallbacks(l0Var);
        handler.postDelayed(l0Var, 3000L);
        BluetoothGattCharacteristic bluetoothGattCharacteristicF = f(uuid, uuid2);
        BluetoothGatt bluetoothGatt = this.f1890p;
        if (bluetoothGatt != null && bluetoothGattCharacteristicF != null) {
            if (!bluetoothGatt.setCharacteristicNotification(bluetoothGattCharacteristicF, true)) {
                Q8.a.f("m_bt_le.GattConnection", "setNotification Failed setCharacteristicNotification " + this);
                return;
            } else if (y.l()) {
                Q8.a.a("m_bt_le.GattConnection", "setNotification setCharacteristicNotification success " + this);
            }
        }
        handler.postDelayed(new O(6, this, bluetoothGattCharacteristicF), 100L);
    }
