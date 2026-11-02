    public static boolean j(String str) {
        boolean z10;
        boolean z11;
        if (U8.b.f()) {
            if (!BluetoothAdapter.checkBluetoothAddress(str)) {
                Q8.a.g("BluetoothUtil", "m_bt_le.isLeAudioOpen addr invalid. ", str);
                return false;
            }
            try {
                if (f(str)) {
                    Q8.a.d("BluetoothUtil", new ic.a(7), str);
                    return false;
                }
                LeDevice leDeviceC = v.b.f904a.c(str);
                if (leDeviceC != null && leDeviceC.isLeOpen()) {
                    Q8.a.d("BluetoothUtil", new h(leDeviceC, 22), str);
                    return true;
                }
                if (leDeviceC != null) {
                    m.f6120d.getClass();
                    BluetoothDevice bluetoothDeviceI = m.i(str);
                    l8.a aVarB = l8.a.b(k.f22410a);
                    if (aVarB.a(1, bluetoothDeviceI) == 2) {
                        bluetoothDeviceI.getAddress();
                        z10 = true;
                    } else {
                        z10 = false;
                    }
                    if (!z10) {
                        if (aVarB.a(2, bluetoothDeviceI) == 2) {
                            bluetoothDeviceI.getAddress();
                            z11 = true;
                        } else {
                            z11 = false;
                        }
                        if (!z11 && aVarB.g(bluetoothDeviceI)) {
                            Q8.a.d("BluetoothUtil", new com.oplus.melody.btsdk.protocol.commands.v(12), str);
                            return true;
                        }
                    }
                }
            } catch (Exception e3) {
                Q8.a.h("BluetoothUtil", "m_bt_le.isLeAudioOpen", e3);
            }
        }
        return false;
    }
