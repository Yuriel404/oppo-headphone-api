    @Override // java.util.function.Supplier
    public final Object get() {
        boolean z10 = this.f981b;
        switch (this.f980a) {
            case 0:
                return "triggerZenMode " + z10;
            case 1:
                ArrayList<String> arrayList = q.f1167U;
                return "playOrStopVoiceTone isPlay = " + z10;
            case 2:
                return "reminderSoundCheck, isChecked: " + z10;
            case 3:
                return "reminderNotificationCheck, isChecked: " + z10;
            case 4:
                return "setGameModeEnable enable:" + z10 + " failed ";
            case 5:
                return "setGameModeMainEnable enable:" + z10 + " succeed";
            case 6:
                return "isNewVersion126 = " + z10;
            case 7:
                return "getSpeechMultiConversationSwitchFromCache setting result = " + z10;
            case 8:
                return "supportConnectDisconnectHandheldDevice isFunctionSupport = " + z10;
            case 9:
                return HearingOptimizeItem.onSwitchChanged$lambda$0(z10);
            case 10:
                return "getFunctionList isAISummarySupported = " + z10;
            case 11:
                return "getFunctionList isSpatialAudioSupport = " + z10;
            case 12:
                return "onPreferenceChange.setLongPressVolumeStatus failed, switchOpened: " + z10;
            case 13:
                int i10 = AlphaMovieView.f22448K;
                return "setMute " + z10;
            case 14:
                int i11 = AlphaMovieView.f22448K;
                return "setAutoCrop " + z10;
            case 15:
                return MultiDevicesManagerItem.enableItem$lambda$0$0(z10);
            case 16:
                return "showRevokePrivacyStatementDialog: isPrivacyStatementAccepted=" + z10;
            case 17:
                return "onEnter notifyEnabled=" + z10;
            case 18:
                return "accountLoginStateChanged, isLogin=" + z10;
            case 19:
                return "syncHostIsAutoSwitchLinkOpened isOpened = " + z10;
            case 20:
                return PersonalNoiseItem.lambda$initItem$0(z10);
            case 21:
                return "isVoiceWakeOpen, isOpen: " + z10;
            case 22:
                return "onScrollChange stopped, isFullVisibleRect: " + z10;
            case 23:
                return "handleSupportMultiDeviceConnectChange supportMultiDeviceConnect = " + z10;
            case 24:
                return "long press volume:" + z10;
            case 25:
                return "migrateLicenceSwitch: " + z10;
            case 26:
                return "onIsPlayingChanged, isPlaying:" + z10;
            case 27:
                return "isMatchCurrentAccountBykey result = " + z10;
            case 28:
                return "onSwitchChange checked=" + z10;
            default:
                return "onHeadTrackerAvailableChanged: " + z10;
        }
    }
