    public VersionInfo(String str, String str2, String str3) {
        str.getClass();
        switch (str) {
            case "1":
                this.mDeviceType = 1;
                break;
            case "2":
                this.mDeviceType = 2;
                break;
            case "3":
                this.mDeviceType = 3;
                break;
            default:
                this.mDeviceType = 255;
                break;
        }
        try {
            this.mVersionType = Integer.parseInt(str2);
        } catch (NumberFormatException e3) {
            Q8.a.h(TAG, "VersionInfo throws NumberFormatException:", e3);
        }
        this.mVersion = trimVersion(str3);
    }
