    @Override // com.oplus.melody.model.repository.earphone.b
    public final CompletableFuture<SetCommandStateDTO> I0(final String str, final int i10, final boolean z10, final boolean z11) {
        if (!TextUtils.isEmpty(str)) {
            return R1(str, 1027, new Supplier() { // from class: com.oplus.melody.model.repository.earphone.I
                @Override // java.util.function.Supplier
                public final Object get() {
                    Wa.a.P(com.oplus.melody.common.util.k.f22410a, str, i10, z10, z11);
                    return new U8.T(5L, TimeUnit.SECONDS);
                }
            });
        }
        com.oplus.melody.common.util.y.h("EarphoneRepository", "setSwitchFeature addr is null!");
        return i1();
    }
