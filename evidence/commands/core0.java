    public final void I0(String str, CurrentNoiseModeInfo currentNoiseModeInfo) {
        A a3 = this.mSetCommandManager;
        if (!a3.f22195d.c(1028, str)) {
            Q8.a.d("SetCommandManager", new com.oplus.melody.btsdk.protocol.commands.v(0), str);
        } else {
            if (currentNoiseModeInfo == null) {
                Q8.a.f("SetCommandManager", "setCurrentNoiseReduction currentNoiseModeInfo is null, return; ");
                return;
            }
            a3.f22193b.z0(str, a3.f22192a.a(str, 1028, currentNoiseModeInfo.getData()));
        }
    }
