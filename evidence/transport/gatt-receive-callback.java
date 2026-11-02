        @Override // android.bluetooth.BluetoothGattCallback
        public final void onCharacteristicChanged(BluetoothGatt bluetoothGatt, BluetoothGattCharacteristic bluetoothGattCharacteristic, byte[] bArr) {
            j.this.f1880e.post(new g(this, bluetoothGattCharacteristic, bArr, 0));
        }
