    public static void e(Context context, String address, int i10, int i11, Te.a aVar) {
        i.f(address, "address");
        ArrayList arrayList = new ArrayList();
        arrayList.add(new KeyFunctionInfoDTO(i11, 1, 4, i10));
        CompletableFuture completableFutureX0 = b.G().x0(address, context, arrayList, 1025);
        if (completableFutureX0 != null) {
            completableFutureX0.whenComplete((BiConsumer) new C9.c(new C9.b(aVar, 4), 12));
        }
    }
