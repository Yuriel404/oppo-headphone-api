    public static Object n(InputStream inputStream, byte[] bArr) throws NoSuchPaddingException, NoSuchAlgorithmException, IOException, InvalidKeyException, InvalidAlgorithmParameterException {
        byte[] bArr2 = new byte[12];
        inputStream.read(bArr2);
        GCMParameterSpec gCMParameterSpec = new GCMParameterSpec(DeviceInfo.FEATURE_SUPPORT_IN_EAR_DETECTION_MUSIC_MUTE, bArr2);
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr, "AES");
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(2, secretKeySpec, gCMParameterSpec);
        CipherInputStream cipherInputStream = new CipherInputStream(inputStream, cipher);
        try {
            GZIPInputStream gZIPInputStream = new GZIPInputStream(cipherInputStream);
            try {
                Object objF = JsonUtils.f(gZIPInputStream, WhitelistContentDO.class);
                gZIPInputStream.close();
                cipherInputStream.close();
                return objF;
            } catch (Throwable th) {
                try {
                    throw th;
                } catch (Throwable th2) {
                    Ae.a.q(gZIPInputStream, th);
                    throw th2;
                }
            }
        } catch (Throwable th3) {
            try {
                throw th3;
            } catch (Throwable th4) {
                Ae.a.q(cipherInputStream, th3);
                throw th4;
            }
        }
    }
