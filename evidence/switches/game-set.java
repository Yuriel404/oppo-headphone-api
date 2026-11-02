    public final void D(String address, String str, final boolean z10) {
        int[] supportTypes;
        y.c("GameSetFragment", new p(z10, this, 3));
        if (z10 || !this.f25546S) {
            CompletableFuture<SetCommandStateDTO> completableFuture = this.f25543P;
            if (completableFuture != null) {
                completableFuture.cancel(true);
            }
            if (this.f25534F == null) {
                i.j("mGameSetVM");
                throw null;
            }
            i.f(address, "address");
            CompletableFuture<SetCommandStateDTO> completableFutureH0 = com.oplus.melody.model.repository.earphone.b.G().H0(6, z10, address);
            i.e(completableFutureH0, "setGameModeStatus(...)");
            this.f25543P = completableFutureH0;
            CompletableFuture<Void> completableFutureThenAccept = completableFutureH0.thenAccept((Consumer<? super SetCommandStateDTO>) new Fa.i(new e(str, address, this, z10), 5));
            if (completableFutureThenAccept != null) {
                completableFutureThenAccept.exceptionally(new Function() { // from class: Kb.f
                    @Override // java.util.function.Function
                    public final Object apply(Object obj) {
                        com.oplus.melody.common.util.y.i("GameSetFragment", "setGameModeEnable enable:" + z10, (Throwable) obj);
                        return null;
                    }
                });
                return;
            }
            return;
        }
        E(address, str, false);
        GameSoundInfo gameSoundInfo = this.f25545R;
        ArrayList arrayListB = B(gameSoundInfo != null ? gameSoundInfo.getSupportTypes() : null);
        GameSoundInfo gameSoundInfo2 = this.f25545R;
        Objects.toString((gameSoundInfo2 == null || (supportTypes = gameSoundInfo2.getSupportTypes()) == null) ? null : He.k.s0(supportTypes));
        arrayListB.toString();
        if (!arrayListB.isEmpty() && ((WhitelistConfigDTO.GameSound) arrayListB.get(0)).getType() != 0) {
            GameSetViewModel gameSetViewModel = this.f25534F;
            if (gameSetViewModel == null) {
                i.j("mGameSetVM");
                throw null;
            }
            String str2 = this.f25531C;
            if (str2 == null) {
                i.j("mAddress");
                throw null;
            }
            gameSetViewModel.i(((WhitelistConfigDTO.GameSound) arrayListB.get(0)).getType(), str2);
        }
        COUISwitchPreference cOUISwitchPreference = this.f25537J;
        if (cOUISwitchPreference != null) {
            cOUISwitchPreference.setChecked(true);
        } else {
            i.j("mGameLowLatencySwitchPreference");
            throw null;
        }
    }
