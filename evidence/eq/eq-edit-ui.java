    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        Object obj = this.f232p;
        Object obj2 = this.f231c;
        Object obj3 = this.f230b;
        switch (this.f229a) {
            case 0:
                Z z10 = (Z) obj3;
                if (z10.C("importEqPreview confirm") != null) {
                    if (z10.E()) {
                        androidx.fragment.app.f fVarC = z10.C("importEqInfo limit");
                        if (fVarC != null) {
                            X1.a.H(fVarC, fVarC.getString(R.string.melody_ui_import_eq_limit));
                        }
                    } else {
                        ta.c.e().i(1, z10.f278T, (ta.b) obj2);
                        if (z10.E()) {
                            z10.f265F.setVisible(false);
                            if (z10.f307w0 && z10.D() == 1) {
                                z10.f264E.m(z10.getString(R.string.melody_ui_import_eq));
                            }
                        }
                    }
                    ((androidx.appcompat.app.g) obj).dismiss();
                    break;
                }
                break;
            case 1:
                com.coui.appcompat.card.c.b this$0 = (com.coui.appcompat.card.c.b) obj3;
                kotlin.jvm.internal.i.f(this$0, "this$0");
                com.coui.appcompat.card.c cVar = (com.coui.appcompat.card.c) obj;
                int iIndexOf = this$0.f15585b.indexOf((com.coui.appcompat.card.c.a) obj2);
                if (iIndexOf != cVar.f15580c) {
                    cVar.f15580c = iIndexOf;
                }
                this$0.b(iIndexOf);
                break;
            case 2:
                Y0 y10 = (Y0) obj3;
                if (TextUtils.equals(y10.f21910F, y10.f21809e.getText())) {
                    com.oplus.melody.app.discovery.A0 a3 = (com.oplus.melody.app.discovery.A0) obj2;
                    String productId = a3.getProductId();
                    String id2 = a3.getId();
                    String softwareVersion = a3.getSoftwareVersion();
                    Ra.B.j(AppConstant$FunctionType.FIRMWARE_UPGRADE_GUIDE.getFunType(), productId, id2, softwareVersion, "4" + ((String) obj));
                    Wa.a.u().getClass();
                    Ge.b<List<Te.l<String, Class<?>>>> bVar = Xa.h.h;
                    Xa.h hVarA = Xa.h.a.a("/ui/firmware_upgrade");
                    hVarA.f("device_mac_info", a3.getId());
                    hVarA.f("product_id", a3.getProductId());
                    hVarA.f("device_name", a3.getName());
                    hVarA.f("product_color", String.valueOf(a3.getProductColorId()));
                    hVarA.f("auto_firmware_update", Boolean.toString(true));
                    DiscoveryDialogActivity discoveryDialogActivity = y10.f21806b;
                    hVarA.b(discoveryDialogActivity);
                    discoveryDialogActivity.R();
                    break;
                }
                break;
            case 3:
                com.heytap.headset.component.mydevicelist.a aVar = (com.heytap.headset.component.mydevicelist.a) obj3;
                f4.a aVar2 = (f4.a) obj2;
                if (!aVar.f20002f) {
                    com.heytap.headset.component.mydevicelist.a.c cVar2 = aVar.f20001e;
                    if (cVar2 != null) {
                        cVar2.a(aVar2);
                    }
                } else {
                    String address = aVar2.getAddress();
                    androidx.collection.b<String> bVar2 = aVar.f19999c;
                    com.heytap.headset.component.mydevicelist.a.b bVar3 = (com.heytap.headset.component.mydevicelist.a.b) obj;
                    if (He.r.t(bVar2, address)) {
                        kotlin.jvm.internal.m.a(bVar2).remove(aVar2.getAddress());
                        bVar3.f20008a.setState(0);
                    } else if (!TextUtils.isEmpty(aVar2.getAddress())) {
                        String address2 = aVar2.getAddress();
                        kotlin.jvm.internal.i.c(address2);
                        bVar2.add(address2);
                        bVar3.f20008a.setState(2);
                    }
                    bVar3.f20008a.c();
                }
                break;
            default:
                vb.j.a aVar3 = (vb.j.a) obj3;
                aVar3.f33531t.toggle();
                ((vb.j) obj2).f33522c.invoke((vb.n) obj, Boolean.valueOf(aVar3.f33531t.isChecked()));
                break;
        }
    }
