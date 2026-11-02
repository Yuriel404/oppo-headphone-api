    @Override // com.oplus.melody.model.repository.earphone.b
    public final CompletableFuture<SetCommandStateDTO> o0(String str, boolean z10) {
        if (TextUtils.isEmpty(str)) {
            com.oplus.melody.common.util.y.h("EarphoneRepository", "setFindMode addr is null!");
            return i1();
        }
        Ja.h hVar = new Ja.h(1, z10, str);
        return (CompletableFuture) this.f24287R.compute(o1(1024, str), new Ma.g(hVar, 7));
    }
