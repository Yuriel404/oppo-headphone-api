    public final void m(String str) {
        WhitelistConfigDTO.Function function;
        IntBuffer intBufferAllocate = IntBuffer.allocate(32);
        intBufferAllocate.put(5);
        WhitelistConfigDTO whitelistConfigDTOA = p8.a.C0313a.f31524a.a(str);
        s8.c cVar = this.f22238c;
        if (whitelistConfigDTOA != null && (function = whitelistConfigDTOA.getFunction()) != null) {
            if (Y.i(whitelistConfigDTOA)) {
                intBufferAllocate.put(4);
            }
            if (Y.e(function.getHearingEnhancement(), false) || Y.e(function.getHearingEnhancementNew(), false)) {
                intBufferAllocate.put(11);
            }
            if (Y.e(function.getPersonalNoise(), false) || (function.getPersonalNoiseCompat() != null && Y.e(function.getPersonalNoiseCompat().getPersonalNoise(), false))) {
                intBufferAllocate.put(12);
            }
            if (Y.e(function.getClickTakePic(), false) || Y.e(function.getClickTakePicNew(), false)) {
                intBufferAllocate.put(13);
            }
            if (function.getZenMode() > 0) {
                intBufferAllocate.put(15);
            }
            int multiDevicesConnect = function.getMultiDevicesConnect();
            if (multiDevicesConnect == 1 || multiDevicesConnect == 2) {
                intBufferAllocate.put(17);
            }
            if (Y.e(function.getVocalEnhance(), false)) {
                intBufferAllocate.put(9);
            }
            if (Y.e(function.getHeadSetSoundRecord(), false)) {
                intBufferAllocate.put(19);
            }
            int highToneQuality = function.getHighToneQuality();
            if (highToneQuality == 1 || highToneQuality == 2) {
                intBufferAllocate.put(24);
            }
            if (Y.e(function.getLongPowerMode(), false)) {
                intBufferAllocate.put(23);
            }
            if (Y.e(function.getSmartCall(), false)) {
                intBufferAllocate.put(21);
            }
            if (Y.e(function.getDeviceLostRemind(), false)) {
                intBufferAllocate.put(22);
            }
            int voiceWake = function.getVoiceWake();
            if (voiceWake == 1 || voiceWake == 3) {
                intBufferAllocate.put(20);
            }
            int voiceCommand = function.getVoiceCommand();
            if (voiceCommand == 1 || voiceCommand == 2) {
                intBufferAllocate.put(25);
            }
            if (Y.e(function.getGameMode(), false) || function.getGameModeList() != null) {
                intBufferAllocate.put(6);
            }
            if (function.getSpatialTypes() != null) {
                intBufferAllocate.put(27);
            }
            if (Y.e(function.getBassEngineSupport(), false)) {
                intBufferAllocate.put(29);
            }
            if (Y.e(function.getControlAutoVolumeSupport(), false)) {
                intBufferAllocate.put(28);
            }
            if (Y.e(function.getCollectLogs(), false)) {
                intBufferAllocate.put(30);
            }
            if (!com.oplus.melody.common.util.e.a(function.getGameEqPkgList())) {
                intBufferAllocate.put(33);
            }
            if (U8.b.f()) {
                intBufferAllocate.put(31);
            }
            int spineHealth = whitelistConfigDTOA.getFunction().getSpineHealth();
            if (spineHealth == 1 || spineHealth == 2) {
                intBufferAllocate.put(34);
                intBufferAllocate.put(35);
                intBufferAllocate.put(36);
                if (whitelistConfigDTOA.getFunction().getSpineHealth() == 2) {
                    intBufferAllocate.put(60);
                }
            }
            if (!com.oplus.melody.common.util.e.a(function.getGameSoundList()) || cVar.c(1059, str)) {
                intBufferAllocate.put(39);
                intBufferAllocate.put(40);
            }
            if (Y.e(function.getAdaptiveVolume(), false)) {
                intBufferAllocate.put(48);
            }
            if (Y.e(function.getAdaptiveEar(), false)) {
                intBufferAllocate.put(49);
            }
            if (Y.e(function.getSpeechPerception(), false)) {
                intBufferAllocate.put(50);
            }
            if (Y.e(function.getMeetingAssistant(), false)) {
                intBufferAllocate.put(52);
            }
            if (Y.e(function.getLongPressVolume(), false)) {
                intBufferAllocate.put(53);
            }
            if (Y.e(function.getSwiftPair(), false)) {
                intBufferAllocate.put(55);
            }
            if (Y.e(function.getHearingOptimize(), false)) {
                intBufferAllocate.put(56);
            }
            if (Y.e(function.getIncomingCallControl(), false)) {
                intBufferAllocate.put(57);
            }
            if (Y.e(function.getHeadMotion(), false)) {
                intBufferAllocate.put(59);
            }
            int gmnVoiceAssist = function.getGmnVoiceAssist();
            if (gmnVoiceAssist == 1 || gmnVoiceAssist == 2) {
                intBufferAllocate.put(61);
            }
            if (Y.e(function.getSleepDetection(), false)) {
                intBufferAllocate.put(58);
            }
        }
        intBufferAllocate.flip();
        int iLimit = intBufferAllocate.limit();
        int[] iArr = new int[iLimit];
        intBufferAllocate.get(iArr);
        Q8.a.c("PollCommandManager", new c0(12, iArr, str));
        if (!cVar.c(269, str)) {
            Q8.a.d("PollCommandManager", new G8.a(14), str);
            return;
        }
        if (iLimit == 0) {
            Q8.a.b("PollCommandManager", "request feature is null", str);
            return;
        }
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(iLimit + 1);
        byteBufferAllocate.put((byte) (iLimit & 255));
        for (int i10 = 0; i10 < iLimit; i10++) {
            byteBufferAllocate.put((byte) (iArr[i10] & 255));
        }
        this.f22236a.z0(str, this.f22237b.a(str, 269, byteBufferAllocate.array()));
    }
