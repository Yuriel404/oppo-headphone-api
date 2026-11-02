    @Override // com.oplus.melody.ui.component.detail.spatialaudio.BaseSpatialAudioVM
    public final CompletableFuture<SetCommandStateDTO> h(int i10, String address) {
        CompletableFuture completableFutureThenApply;
        CompletableFuture completableFutureThenApply2;
        i.f(address, "address");
        y.c("HeadSetSpatialAudioVM", new o(i10, 18));
        Integer numD = this.f25773d.d();
        if (i10 == 0) {
            f.k(this.f25773d, 0);
            String str = this.f25771b;
            if (str == null) {
                i.j("mAddress");
                throw null;
            }
            CompletableFuture completableFutureH0 = com.oplus.melody.model.repository.earphone.b.G().H0(27, false, str);
            if (completableFutureH0 != null && (completableFutureThenApply = completableFutureH0.thenApply((Function) new db.b(new g(19, this, numD), 6))) != null) {
                return completableFutureThenApply.exceptionally((Function) new F(4, this, numD));
            }
        } else if (i10 == 1) {
            f.k(this.f25773d, 1);
            String str2 = this.f25771b;
            if (str2 == null) {
                i.j("mAddress");
                throw null;
            }
            CompletableFuture completableFutureH1 = com.oplus.melody.model.repository.earphone.b.G().H0(27, true, str2);
            if (completableFutureH1 != null && (completableFutureThenApply2 = completableFutureH1.thenApply((Function) new k0(new U8.c(14, this, numD), 28))) != null) {
                return completableFutureThenApply2.exceptionally((Function) new W(5, this, numD));
            }
        }
        return null;
    }
