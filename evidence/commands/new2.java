    @Override // java.util.function.Supplier
    public final Object get() {
        boolean z10 = true;
        switch (this.f22258a) {
            case 0:
                return A0.h(1044, new StringBuilder("setFreeDialogRecoveryTime UNSUPPORTED cmd=0x"));
            case 1:
                return A0.h(1048, new StringBuilder("setEqInfo UNSUPPORTED cmd=0x"));
            case 2:
                return A0.h(1027, new StringBuilder("setSwitchFeature UNSUPPORTED cmd=0x"));
            case 3:
                return A0.h(1070, new StringBuilder("setVoiceMultiConversationStatus UNSUPPORTED cmd=0x"));
            case 4:
                return MelodyBluetoothAdapter.registerOplusBluetoothRssiDetectCallback$lambda$1$0();
            case 5:
                return A9.i.i("init remoteApi, isExp=", U8.b.e());
            case 6:
                return "Cloud sync tips hidden by user";
            case 7:
                int i10 = com.oplus.melody.model.repository.zenmode.s.H;
                return "maybeAutoSwitchToNoiseReduction: earphone null or not support noise reduction";
            case 8:
                return "create cancelable=false";
            case 9:
                int i11 = StartupActivity.f20086y;
                return Boolean.valueOf(p4.f.h());
            case 10:
                return "stopObserveActiveEarphone";
            case 11:
                return "syncHeadPhoneStatus: not support wear detection";
            case 12:
                return "restoreUpgradingFirmwareInfo: wait device version";
            case 13:
                return "m_bt_le.isLeOnlyDevice = true, from BluetoothDevice.uuids ";
            case 14:
                return Integer.valueOf(D.b(null, true));
            case 15:
                return androidx.appcompat.widget.a.g(I.a.f22347a.f22346b, "playPreviewAudio, MediaPlayer start, playState = ");
            case 16:
                return "m_spp_le.tone onUpgradeStart: ";
            case 17:
                int i12 = HeadsetCoreService.e.f22188d;
                return "m_spp_le.MSG_DIRECT_CONNECT_TO_SPP, not melody app or le close";
            case 18:
                return A0.h(3843, new StringBuilder("sendDiagnosticCommand UNSUPPORTED cmd=0x"));
            case 19:
                w8.b bVar = v8.a.f33433a;
                return "doMultiSppCmdInfo.getMultiSppCmdInfo";
            case 20:
                return g0.e.i("sendMultiSppCmdInfo UNSUPPORTED cmd=0x", Integer.toHexString(303));
            case 21:
                return "requestPermissions mNotificationPreShouldShowRationale = " + w4.a.f33743z + ", mNotificationPostShouldShowRationale = " + w4.a.f33735A;
            case 22:
                int i13 = CustomDressActivity.f25364r0;
                int i14 = Build.VERSION.SDK_INT;
                if (i14 < 33 && (i14 < 30 || SdkExtensions.getExtensionVersion(30) < 2)) {
                    z10 = false;
                }
                return A9.i.i("isPhotoPickerAvailable:", z10);
            default:
                return androidx.appcompat.widget.a.g(I.a.f22347a.f22346b, "onPause, playState = ");
        }
    }
