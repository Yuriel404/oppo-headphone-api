    public static boolean k(String str) {
        if (!BluetoothAdapter.checkBluetoothAddress(str)) {
            return false;
        }
        m mVar = m.f6120d;
        mVar.getClass();
        BluetoothDevice bluetoothDeviceI = m.i(str);
        ParcelUuid[] parcelUuidArrK = mVar.k(bluetoothDeviceI);
        if (parcelUuidArrK != null) {
            List listAsList = Arrays.asList(parcelUuidArrK);
            if (listAsList.contains(E.f797i) && !listAsList.contains(E.f790a) && !listAsList.contains(E.f795f)) {
                Q8.a.d("BluetoothUtil", new u(13), str);
                return true;
            }
        }
        if (bluetoothDeviceI != null) {
            Object objA = A8.d.a(bluetoothDeviceI, "isLeOnlyDevice");
            if ((objA instanceof Boolean) && ((Boolean) objA).booleanValue()) {
                Q8.a.d("BluetoothUtil", new ic.a(8), str);
                return true;
            }
        }
        LeDevice leDeviceC = v.b.f904a.c(str);
        Objects.toString(leDeviceC);
        return leDeviceC != null && TextUtils.equals(leDeviceC.getSubAddress(), str);
    }
