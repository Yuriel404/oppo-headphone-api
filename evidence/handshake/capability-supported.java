    public final boolean c(int i10, String str) {
        if (!BluetoothAdapter.checkBluetoothAddress(str)) {
            return false;
        }
        if (i8.a.f28902b.contains(Integer.valueOf(i10))) {
            return true;
        }
        Set<Integer> set = this.f32709a.get(str);
        return set != null && set.contains(Integer.valueOf(i10));
    }
