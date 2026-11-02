    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i10) {
        int i11 = 0;
        int i12 = 1;
        switch (this.f414a) {
            case 0:
                Z z10 = (Z) this.f415b;
                ArrayList arrayList = (ArrayList) this.f416c;
                int size = arrayList.size();
                int i13 = 0;
                while (i13 < size) {
                    Object obj = arrayList.get(i13);
                    i13++;
                    CustomEqPreference customEqPreference = (CustomEqPreference) obj;
                    z10.f264E.j(customEqPreference);
                    ta.b bVar = customEqPreference.f25469s;
                    if (bVar != null) {
                        if (z10.f292h0 == bVar.getEqId()) {
                            z10.f292h0 = -1;
                        }
                        ta.c.e().i(3, z10.f278T, bVar);
                        z10.f289e0.add(bVar);
                    }
                }
                MenuItem menuItem = z10.f271M;
                if (menuItem != null) {
                    menuItem.setEnabled(false);
                }
                MenuItem menuItem2 = z10.f273O;
                if (menuItem2 != null) {
                    menuItem2.setTitle(com.oplus.melody.common.util.k.f22410a.getString(R.string.melody_ui_common_select_all));
                }
                MenuItem menuItem3 = z10.f272N;
                if (menuItem3 != null) {
                    menuItem3.setEnabled(false);
                }
                z10.K();
                U8.Q.b.f6060a.schedule(new E(z10, i11), 1L, TimeUnit.SECONDS);
                break;
            case 1:
                float[] fArr = Ic.p0.f3205P0;
                ForkJoinPool.commonPool().execute(new O(8, (Ic.p0) this.f415b, (EarphoneDTO) this.f416c));
                break;
            case 2:
                Mc.r rVar = (Mc.r) this.f415b;
                MultiDevicesConnectViewModel multiDevicesConnectViewModel = rVar.f4279L;
                String str = rVar.f4271C;
                multiDevicesConnectViewModel.getClass();
                com.oplus.melody.model.repository.multidevicesconnect.a aVarA = com.oplus.melody.model.repository.multidevicesconnect.a.a();
                String str2 = (String) this.f416c;
                CompletableFuture completableFutureE = aVarA.e(str, 3, str2, false);
                if (completableFutureE != null) {
                    completableFutureE.thenAccept((Consumer) new Bc.e(i12, rVar, str2)).exceptionally((Function<Throwable, ? extends Void>) new A8.a(10));
                } else {
                    com.oplus.melody.common.util.y.h("MultipleDevicesConnectionFragmentV2", "unpairHandheldDevice future is null!");
                }
                break;
            case 3:
                Ma.x.D(true);
                Xa.a aVar = (Xa.a) this.f415b;
                List<String> list = com.oplus.melody.common.util.S.f22375a;
                if (BuildConfig.APPLICATION_ID.equals(aVar.getPackageName())) {
                    Ma.x.G();
                }
                ((Runnable) this.f416c).run();
                dialogInterface.dismiss();
                break;
            default:
                dialogInterface.dismiss();
                Iterator it = ((List) this.f415b).iterator();
                while (it.hasNext()) {
                    ((CarouselDressListFragment) this.f416c).v(((CarouselDressDTO) it.next()).getCarouselId());
                }
                break;
        }
    }
