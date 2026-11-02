        public final void N(boolean z10, boolean z11) {
            q.a aVar;
            y.c("PlayToneStateMachine", new m(0, z10, z11));
            d dVar = d.this;
            if (z10) {
                n.c cVar = dVar.f2070b;
                if (cVar != null) {
                    cVar.removeMessages(103);
                }
                dVar.g(104);
                return;
            }
            if (!z11 && (aVar = dVar.f2029n) != null) {
                aVar.a();
            }
            dVar.g(1);
        }
