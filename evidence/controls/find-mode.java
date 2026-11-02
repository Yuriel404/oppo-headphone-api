    @Override // java.util.function.Supplier
    public final Object get() {
        boolean z10 = this.f438b;
        Object obj = this.f439c;
        switch (this.f437a) {
            case 0:
                return ((y0) obj).lambda$getSupportCustomEq$0(z10);
            case 1:
                StringBuilder sb2 = new StringBuilder("headset profile isConnect : ");
                sb2.append(z10);
                sb2.append(" device name : ");
                String strF = U8.m.f6120d.f((BluetoothDevice) obj);
                com.oplus.melody.common.util.y.a aVar = Q8.a.f5077a;
                sb2.append(com.oplus.melody.common.util.y.q(strF));
                return sb2.toString();
            case 2:
                Fc.d.f fVar = (Fc.d.f) obj;
                fVar.getClass();
                return "setFindMode setFindMode isEnter = " + z10 + ", mFindDeviceViewModel = " + fVar.f2049m.f2030o;
            case 3:
                int i10 = HearingEnhancementActivity.f26116K;
                HearingEnhancementActivity hearingEnhancementActivity = (HearingEnhancementActivity) obj;
                hearingEnhancementActivity.getClass();
                StringBuilder sb3 = new StringBuilder("switchToPrepareDetectFragmentV2 firstEntry=");
                sb3.append(z10);
                sb3.append(", hasResConfig=");
                sb3.append(hearingEnhancementActivity.f26122F == null);
                return sb3.toString();
            case 4:
                return ((AutoSwitchLinkSwitchPreference) obj).lambda$handleSwitchChange$8(z10);
            case 5:
                return "triggerEarphoneMultiConnectState getSetCommandStatus = " + ((SetCommandStateDTO) obj).getSetCommandStatus() + ", isChecked = " + z10;
            case 6:
                return "mFirmwareObserver.onChanged, canDisabled: " + z10 + ", show " + ((FirmwareDTO) obj);
            case 7:
                return "voiceMultiConversationPreference, newValue: " + obj + ", isPhoneFullDuplex: " + z10;
            case 8:
                List<Integer> list = VoiceCommandFragment.f25865N;
                StringBuilder sbP = ab.p.p("onVoiceCommandStatusChanged, isVoiceCommandEnable: ", ", isChange: ", ((com.oplus.melody.ui.component.detail.voiceassist.m) obj).isVoiceCommandEnable());
                sbP.append(z10);
                return sbP.toString();
            case 9:
                int i11 = MelodyDetailModelView.f26359y;
                MelodyDetailModelView melodyDetailModelView = (MelodyDetailModelView) obj;
                melodyDetailModelView.getClass();
                return "start, supportModel: " + z10 + ", mModelFilePath: " + melodyDetailModelView.f26370w;
            case 10:
                StringBuilder sb4 = new StringBuilder("updateOptionsMenu mAccountKey = ");
                eb.r rVar = (eb.r) obj;
                sb4.append(com.oplus.melody.common.util.y.p(rVar.H));
                sb4.append(", addr = ");
                sb4.append(com.oplus.melody.common.util.y.r(rVar.f27825x));
                sb4.append(", isMatchCurrentAccountBykey = ");
                sb4.append(z10);
                return sb4.toString();
            case 11:
                return "onButtonClick name:" + ((ModeItem) obj).getName() + " ,selected:" + z10;
            default:
                String str = ((lb.v) obj).f30737b;
                if (str == null) {
                    kotlin.jvm.internal.i.j("mAddress");
                    throw null;
                }
                return "onFirmwareUpgradeStateChanged notificationEnabled=" + z10 + " address=" + com.oplus.melody.common.util.y.r(str);
        }
    }
