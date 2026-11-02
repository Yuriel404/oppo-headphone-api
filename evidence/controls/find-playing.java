        @Override // Fc.d.b, Z4.e
        public final boolean J(Message message) {
            y.c("PlayToneStateMachine", new k(message, 0));
            int i10 = message.what;
            d dVar = d.this;
            if (i10 != 6 && i10 != 106) {
                if (i10 == 103) {
                    O(false);
                    q.a aVar = dVar.f2029n;
                    if (aVar != null) {
                        aVar.a();
                    }
                    dVar.h(dVar.f2020d);
                    return true;
                }
                if (i10 == 104) {
                    dVar.getClass();
                    y.c("PlayToneStateMachine", new Ec.b(z.a.f22440a.b(dVar.f2027l, "PlayToneStateMachine"), 1));
                    q.a aVar2 = dVar.f2029n;
                    if (aVar2 != null) {
                        y.b("FindDeviceFragment", "onPlaying...");
                        Q.c(new Cc.n(aVar2, 2));
                        q qVar = q.this;
                        FindDeviceViewModel findDeviceViewModel = qVar.f1178L;
                        if (findDeviceViewModel != null) {
                            B.m(findDeviceViewModel.f26073c, 1, findDeviceViewModel.f26072b, com.oplus.melody.model.repository.earphone.Q.x(com.oplus.melody.model.repository.earphone.b.G().w(qVar.f1173F)));
                        }
                    }
                    n.c cVar = dVar.f2070b;
                    if (cVar != null) {
                        cVar.removeMessages(106);
                    }
                    dVar.a(106, 50000L);
                    return true;
                }
                if (i10 != 108) {
                    if (i10 != 109) {
                        return super.J(message);
                    }
                    q.a aVar3 = dVar.f2029n;
                    if (aVar3 != null) {
                        Q.c(new Cc.m(aVar3, 0));
                    }
                    dVar.h(dVar.f2020d);
                    return true;
                }
            }
            dVar.g(5);
            return true;
        }
