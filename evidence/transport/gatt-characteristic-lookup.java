    public final BluetoothGattCharacteristic f(UUID uuid, UUID uuid2) {
        BluetoothGatt bluetoothGatt = this.f1890p;
        BluetoothGattService service = bluetoothGatt != null ? bluetoothGatt.getService(uuid) : null;
        if (service == null) {
            Q8.a.e("m_bt_le.GattConnection", "Service not found: " + uuid);
            return null;
        }
        BluetoothGattCharacteristic characteristic = service.getCharacteristic(uuid2);
        if (characteristic == null) {
            Q8.a.e("m_bt_le.GattConnection", "Characteristic not found: " + uuid2);
        }
        return characteristic;
    }
