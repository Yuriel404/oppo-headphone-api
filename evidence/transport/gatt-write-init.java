    public n(BluetoothGattCharacteristic bluetoothGattCharacteristic, byte[] bArr, M8.b.a aVar) {
        this.f1851a = "write";
        this.f1910d = bluetoothGattCharacteristic;
        bluetoothGattCharacteristic.setWriteType(2);
        this.f1908b = bArr;
        this.f1909c = aVar;
    }
