    @Override // com.oplus.melody.ui.component.detail.spatialaudio.BaseSpatialAudioVM
    public final CompletableFuture<SetCommandStateDTO> h(int i10, String address) {
        CompletableFuture completableFutureThenApply;
        i.f(address, "address");
        y.c("HeadSetSpatialAudioVMV2", new o(i10, 19));
        Integer numD = this.f25773d.d();
        f.k(this.f25773d, Integer.valueOf(i10));
        String str = this.f25771b;
        if (str == null) {
            i.j("mAddress");
            throw null;
        }
        CompletableFuture completableFutureU0 = com.oplus.melody.model.repository.earphone.b.G().u0(i10, str);
        if (completableFutureU0 == null || (completableFutureThenApply = completableFutureU0.thenApply((Function) new db.b(new l(this, i10, 2, numD), 7))) == null) {
            return null;
        }
        return completableFutureThenApply.exceptionally((Function) new X0(i10, this, numD));
    }
