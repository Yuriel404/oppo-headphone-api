    /* JADX INFO: Access modifiers changed from: private */
    public final void setHiResSoundEnable(boolean enable) {
        CompletableFuture<Void> completableFutureThenAccept;
        y.y("HiQualityAudioItem", "setHiResSoundEnable.setHiQualityAudioStatus, enable: " + enable + ", isChecked: " + isChecked());
        CompletableFuture<SetCommandStateDTO> completableFuture = this.setCommandFuture;
        if (completableFuture != null) {
            completableFuture.cancel(true);
        }
        CompletableFuture<SetCommandStateDTO> completableFutureH0 = com.oplus.melody.model.repository.earphone.b.G().H0(24, enable, this.mViewModel.f24786b);
        this.setCommandFuture = completableFutureH0;
        if (completableFutureH0 == null || (completableFutureThenAccept = completableFutureH0.thenAccept((Consumer<? super SetCommandStateDTO>) new Da.d(new Lb.c(this, enable, 2), 26))) == null) {
            return;
        }
        completableFutureThenAccept.exceptionally((Function<Throwable, ? extends Void>) new q4.a(3));
    }
