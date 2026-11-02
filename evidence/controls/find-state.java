    public final void y(boolean z10) {
        y.c("FindDeviceFragment", new Bc.c(z10, 1));
        Fc.d dVar = this.f1179M;
        if (dVar != null) {
            if (!z10) {
                dVar.g(5);
                return;
            }
            String str = this.f1173F;
            if (TextUtils.isEmpty(str)) {
                return;
            }
            if (!dVar.f()) {
                y.b("PlayToneStateMachine", "not in idle state return");
                return;
            }
            dVar.f2033r = str;
            CompletableFuture<SetCommandStateDTO> completableFuture = dVar.f2036u;
            if (completableFuture != null) {
                completableFuture.cancel(true);
            }
            dVar.g(3);
        }
    }
