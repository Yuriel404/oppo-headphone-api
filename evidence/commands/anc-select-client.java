    @Override // com.oplus.melody.model.repository.earphone.b
    public final CompletableFuture m0(int i10, String str) {
        Bundle bundle = new Bundle();
        bundle.putString("macAddress", str);
        bundle.putInt("value", i10);
        return S0(3058, bundle).thenApply((Function) new c(1));
    }
