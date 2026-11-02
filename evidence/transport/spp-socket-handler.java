        /* JADX WARN: Code duplicated, block: B:82:0x01f1  */
        /* JADX WARN: Instruction removed from duplicated block: B:82:0x01f1, please report this as an issue */
        /* JADX WARN: Type inference fix 'apply assigned field type' failed
        java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
            at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:596)
            at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
            at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
            at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
            at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
            at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
            at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
         */
        @Override // android.os.Handler.Callback
        public final boolean handleMessage(Message message) {
            boolean zCompareAndSet;
            if (message.what == 1) {
                G8.b bVar = (G8.b) a.this;
                boolean z10 = false;
                if (bVar.h == null) {
                    Q8.a.f(bVar.f2632c, "handleConnectSocket: mBluetoothDevice is null");
                    bVar.f2651w = false;
                    bVar.k(3);
                    bVar.h(DataTypeConstants.USER_ACTION, bVar);
                } else {
                    BluetoothDevice bluetoothDevice = bVar.h;
                    if (bVar.f2639k != null) {
                        Q8.a.c(bVar.f2632c, new B8.a(2));
                    } else {
                        try {
                            bVar.f2639k = bluetoothDevice.createRfcommSocketToServiceRecord(bVar.f2633d);
                            Q8.a.c(bVar.f2632c, new G8.a(0));
                        } catch (Exception e3) {
                            Q8.a.h(bVar.f2632c, "m_spp_le.createSocket.createRfcommSocketToServiceRecord failed : ", e3);
                            bVar.k(3);
                            bVar.h(3009, bVar);
                            Q8.a.a(bVar.f2632c, "handleSocketCreate(), createSocket fail");
                            bVar.f2651w = false;
                        }
                    }
                    bVar.f2651w = false;
                    if (bVar.f2634e == 2) {
                        Q8.a.c(bVar.f2632c, new g(3));
                    } else if (bVar.f2227A.get()) {
                        BluetoothSocket bluetoothSocket = bVar.f2639k;
                        try {
                            if (bluetoothSocket == null) {
                                Q8.a.i(bVar.f2632c, "m_spp_le.startSocketConnect: socket is null, device=" + Q8.a.l(bVar.h));
                                bVar.f2228B.set(-1);
                                bVar.o(-1);
                            } else {
                                try {
                                    Q8.a.i(bVar.f2632c, "m_spp_le.startSocketConnect: start device=" + Q8.a.l(bVar.h));
                                    bVar.f2228B.set(0);
                                    bVar.l();
                                    bVar.f2230D = Q.b.f6060a.schedule(bVar.f2229C, 10L, TimeUnit.SECONDS);
                                    m.f6120d.getClass();
                                    R8.a.f5420a.getClass();
                                    if (!R8.a.a()) {
                                        throw new IOException("socketConnect disabled by privacy");
                                    }
                                    bluetoothSocket.connect();
                                    zCompareAndSet = bVar.f2228B.compareAndSet(0, 1);
                                    try {
                                        Q8.a.i(bVar.f2632c, "m_spp_le.startSocketConnect: end success=" + zCompareAndSet + " device=" + Q8.a.l(bVar.h));
                                    } catch (Exception e10) {
                                        e = e10;
                                        Q8.a.h(bVar.f2632c, "m_spp_le.startSocketConnect: err device=" + Q8.a.l(bVar.h), e);
                                        bVar.f2228B.compareAndSet(0, 3);
                                    }
                                    bVar.l();
                                    if (!zCompareAndSet) {
                                        bVar.o(bVar.f2228B.get());
                                    } else if (bVar.f2228B.get() == 1 && bVar.f2639k == bluetoothSocket) {
                                        BluetoothDevice bluetoothDevice2 = bVar.h;
                                        BluetoothSocket bluetoothSocket2 = bVar.f2639k;
                                        if (bluetoothDevice2 == null || bluetoothSocket2 == null) {
                                            String str = bVar.f2632c;
                                            StringBuilder sb2 = new StringBuilder("notifyConnectionConnected: device/socket null, skip deviceNull=");
                                            sb2.append(bluetoothDevice2 == null);
                                            sb2.append(" socketNull=");
                                            sb2.append(bluetoothSocket2 == null);
                                            Q8.a.f(str, sb2.toString());
                                        } else {
                                            bVar.k(2);
                                            H8.b.a aVar = bVar.f2635f;
                                            if (aVar != null) {
                                                G8.d dVar = aVar.f2661a;
                                                int i10 = dVar.f2234B.f2634e;
                                                Q8.a.c("BRClientDevice", new r0(i10, 6));
                                                if (i10 == 2) {
                                                    dVar.h(bVar, bluetoothDevice2);
                                                }
                                            }
                                            z10 = true;
                                        }
                                        if (z10) {
                                            Q8.a.a(bVar.f2632c, "initReadAndWrite");
                                            bVar.f2647s.sendEmptyMessage(1);
                                            bVar.f2649u.sendEmptyMessage(1);
                                        } else {
                                            Q8.a.m(bVar.f2632c, "m_spp_le.startSocketConnect: aborted after connect success, treat as fail device=" + Q8.a.l(bVar.h));
                                            bVar.f2228B.compareAndSet(1, 3);
                                            bVar.o(bVar.f2228B.get());
                                        }
                                    } else {
                                        Q8.a.m(bVar.f2632c, "m_spp_le.startSocketConnect: aborted after connect success, treat as fail device=" + Q8.a.l(bVar.h));
                                        bVar.f2228B.compareAndSet(1, 3);
                                        bVar.o(bVar.f2228B.get());
                                    }
                                } catch (Exception e11) {
                                    e = e11;
                                    zCompareAndSet = false;
                                }
                            }
                        } catch (Throwable th) {
                            bVar.l();
                            throw th;
                        }
                    } else {
                        Q8.a.c(bVar.f2632c, new F8.d(1));
                        Q8.a.a(bVar.f2632c, "abortToConnect()");
                        bVar.l();
                        bVar.f2228B.set(3);
                        bVar.b();
                        bVar.k(3);
                        H8.b.a aVar2 = bVar.f2635f;
                        if (aVar2 != null) {
                            G8.d dVar2 = aVar2.f2661a;
                            synchronized (dVar2.f1574b) {
                                try {
                                    if (dVar2.f1577q != 3) {
                                        synchronized (dVar2.f1574b) {
                                            Q8.a.c("Device", new E8.a(dVar2, 0));
                                            dVar2.f1577q = 3;
                                        }
                                        Message messageObtain = Message.obtain();
                                        messageObtain.what = DeviceInfo.FEATURE_SUPPORT_IN_EAR_DETECTION_MUSIC_MUTE;
                                        messageObtain.obj = bVar;
                                        dVar2.f1584x.sendMessage(messageObtain);
                                    }
                                } catch (Throwable th2) {
                                    throw th2;
                                }
                            }
                        }
                    }
                }
            }
            return true;
        }
