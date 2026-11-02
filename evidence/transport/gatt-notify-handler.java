    @Override // java.lang.Runnable
    public final void run() {
        Context applicationContext;
        int i10 = 29;
        boolean z10 = false;
        int i11 = 1;
        switch (this.f1865a) {
            case 0:
                j.a aVar = (j.a) this.f1866b;
                BluetoothGattCharacteristic bluetoothGattCharacteristic = (BluetoothGattCharacteristic) this.f1867c;
                if (bluetoothGattCharacteristic != null) {
                    y.a aVar2 = Q8.a.f5077a;
                    boolean zL = y.l();
                    byte[] bArr = (byte[]) this.f1868p;
                    j jVar = aVar.f1893a;
                    if (zL) {
                        Q8.a.a("m_bt_le.GattConnection", "onCharacteristicChanged, " + jVar + ", value = " + Wa.a.g(bArr));
                    }
                    bluetoothGattCharacteristic.getService().getUuid();
                    bluetoothGattCharacteristic.getUuid();
                    byte[] bArr2 = (byte[]) bArr.clone();
                    if (jVar.f1890p == null) {
                        return;
                    }
                    m mVar = m.this;
                    Objects.toString(mVar);
                    Iterator<E8.f> it = mVar.f1576p.iterator();
                    while (it.hasNext()) {
                        it.next().d(mVar, bArr2);
                    }
                    return;
                }
                return;
            case 1:
                EarphoneDTO earphoneDTO = (EarphoneDTO) this.f1866b;
                if (earphoneDTO != null) {
                    com.oplus.melody.leaudio.b bVar = com.oplus.melody.leaudio.b.C0246b.f23939a;
                    Nc.g gVar = (Nc.g) this.f1867c;
                    TutorialGuideFunctionsViewModel tutorialGuideFunctionsViewModel = gVar.f4535C;
                    if (tutorialGuideFunctionsViewModel == null) {
                        kotlin.jvm.internal.i.j("mViewModel");
                        throw null;
                    }
                    if (bVar.e(tutorialGuideFunctionsViewModel.f26219b, LeFilterConstants.FunType.SPATIAL_AUDIO.getFunType())) {
                        TutorialGuideFunctionsViewModel tutorialGuideFunctionsViewModel2 = gVar.f4535C;
                        if (tutorialGuideFunctionsViewModel2 == null) {
                            kotlin.jvm.internal.i.j("mViewModel");
                            throw null;
                        }
                        if (!SpatialAudioItem.isPhoneSupportSpatial(tutorialGuideFunctionsViewModel2.f26219b)) {
                            z10 = true;
                        }
                    }
                    boolean zM = Q.m(298, earphoneDTO.getEarCapability());
                    Wa.a.u().getClass();
                    Ge.b<List<Te.l<String, Class<?>>>> bVar2 = Xa.h.h;
                    Xa.h hVarA = Xa.h.a.a("/ui/tutorial_guide/spatial_audio");
                    TutorialGuideFunctionsViewModel tutorialGuideFunctionsViewModel3 = gVar.f4535C;
                    if (tutorialGuideFunctionsViewModel3 == null) {
                        kotlin.jvm.internal.i.j("mViewModel");
                        throw null;
                    }
                    hVarA.f("device_mac_info", tutorialGuideFunctionsViewModel3.f26219b);
                    TutorialGuideFunctionsViewModel tutorialGuideFunctionsViewModel4 = gVar.f4535C;
                    if (tutorialGuideFunctionsViewModel4 == null) {
                        kotlin.jvm.internal.i.j("mViewModel");
                        throw null;
                    }
                    hVarA.f("device_name", tutorialGuideFunctionsViewModel4.f26221d);
                    TutorialGuideFunctionsViewModel tutorialGuideFunctionsViewModel5 = gVar.f4535C;
                    if (tutorialGuideFunctionsViewModel5 == null) {
                        kotlin.jvm.internal.i.j("mViewModel");
                        throw null;
                    }
                    hVarA.f("product_id", tutorialGuideFunctionsViewModel5.f26220c);
                    hVarA.f6696b.putExtra("support_new_headset_spatial", zM);
                    TutorialGuideFunctionsViewModel tutorialGuideFunctionsViewModel6 = gVar.f4535C;
                    if (tutorialGuideFunctionsViewModel6 == null) {
                        kotlin.jvm.internal.i.j("mViewModel");
                        throw null;
                    }
                    hVarA.f("product_color", tutorialGuideFunctionsViewModel6.f26222e);
                    hVarA.f("resZipConfig", JsonUtils.h(gVar.f4540I));
                    hVarA.f6696b.putExtra("route_value", true);
                    hVarA.f6696b.putExtra("route_value2", z10);
                    hVarA.b((androidx.fragment.app.f) this.f1868p);
                    return;
                }
                return;
            case 2:
                Messenger messenger = (Messenger) this.f1867c;
                Messenger messenger2 = (Messenger) u.f6153j.getValue();
                Message message = (Message) this.f1866b;
                message.replyTo = messenger2;
                try {
                    messenger.send(message);
                    break;
                } catch (DeadObjectException unused) {
                    V8.a.b("MelodyMessengerClientHelper.DeadObjectException");
                } catch (RemoteException e3) {
                    y.i("MelodyMessengerClientHelper", "sendMessages", e3);
                }
                y.c("MelodyMessengerClientHelper", new q(message, SystemClock.elapsedRealtime() - ((u.b) this.f1868p).f6160d, i11));
                return;
            case 3:
                s sVar = (s) this.f1866b;
                sVar.getClass();
                MelodyResourceDO melodyResourceDO = (MelodyResourceDO) this.f1867c;
                if (melodyResourceDO != null && (melodyResourceDO.getLeft() != null || melodyResourceDO.getTop() != null || melodyResourceDO.getRight() != null || melodyResourceDO.getBottom() != null)) {
                    M.f(melodyResourceDO, sVar.f7503t, sVar.f7508y);
                }
                MelodyResourceDO melodyResourceDO2 = (MelodyResourceDO) this.f1868p;
                if (melodyResourceDO2 != null) {
                    if (melodyResourceDO2.getLeft() == null && melodyResourceDO2.getTop() == null && melodyResourceDO2.getRight() == null && melodyResourceDO2.getBottom() == null) {
                        return;
                    }
                    M.f(melodyResourceDO2, sVar.f7506w, sVar.f7508y);
                    return;
                }
                return;
            case 4:
                ViewGroup container = (ViewGroup) this.f1866b;
                kotlin.jvm.internal.i.f(container, "$container");
                DefaultSpecialEffectsController.a this$0 = (DefaultSpecialEffectsController.a) this.f1868p;
                kotlin.jvm.internal.i.f(this$0, "this$0");
                container.endViewTransition((View) this.f1867c);
                this$0.f9711c.f9728a.c(this$0);
                return;
            case 5:
                DefaultSpecialEffectsController.TransitionEffect this$1 = (DefaultSpecialEffectsController.TransitionEffect) this.f1868p;
                kotlin.jvm.internal.i.f(this$1, "this$0");
                v.a(((SpecialEffectsController.Operation) this.f1866b).f9837c, ((SpecialEffectsController.Operation) this.f1867c).f9837c, this$1.f9707o, this$1.f9706n);
                return;
            case 6:
                if (((p0) this.f1866b).f12179w.m((z0.f) this.f1867c, 50004)) {
                    throw null;
                }
                ((androidx.media3.session.legacy.f.g) this.f1868p).f(null);
                return;
            case 7:
                r rVar = (r) this.f1866b;
                com.google.common.util.concurrent.u uVar = (com.google.common.util.concurrent.u) this.f1867c;
                try {
                    try {
                        uVar.o(((com.google.common.util.concurrent.i) this.f1868p).apply(com.google.common.util.concurrent.n.K(rVar)));
                        return;
                    } catch (Throwable th) {
                        uVar.n(th);
                        return;
                    }
                } catch (Error e10) {
                    e = e10;
                    uVar.n(e);
                    return;
                } catch (CancellationException unused2) {
                    uVar.cancel(false);
                    return;
                } catch (RuntimeException e11) {
                    e = e11;
                    uVar.n(e);
                    return;
                } catch (ExecutionException e12) {
                    e = e12;
                    Throwable cause = e.getCause();
                    if (cause != null) {
                        e = cause;
                    }
                    uVar.n(e);
                    return;
                }
            case 8:
                DiscoveryDialogActivity.a aVar3 = ((V) this.f1866b).f21888b;
                int i12 = DiscoveryDialogActivity.f21724k0;
                DiscoveryDialogActivity.this.V((ImageView) this.f1867c, (y1) this.f1868p, null);
                return;
            case 9:
                SpineHistoryDataDao spineHistoryDataDao = ((SpineHealthRepositoryServerImpl) this.f1866b).f22682C;
                if (spineHistoryDataDao != null) {
                    List list = (List) this.f1867c;
                    ArrayList arrayList = new ArrayList(He.n.j(list));
                    Iterator it2 = list.iterator();
                    while (it2.hasNext()) {
                        S s3 = new S((SpineHistoryDataInfo) it2.next());
                        DeviceInfo deviceInfo = (DeviceInfo) this.f1868p;
                        s3.setMacAddress(com.oplus.melody.model.db.q.b(deviceInfo.getDeviceAddress()));
                        s3.setProductId(String.valueOf(deviceInfo.getProductId()));
                        s3.setProductName(com.oplus.melody.model.db.q.b(deviceInfo.getDeviceName()));
                        if (y.l()) {
                            String deviceName = deviceInfo.getDeviceName();
                            int utc = s3.getUtc();
                            String strI = E.i(((long) s3.getUtc()) * 1000, "yyyy-MM-dd HH:mm:ss");
                            int normalTimes = s3.getNormalTimes();
                            int mildTimes = s3.getMildTimes();
                            int badTimes = s3.getBadTimes();
                            StringBuilder sbL = p.l(utc, "onSpineHistoryDataChanged, name: ", deviceName, "\nutcTime=", ", utc=");
                            sbL.append(strI);
                            sbL.append("\ngood=");
                            sbL.append(normalTimes);
                            sbL.append("s, mild=");
                            sbL.append(mildTimes);
                            sbL.append("s, bad=");
                            sbL.append(badTimes);
                            sbL.append("s");
                            y.f("SpineHealthRepository", sbL.toString());
                        }
                        arrayList.add(s3);
                    }
                    spineHistoryDataDao.b(arrayList);
                    return;
                }
                return;
            case 10:
                final HeyDialogueTranslationFragment heyDialogueTranslationFragment = (HeyDialogueTranslationFragment) this.f1866b;
                if (!heyDialogueTranslationFragment.isAdded() || heyDialogueTranslationFragment.getView() == null) {
                    return;
                }
                U2.d dVar = new U2.d((Context) this.f1867c, 0);
                dVar.p(true);
                dVar.o(heyDialogueTranslationFragment.getString(R.string.melody_hey_translation_auto_play_guide_message));
                dVar.f5936G = new U2.d.g() { // from class: com.oplus.melody.heytranslation.component.dialogue.r
                    @Override // U2.d.g
                    public final void b() {
                        heyDialogueTranslationFragment.f23401R = null;
                    }
                };
                heyDialogueTranslationFragment.f23401R = dVar;
                dVar.r((MelodyCompatImageView) this.f1868p);
                Context context = heyDialogueTranslationFragment.getContext();
                if (context == null || (applicationContext = context.getApplicationContext()) == null) {
                    return;
                }
                com.oplus.melody.common.util.m.e(applicationContext, "hey_translation_auto_play_bubble_guide_shown", Boolean.TRUE);
                return;
            case 11:
                View viewFindViewById = ((View) this.f1866b).findViewById(R.id.model_view);
                if (viewFindViewById != null) {
                    ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) viewFindViewById.getLayoutParams();
                    View view = (View) this.f1867c;
                    ViewGroup.MarginLayoutParams marginLayoutParams2 = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
                    NestedScrollView nestedScrollView = (NestedScrollView) this.f1868p;
                    y.c("DetailMainFragment", new N(nestedScrollView, viewFindViewById, marginLayoutParams, marginLayoutParams2, 1));
                    view.setMinimumHeight((((nestedScrollView.getHeight() - viewFindViewById.getHeight()) - marginLayoutParams.topMargin) - marginLayoutParams2.topMargin) + 10);
                    return;
                }
                return;
            case 12:
                AudioTrack audioTrack = (AudioTrack) this.f1866b;
                Handler handler = (Handler) this.f1867c;
                b0.n nVar = (b0.n) this.f1868p;
                try {
                    audioTrack.flush();
                    audioTrack.release();
                    if (handler.getLooper().getThread().isAlive()) {
                        handler.post(new androidx.window.area.b(nVar, i10));
                    }
                    synchronized (androidx.media3.exoplayer.audio.b.f10647s) {
                        try {
                            int i13 = androidx.media3.exoplayer.audio.b.f10649u - 1;
                            androidx.media3.exoplayer.audio.b.f10649u = i13;
                            if (i13 == 0) {
                                ScheduledExecutorService scheduledExecutorService = androidx.media3.exoplayer.audio.b.f10648t;
                                scheduledExecutorService.getClass();
                                scheduledExecutorService.shutdown();
                                androidx.media3.exoplayer.audio.b.f10648t = null;
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                        break;
                    }
                    return;
                } catch (Throwable th3) {
                    if (handler.getLooper().getThread().isAlive()) {
                        handler.post(new androidx.window.area.b(nVar, i10));
                    }
                    synchronized (androidx.media3.exoplayer.audio.b.f10647s) {
                        try {
                            int i14 = androidx.media3.exoplayer.audio.b.f10649u - 1;
                            androidx.media3.exoplayer.audio.b.f10649u = i14;
                            if (i14 == 0) {
                                ScheduledExecutorService scheduledExecutorService2 = androidx.media3.exoplayer.audio.b.f10648t;
                                scheduledExecutorService2.getClass();
                                scheduledExecutorService2.shutdown();
                                androidx.media3.exoplayer.audio.b.f10648t = null;
                            }
                            throw th3;
                        } catch (Throwable th4) {
                            throw th4;
                        }
                    }
                }
            default:
                retrofit2.i.a aVar4 = ((retrofit2.i.a.C0320a) this.f1866b).f32367b;
                boolean zF = aVar4.f32365b.f();
                retrofit2.e eVar = (retrofit2.e) this.f1867c;
                if (zF) {
                    eVar.d(aVar4, new IOException("Canceled"));
                    return;
                } else {
                    eVar.e(aVar4, (x) this.f1868p);
                    return;
                }
        }
    }
