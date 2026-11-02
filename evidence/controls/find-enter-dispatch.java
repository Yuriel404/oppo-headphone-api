        public final void O(boolean z10) {
            y.c("PlayToneStateMachine", new x0(this, z10, 2));
            d dVar = d.this;
            if (dVar.f2030o == null) {
                return;
            }
            CompletableFuture<SetCommandStateDTO> completableFuture = this.f2047k;
            if (completableFuture != null) {
                completableFuture.cancel(true);
            }
            FindDeviceViewModel findDeviceViewModel = dVar.f2030o;
            String str = dVar.f2033r;
            findDeviceViewModel.getClass();
            CompletableFuture<SetCommandStateDTO> completableFutureO0 = com.oplus.melody.model.repository.earphone.b.G().o0(str, z10);
            this.f2047k = completableFutureO0;
            if (completableFutureO0 != null) {
                completableFutureO0.thenAccept((Consumer<? super SetCommandStateDTO>) new Fa.i(this, 1)).exceptionally((Function<Throwable, ? extends Void>) new l(this, z10, 0));
            } else {
                y.h("PlayToneStateMachine", "EnterFindModeState setFindMode mSetCommandFuture is null!");
            }
        }
