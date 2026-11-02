        @Override // Z4.e
        public final void l() {
            d dVar = d.this;
            int i10 = dVar.f2034s;
            if (i10 == 2 && dVar.f2035t) {
                dVar.h(dVar.f2022f);
                y.b("PlayToneStateMachine", "CheckConnectedState enter connected and capability is ok to check in ear");
                return;
            }
            if (i10 == 2) {
                dVar.g(101);
                d dVar2 = d.this;
                if (dVar2.f2030o != null) {
                    d.b(dVar2, this.f2041j);
                    return;
                }
                return;
            }
            y.c("PlayToneStateMachine", new A9.d(this, 8));
            d dVar3 = d.this;
            n.c cVar = dVar3.f2070b;
            if (!(cVar == null ? false : cVar.hasMessages(110))) {
                dVar3.a(110, AcBaseConstants.TIMEOUT_REQ);
            }
            d.this.g(101);
            d.this.g(3);
            d dVar4 = d.this;
            if (dVar4.f2030o != null) {
                Fc.f fVar = this.f2040i;
                if (fVar != null) {
                    synchronized (dVar4.f2024i) {
                        try {
                            if (!dVar4.f2024i.contains(fVar)) {
                                dVar4.f2024i.add(fVar);
                            }
                        } catch (Throwable th) {
                            throw th;
                        }
                    }
                }
                d.b(d.this, this.f2041j);
            }
        }
