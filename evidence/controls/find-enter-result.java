    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.function.Consumer
    public final void accept(Object obj) throws Exception {
        char c2 = 1;
        Object obj2 = this.f1957b;
        switch (this.f1956a) {
            case 0:
                ((Db.d) obj2).invoke(obj);
                return;
            case 1:
                SetCommandStateDTO setCommandStateDTO = (SetCommandStateDTO) obj;
                Fc.d.f fVar = (Fc.d.f) obj2;
                Fc.d dVar = fVar.f2049m;
                if (dVar.f2028m == null || setCommandStateDTO == null || TextUtils.isEmpty(setCommandStateDTO.getAddress()) || !setCommandStateDTO.getAddress().equals(dVar.f2033r)) {
                    return;
                }
                int setCommandStatus = setCommandStateDTO.getSetCommandStatus();
                com.oplus.melody.common.util.y.c("PlayToneStateMachine", new S(setCommandStatus, 10));
                fVar.N(setCommandStatus == 0, false);
                return;
            case 2:
                ((c0) obj2).d((Integer) obj);
                return;
            case 3:
                int i10 = HearingEnhancementActivity.f26116K;
                ((HearingEnhancementActivity) obj2).V(null, false);
                return;
            case 4:
                ((Kb.e) obj2).invoke(obj);
                return;
            case 5:
                ((Kb.e) obj2).invoke(obj);
                return;
            case 6:
                ((Ga.d) obj2).invoke(obj);
                return;
            case 7:
                ((Nb.d) obj2).invoke(obj);
                return;
            case 8:
                ((Ga.r) obj2).invoke(obj);
                return;
            case 9:
                ((Nb.d) obj2).invoke(obj);
                return;
            case 10:
                ((c) obj2).invoke(obj);
                return;
            case 11:
                ((Ga.d) obj2).invoke(obj);
                return;
            case 12:
                AtomicInteger atomicInteger = MelodyAliveProvider.f21690b;
                ((MatrixCursor) obj2).newRow().add("content", JsonUtils.h((WhitelistConfigDTO) obj));
                return;
            case 13:
                ((Xa.c) obj2).t(((Integer) ((ga.a) obj).f5811a).intValue());
                return;
            case 14:
                Za.c cVar = (Za.c) obj;
                com.oplus.melody.ui.component.control.a aVar = (com.oplus.melody.ui.component.control.a) obj2;
                List<String> list = (List) cVar.f5811a;
                com.oplus.melody.common.util.y.c("BaseEarControlFragment", new Gc.f(list, c2 == true ? 1 : 0));
                Pair<Integer, String> pair = cVar.f7752b;
                if (pair == null) {
                    aVar.v(aVar.f24819L, list);
                    return;
                }
                int iIntValue = pair.e().intValue();
                if (aVar.w() != iIntValue) {
                    return;
                }
                com.oplus.melody.common.util.y.c("BaseEarControlFragment", new S(iIntValue, 19));
                String strF = pair.f();
                if (aVar.f24819L != null) {
                    if (TextUtils.equals(strF, aVar.getString(R.string.melody_common_detail_main_set_noise_reduction))) {
                        aVar.v(aVar.f24819L, list);
                    } else {
                        aVar.f24819L.h(strF);
                        aVar.f24819L.g(strF);
                    }
                }
                aVar.y(aVar.f24819L, strF);
                return;
            case 15:
                ((Zb.e) obj2).invoke(obj);
                return;
            case 16:
                WindowFeature windowFeature = (WindowFeature) obj;
                ResponsiveUIFeature.Companion companion = ResponsiveUIFeature.Companion;
                kotlin.jvm.internal.i.f(windowFeature, "windowFeature");
                androidx.lifecycle.u<WindowFeature> uVar = ((ResponsiveUIFeature) obj2).f17859b;
                if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
                    uVar.l(windowFeature);
                    return;
                } else {
                    uVar.i(windowFeature);
                    return;
                }
            case 17:
                ((a8.k) obj2).getAddress();
                ((Ka.c) obj).getClass();
                V8.a.a();
                return;
            case 18:
                ((c) obj2).invoke(obj);
                return;
            case 19:
                Boolean aBoolean = (Boolean) obj;
                kotlin.jvm.internal.i.f(aBoolean, "aBoolean");
                if (aBoolean.booleanValue()) {
                    DeviceDetailFragment deviceDetailFragment = (DeviceDetailFragment) obj2;
                    DetailMainViewModel detailMainViewModel = deviceDetailFragment.f19908p;
                    if (detailMainViewModel == null) {
                        kotlin.jvm.internal.i.j("mViewModel");
                        throw null;
                    }
                    com.oplus.melody.model.repository.earphone.b.G().f(detailMainViewModel.f24786b);
                    deviceDetailFragment.u(true);
                    return;
                }
                return;
            case 20:
                ((com.oplus.melody.health.module.f) obj2).invoke(obj);
                return;
            case 21:
                com.oplus.melody.model.db.l lVar = (com.oplus.melody.model.db.l) obj;
                ((List) ((androidx.collection.a) obj2).computeIfAbsent(lVar.getMacAddress(), new com.oplus.melody.model.db.k())).add(lVar);
                return;
            case 22:
                ((PersonalNoiseItem) obj2).lambda$onRetry$22((SetCommandStateDTO) obj);
                return;
            case 23:
                ((Nb.d) obj2).invoke(obj);
                return;
            case 24:
                eb.r rVar = (eb.r) obj2;
                if (((Boolean) obj).booleanValue()) {
                    com.oplus.melody.model.repository.earphone.b.G().f(rVar.f27817p.f24786b);
                    rVar.A(true);
                    return;
                }
                return;
            case 25:
                int i11 = ControlAutoVolumeActivity.f25152w;
                ((Nb.d) obj2).invoke(obj);
                return;
            case 26:
                ((mc.a) obj2).invoke(obj);
                return;
            case 27:
                ((lc.e) obj2).invoke(obj);
                return;
            default:
                ((Nb.d) obj2).invoke(obj);
                return;
        }
    }
