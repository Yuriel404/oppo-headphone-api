    @Override // java.util.function.Supplier
    public final Object get() {
        switch (this.f2287a) {
            case 0:
                return "realtimeMonitorSwitch.setSpineLiveMonitorStatus: " + this.f2288b;
            case 1:
                return "reminderSoundCheck.setSpineEarToneRemindStatus: " + this.f2288b;
            case 2:
                return androidx.appcompat.widget.a.g(this.f2288b.getSetCommandStatus(), "setMultiConnectSwitchStatus setCommandStatus = ");
            default:
                return "sendTranslationAppStatus setCommandState=" + this.f2288b;
        }
    }
