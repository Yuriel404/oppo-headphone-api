    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference incomplete: some casts might be missing */
    @Override // java.lang.Runnable
    public final void run() {
        H1 h10;
        int i10;
        switch (this.f913a) {
            case 0:
                ((BluetoothProfile.ServiceListener) this.f915c).onServiceConnected(this.f914b, (BluetoothProfile) this.f916p);
                return;
            case 1:
                F8.j.a aVar = (F8.j.a) this.f915c;
                Q8.a.c("m_bt_le.GattConnection", new A9.d((BluetoothGatt) this.f916p, 6));
                F8.j jVar = F8.j.this;
                jVar.getClass();
                if (this.f914b != 0) {
                    Q8.a.m("m_bt_le.GattConnection", "onServicesDiscovered failed");
                    synchronized (jVar) {
                        jVar.f1886l = 3;
                    }
                    jVar.f1878c.a(2008);
                    return;
                }
                Q8.a.a("m_bt_le.GattConnection", "onServicesDiscovered Succeed");
                synchronized (jVar) {
                    jVar.f1886l = 2;
                }
                jVar.f1887m = 0;
                jVar.l(F8.m.f1898F, F8.m.H);
                return;
            case 2:
                com.google.common.util.concurrent.r rVar = (com.google.common.util.concurrent.r) this.f916p;
                int i11 = this.f914b;
                b0 b0Var = (b0) this.f915c;
                b0Var.getClass();
                try {
                    h10 = (H1) rVar.get();
                    com.google.common.base.f.j(h10, "SessionResult must not be null");
                } catch (InterruptedException e3) {
                    e = e3;
                    b0.o.h("MCImplBase", "Session operation failed", e);
                    h10 = new H1(-1);
                } catch (CancellationException e10) {
                    b0.o.h("MCImplBase", "Session operation cancelled", e10);
                    h10 = new H1(1);
                } catch (ExecutionException e11) {
                    e = e11;
                    b0.o.h("MCImplBase", "Session operation failed", e);
                    h10 = new H1(-1);
                }
                IMediaSession iMediaSession = b0Var.f12104D;
                if (iMediaSession == null) {
                    return;
                }
                try {
                    iMediaSession.onControllerResult(b0Var.f12111c, i11, h10.b());
                    return;
                } catch (RemoteException unused) {
                    b0.o.g("MCImplBase", "Error in sending");
                    return;
                }
                break;
            case 3:
                Serializable serializable = ((e.a.C0254a) this.f916p).f27138a;
                b.k.f fVar = (b.k.f) this.f915c;
                String str = (String) fVar.f26799a.get(Integer.valueOf(this.f914b));
                if (str == null) {
                    return;
                }
                d.e.a aVar2 = (d.e.a) fVar.f26803e.get(str);
                if ((aVar2 != null ? aVar2.f26806a : null) == null) {
                    fVar.f26805g.remove(str);
                    fVar.f26804f.put(str, serializable);
                    return;
                }
                d.a<O> aVar3 = aVar2.f26806a;
                kotlin.jvm.internal.i.d(aVar3, "null cannot be cast to non-null type androidx.activity.result.ActivityResultCallback<O of androidx.activity.result.ActivityResultRegistry.dispatchResult>");
                if (fVar.f26802d.remove(str)) {
                    aVar3.b((O) serializable);
                    return;
                }
                return;
            case 4:
                ((List) this.f915c).forEach(new com.oplus.melody.common.util.w((String) this.f916p, this.f914b));
                return;
            case 5:
                ((k1.a) this.f915c).f30017a.a(this.f914b, (Serializable) this.f916p);
                return;
            case 6:
                SpatialAudioContentFragment spatialAudioContentFragment = (SpatialAudioContentFragment) this.f915c;
                boolean zF = spatialAudioContentFragment.w().f(spatialAudioContentFragment.f25789E);
                if (!zF && (i10 = this.f914b) < 1) {
                    spatialAudioContentFragment.u(i10 + 1);
                }
                Q.c.f6062b.execute(new Mc.n(spatialAudioContentFragment, (ModeItem) this.f916p, zF));
                com.oplus.melody.common.util.y.c("SpatialAudioContentFragment", new E8.b(zF, spatialAudioContentFragment, 8));
                return;
            default:
                ((com.coui.appcompat.poplist.b.C0188b) this.f915c).f16651a.C(this.f914b, (View) this.f916p);
                return;
        }
    }
