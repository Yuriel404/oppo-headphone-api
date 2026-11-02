    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        switch (this.f248a) {
            case 0:
                com.oplus.melody.common.util.y.i("CustomEqFragment", "setBassEngineValue", (Throwable) obj);
                return null;
            case 1:
                return new ha.k();
            case 2:
                MultiConnectInformationElement multiConnectInformationElement = (MultiConnectInformationElement) obj;
                return new MultiConnectStateDTO.Element(multiConnectInformationElement.getAddress(), multiConnectInformationElement.getDeviceName(), multiConnectInformationElement.getConnectionState(), multiConnectInformationElement.isCurrentDevice(), multiConnectInformationElement.isMainAudioDevice(), multiConnectInformationElement.isAudioActive(), multiConnectInformationElement.getDeviceType());
            case 3:
                String it = (String) obj;
                kotlin.jvm.internal.i.f(it, "it");
                return it;
            case 4:
                return Ge.l.f2444a;
            case 5:
                return Boolean.valueOf(kotlin.jvm.internal.i.b(obj, Boolean.TRUE));
            case 6:
                com.oplus.melody.common.util.y.o(5, "EarScanFragmentV2", "stopEarScan cancel or exception", (Throwable) obj);
                return null;
            case 7:
                com.oplus.melody.common.util.y.o(5, "HearingEnhancementDetectingFragment", "stopHearingDetection cancel or exception", (Throwable) obj);
                return null;
            case 8:
                com.oplus.melody.common.util.y.i("HearingEnhancementListFragment", "setSwitchFeature cancel or exception", (Throwable) obj);
                return null;
            case 9:
                return Optional.of((Na.b) Ma.M.d((File) obj, Na.b.class));
            case 10:
                com.oplus.melody.common.util.y.i("GameSetFragment", "setGameSoundEnable", (Throwable) obj);
                return null;
            case 11:
                com.oplus.melody.common.util.y.i("HighAudioDetailFragment", "set codec type", (Throwable) obj);
                return null;
            case 12:
                return ((ParcelUuid) obj).getUuid();
            case 13:
                return ((Throwable) obj).getLocalizedMessage();
            case 14:
                com.oplus.melody.ui.component.control.b.a aVar = (com.oplus.melody.ui.component.control.b.a) obj;
                aVar.setGroup(1);
                return aVar;
            case 15:
                com.oplus.melody.common.util.y.i("GuideEntranceFragment", "setMultiConnectSwitchStatus", (Throwable) obj);
                return null;
            case 16:
                return (String) obj;
            case 17:
                return ((WhitelistConfigDTO.Function) obj).getMutexFunctions();
            case 18:
                return HealthSettingsModule.writeSettings$lambda$0$2((Throwable) obj);
            case 19:
                String it2 = (String) obj;
                kotlin.jvm.internal.i.f(it2, "it");
                return Boolean.valueOf(Boolean.parseBoolean(it2));
            case 20:
                return new ha.k();
            case 21:
                return (WhitelistInfoDO) com.oplus.melody.model.net.n.r(com.oplus.melody.model.net.n.j.class, (String) obj);
            case 22:
                return (List) com.oplus.melody.model.net.n.r(com.oplus.melody.model.net.n.g.class, (String) obj);
            case 23:
                return (File) ((Bundle) obj).getSerializable("value");
            case 24:
                return (SetCommandStateDTO) JsonUtils.c(SetCommandStateDTO.class, (String) obj);
            case 25:
                return (EarphoneDTO) obj;
            case 26:
                return (SetCommandStateDTO) JsonUtils.c(SetCommandStateDTO.class, (String) obj);
            case 27:
                return (SetCommandStateDTO) JsonUtils.c(SetCommandStateDTO.class, (String) obj);
            case 28:
                return (SetCommandStateDTO) JsonUtils.c(SetCommandStateDTO.class, (String) obj);
            default:
                return (SetCommandStateDTO) JsonUtils.c(SetCommandStateDTO.class, (String) obj);
        }
    }
