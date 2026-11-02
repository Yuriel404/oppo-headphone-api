    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public SupportDeviceConfig(WhitelistConfigDTO config) {
        this(config.getId(), config.getName(), config.getBrand(), config.getType(), config.getMinRssi(), config.getUuid(), config.getSupportSpp(), config.getDefaultColor());
        i.f(config, "config");
    }
