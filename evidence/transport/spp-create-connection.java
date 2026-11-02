    public final void o(UUID uuid) {
        G8.b bVar = new G8.b();
        this.f2234B = bVar;
        bVar.f2640l = true;
        bVar.f2632c = g0.e.b(bVar.f2630a, "_command");
        G8.b bVar2 = this.f2234B;
        H8.b.a aVar = this.f2660z;
        synchronized (bVar2) {
            bVar2.f2635f = aVar;
        }
        G8.b bVar3 = this.f2234B;
        bVar3.f2653y.add(this.f2238F);
        G8.b bVar4 = this.f2234B;
        synchronized (bVar4) {
            bVar4.f2633d = uuid;
        }
        HandlerThread handlerThread = new HandlerThread("BRClientDevice");
        this.f2235C = handlerThread;
        handlerThread.start();
        this.f2236D = new Handler(this.f2235C.getLooper(), this);
        this.f2239G = true;
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.bluetooth.device.action.BOND_STATE_CHANGED");
        j.f(this.f1573a, this.H, intentFilter, null, Q.a.f6058b.a());
    }
