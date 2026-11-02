    @Override // com.oplus.melody.model.repository.earphone.b
    public final CompletableFuture u0(int i10, String str) {
        if (!TextUtils.isEmpty(str)) {
            return R1(str, 1058, new Ga.u(str, i10, 8));
        }
        com.oplus.melody.common.util.y.h("EarphoneRepository", "setHeadSetSpatialType addr is null!");
        return i1();
    }
