    public static boolean p(String str, WhitelistConfigDTO whitelistConfigDTO) {
        if (str == null || whitelistConfigDTO == null || TextUtils.isEmpty(whitelistConfigDTO.getName())) {
            return false;
        }
        return whitelistConfigDTO.getFuzzyMatchName() ? str.startsWith(whitelistConfigDTO.getName()) : str.equals(whitelistConfigDTO.getName());
    }
