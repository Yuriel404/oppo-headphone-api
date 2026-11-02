    @Override // com.oplus.melody.model.repository.earphone.b
    @SuppressLint({"WrongConstant"})
    public final CompletableFuture x0(String str, Context context, List list, int i10) {
        if (!TextUtils.isEmpty(str)) {
            return (list == null || list.isEmpty()) ? U8.T.b(MelodyException.f(0, "infoList null or empty")) : R1(str, i10, new I9.g(str, context, list, i10));
        }
        com.oplus.melody.common.util.y.h("EarphoneRepository", "setKeyFunctions addr is null!");
        return i1();
    }
