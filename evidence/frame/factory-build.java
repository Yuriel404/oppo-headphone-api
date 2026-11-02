    public final w8.a a(String str, int i10, byte[] bArr) {
        int iIntValue;
        synchronized (this) {
            try {
                Integer num = this.f33777a.get(str);
                int i11 = 0;
                if (num == null) {
                    num = 0;
                }
                iIntValue = num.intValue();
                int i12 = iIntValue + 1;
                if (i12 <= 255) {
                    i11 = i12;
                }
                this.f33777a.put(str, Integer.valueOf(i11));
            } catch (Throwable th) {
                throw th;
            }
        }
        return new w8.a(i10, iIntValue, bArr);
    }
