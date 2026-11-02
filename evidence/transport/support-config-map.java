    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        switch (this.f24314a) {
            case 0:
                return (SetCommandStateDTO) JsonUtils.c(SetCommandStateDTO.class, (String) obj);
            case 1:
                return (SetCommandStateDTO) JsonUtils.c(SetCommandStateDTO.class, (String) obj);
            case 2:
                return (SetCommandStateDTO) JsonUtils.c(SetCommandStateDTO.class, (String) obj);
            case 3:
                return (SetCommandStateDTO) JsonUtils.c(SetCommandStateDTO.class, (String) obj);
            case 4:
                return (SetCommandStateDTO) JsonUtils.c(SetCommandStateDTO.class, (String) obj);
            case 5:
                return (EarphoneDTO) JsonUtils.c(EarphoneDTO.class, (String) obj);
            case 6:
                return Integer.valueOf(((EarStatusDTO) obj).getBoxStatus());
            case 7:
                com.oplus.melody.common.util.y.o(5, "EarphoneRepository", "setEarphoneControlSoundChannel failed, error, abort.", (Throwable) obj);
                return null;
            case 8:
                return (String) ((Map.Entry) obj).getKey();
            case 9:
                return new EarToneDTO((EarTone) obj);
            case 10:
                return ((BluetoothAdapter) obj).getBondedDevices();
            case 11:
                return (SetCommandStateDTO) JsonUtils.c(SetCommandStateDTO.class, (String) obj);
            case 12:
                String str = (String) obj;
                return str != null ? Boolean.valueOf(str) : Boolean.FALSE;
            case 13:
                return (HearingEnhancementEntity) com.oplus.melody.common.util.s.g((Bundle) obj, "value", HearingEnhancementEntity.class);
            case 14:
                File file = (File) obj;
                if (file != null && file.isDirectory()) {
                    return (com.oplus.melody.model.repository.zenmode.t) Ma.M.d(file, com.oplus.melody.model.repository.zenmode.t.class);
                }
                throw MelodyException.f(0, "Unknown file " + file);
            case 15:
                return (ZenModeInfoDO) com.oplus.melody.common.util.s.g((Bundle) obj, "value", ZenModeInfoDO.class);
            case 16:
                return new CompletableFuture();
            case 17:
                return com.oplus.melody.model.db.W.covertToZenModeInformationEntity((ZenModeInfoDO) obj, null);
            case 18:
                return Integer.valueOf(((WhitelistConfigDTO.Function) obj).getMultiDevicesConnect());
            case 19:
                return ((Ba.a) obj).b();
            case 20:
                com.oplus.melody.common.util.y.i("NativeLibInstaller", "ensureInstalled:", (Throwable) obj);
                return null;
            case 21:
                return AdaptiveVolumeItem.lambda$0$2((Throwable) obj);
            case 22:
                String it = (String) obj;
                kotlin.jvm.internal.i.f(it, "it");
                return Boolean.valueOf(Boolean.parseBoolean(it));
            case 23:
                String it2 = (String) obj;
                kotlin.jvm.internal.i.f(it2, "it");
                return Boolean.valueOf(Boolean.parseBoolean(it2));
            case 24:
                String it3 = (String) obj;
                kotlin.jvm.internal.i.f(it3, "it");
                return Boolean.valueOf(Boolean.parseBoolean(it3));
            case 25:
                com.oplus.melody.common.util.y.i("AITranslationSupport", "sendTranslationAppStatus failure", (Throwable) obj);
                return null;
            case 26:
                String it4 = (String) obj;
                kotlin.jvm.internal.i.f(it4, "it");
                return Boolean.valueOf(Boolean.parseBoolean(it4));
            case 27:
                String it5 = (String) obj;
                kotlin.jvm.internal.i.f(it5, "it");
                return (na.a) JsonUtils.c(na.a.class, it5);
            case 28:
                return ((FragmentManager) obj).f9788c.f();
            default:
                return new SupportDeviceConfig((WhitelistConfigDTO) obj);
        }
    }
