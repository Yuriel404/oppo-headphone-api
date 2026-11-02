    public static byte[] b(Context context) {
        byte[] bArr = f22386a;
        if (bArr != null && bArr.length > 0) {
            return bArr;
        }
        synchronized (T.class) {
            try {
                if (f22386a == null || f22386a.length == 0) {
                    byte[] bArrD = null;
                    if (context == null) {
                        y.h("RepackagingDetector", "Context is null in getCurrentSignatureHash");
                    } else {
                        try {
                            if (e(context)) {
                                y.h("RepackagingDetector", "LSPatch detected in assets directory!");
                            } else {
                                byte[] bArrC = c(context);
                                if (bArrC == null || bArrC.length <= 0) {
                                    y.y("RepackagingDetector", "Failed to read signature from APK file, fallback to PackageManager");
                                    bArrD = d(context);
                                } else {
                                    bArrD = bArrC;
                                }
                            }
                        } catch (Throwable th) {
                            y.i("RepackagingDetector", "Error getting signature hash", th);
                        }
                    }
                    f22386a = bArrD;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return f22386a;
    }
