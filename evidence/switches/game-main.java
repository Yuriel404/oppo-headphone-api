    public final CompletableFuture<SetCommandStateDTO> E(String address, String str, boolean z10) {
        CompletableFuture<SetCommandStateDTO> completableFuture = this.f25541N;
        if (completableFuture != null) {
            completableFuture.cancel(true);
        }
        if (this.f25534F == null) {
            i.j("mGameSetVM");
            throw null;
        }
        i.f(address, "address");
        CompletableFuture<SetCommandStateDTO> completableFutureH0 = com.oplus.melody.model.repository.earphone.b.G().H0(40, z10, address);
        i.e(completableFutureH0, "setGameModeMainEnable(...)");
        this.f25541N = completableFutureH0;
        CompletableFuture<Void> completableFutureThenAccept = completableFutureH0.thenAccept((Consumer<? super SetCommandStateDTO>) new Da.d(new Kb.g(str, address, this, z10), 5));
        if (completableFutureThenAccept != null) {
            completableFutureThenAccept.exceptionally((Function<Throwable, ? extends Void>) new A8.a(9));
        }
        COUIPreferenceCategory cOUIPreferenceCategory = this.f25539L;
        if (cOUIPreferenceCategory == null) {
            i.j("mGameSoundCategory");
            throw null;
        }
        cOUIPreferenceCategory.setEnabled(z10);
        COUIPreferenceCategory cOUIPreferenceCategory2 = this.f25536I;
        if (cOUIPreferenceCategory2 != null) {
            cOUIPreferenceCategory2.setEnabled(z10);
            return this.f25541N;
        }
        i.j("mGameLowLatencyCategory");
        throw null;
    }
