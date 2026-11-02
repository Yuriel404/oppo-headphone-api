    public static byte[] c(Context context) {
        String str;
        try {
            try {
                ApplicationInfo applicationInfo = context.getApplicationInfo();
                if (applicationInfo == null) {
                    y.h("RepackagingDetector", "ApplicationInfo is null");
                    str = null;
                } else {
                    str = applicationInfo.publicSourceDir;
                    if (str == null || str.isEmpty()) {
                        str = applicationInfo.sourceDir;
                    }
                }
            } catch (Throwable th) {
                y.i("RepackagingDetector", "Error getting APK path", th);
            }
            if (str == null || str.isEmpty()) {
                y.h("RepackagingDetector", "Failed to get APK path");
            } else {
                File file = new File(str);
                if (file.exists() && file.isFile()) {
                    return g(file);
                }
                y.h("RepackagingDetector", "APK file not found: ".concat(str));
            }
            return null;
        } catch (Throwable th2) {
            y.i("RepackagingDetector", "Error reading signature from APK file", th2);
            return null;
        }
    }
