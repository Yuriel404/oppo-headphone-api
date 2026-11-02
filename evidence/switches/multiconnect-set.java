    @Override // Lc.o.a
    public final void b() {
        n nVar = this.f3882b;
        MultiDevicesConnectViewModel multiDevicesConnectViewModel = nVar.f3891J;
        String str = nVar.f3885C;
        multiDevicesConnectViewModel.getClass();
        com.oplus.melody.model.repository.earphone.b bVarG = com.oplus.melody.model.repository.earphone.b.G();
        boolean z10 = this.f3881a;
        bVarG.H0(17, z10, str).thenAcceptAsync((Consumer) new i(nVar, z10, 0), (Executor) Q.c.f6062b).exceptionally((Function<Throwable, ? extends Void>) new Da.f(10));
    }
