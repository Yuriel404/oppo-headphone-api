    @Override // com.oplus.melody.model.repository.earphone.b
    public final CompletableFuture l0(int i10, int i11, String str) {
        if (!TextUtils.isEmpty(str)) {
            return R1(str, 1028, new y(i11, i10, str, 1));
        }
        com.oplus.melody.common.util.y.h("EarphoneRepository", "setCurrentNoiseReduction addr is null!");
        return i1();
    }
