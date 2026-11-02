    @Override // F8.a
    public final void a(BluetoothGatt bluetoothGatt) {
        byte[] bArr = this.f1908b;
        Q8.a.c("m_bt_le.GattWriteCommand", new A9.c(this, 6));
        if (bluetoothGatt == null) {
            Q8.a.f("m_bt_le.GattWriteCommand", "execute, gatt is null");
            return;
        }
        try {
            BluetoothGattCharacteristic bluetoothGattCharacteristic = this.f1910d;
            int iWriteCharacteristic = bluetoothGatt.writeCharacteristic(bluetoothGattCharacteristic, bArr, bluetoothGattCharacteristic.getWriteType());
            if (iWriteCharacteristic != 0) {
                Q8.a.f("m_bt_le.GattWriteCommand", "execute, Failed to write characteristic, resultCode: " + iWriteCharacteristic + ", data: " + Wa.a.g(bArr));
            }
        } catch (Throwable th) {
            Q8.a.h("m_bt_le.GattWriteCommand", "execute", th);
        }
    }
