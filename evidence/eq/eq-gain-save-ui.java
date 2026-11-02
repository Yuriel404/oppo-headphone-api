    /* JADX WARN: Code duplicated, block: B:68:0x0170  */
    /* JADX WARN: Code duplicated, block: B:69:0x017c  */
    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        COUIEditText cOUIEditText;
        int i10;
        int[] iArr;
        WhitelistConfigDTO.Function function;
        final ta.b bVar = null;
        Object obj = this.f375c;
        Object obj2 = this.f376p;
        Object obj3 = this.f374b;
        boolean z10 = true;
        switch (this.f373a) {
            case 0:
                final Z z11 = (Z) obj3;
                COUIEditText cOUIEditText2 = (COUIEditText) obj;
                Editable text = cOUIEditText2 != null ? cOUIEditText2.getText() : null;
                String string = text != null ? text.toString() : "";
                androidx.fragment.app.f fVarC = z11.C("parseImportedEqFromShareCode");
                if (fVarC == null) {
                    cOUIEditText = cOUIEditText2;
                } else {
                    int length = z11.f305u0.length;
                    BigInteger bigInteger = B0.f168a;
                    if (string == null || bf.n.g0(string) || length <= 0) {
                        cOUIEditText = cOUIEditText2;
                        i10 = -6;
                    } else {
                        StringBuilder sb2 = new StringBuilder(string.length());
                        int length2 = string.length();
                        int i11 = 0;
                        while (true) {
                            if (i11 < length2) {
                                char cCharAt = string.charAt(i11);
                                if (!Wa.a.G(cCharAt)) {
                                    Character chB = B0.b(cCharAt);
                                    if (chB != null) {
                                        sb2.append(chB.charValue());
                                    }
                                }
                                i11++;
                            } else {
                                String string2 = sb2.toString();
                                if (string2.length() == (length <= 0 ? 0 : B0.c(length) + 1)) {
                                    String strSubstring = string2.substring(0, string2.length() - 1);
                                    kotlin.jvm.internal.i.e(strSubstring, "substring(...)");
                                    char cS0 = bf.o.s0(string2);
                                    BigInteger bigIntegerAdd = BigInteger.ZERO;
                                    int length3 = strSubstring.length();
                                    int i12 = 0;
                                    while (true) {
                                        if (i12 < length3) {
                                            boolean z12 = z10;
                                            i10 = -6;
                                            int iD0 = bf.n.d0("0123456789ABCDEFGHJKMNPQRSTVWXYZ", strSubstring.charAt(i12), 0, 6);
                                            if (iD0 < 0) {
                                                cOUIEditText = cOUIEditText2;
                                            } else {
                                                bigIntegerAdd = bigIntegerAdd.multiply(B0.f168a).add(BigInteger.valueOf(iD0));
                                                i12++;
                                                z10 = z12;
                                                cOUIEditText2 = cOUIEditText2;
                                            }
                                        } else {
                                            cOUIEditText = cOUIEditText2;
                                            boolean z13 = z10;
                                            i10 = -6;
                                            if (cS0 == B0.a(strSubstring)) {
                                                BigInteger bigInteger2 = B0.f169b;
                                                if (bigIntegerAdd.compareTo(bigInteger2.pow(length)) < 0) {
                                                    iArr = new int[length];
                                                    for (int i13 = length - 1; -1 < i13; i13--) {
                                                        BigInteger[] bigIntegerArrDivideAndRemainder = bigIntegerAdd.divideAndRemainder(bigInteger2);
                                                        iArr[i13] = bigIntegerArrDivideAndRemainder[z13 ? 1 : 0].intValue() - 6;
                                                        bigIntegerAdd = bigIntegerArrDivideAndRemainder[0];
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            cOUIEditText = cOUIEditText2;
                            iArr = null;
                            i10 = -6;
                        }
                        if (iArr == null) {
                            X1.a.H(fVarC, fVarC.getString(R.string.melody_ui_eq_share_code_invalid));
                            bVar = null;
                        } else {
                            String strA = z11.A();
                            ta.b bVar2 = new ta.b();
                            bVar2.setName(strA);
                            bVar2.setNameLength(strA.getBytes(StandardCharsets.UTF_8).length);
                            bVar2.setMinValue(i10);
                            bVar2.setMaxValue(6);
                            int[] iArr2 = z11.f305u0;
                            bVar2.setFrequency(Arrays.copyOf(iArr2, iArr2.length));
                            bVar2.setDbValue(Arrays.copyOf(iArr, iArr.length));
                            bVar = bVar2;
                        }
                    }
                    iArr = null;
                    if (iArr == null) {
                        X1.a.H(fVarC, fVarC.getString(R.string.melody_ui_eq_share_code_invalid));
                        bVar = null;
                    } else {
                        String strA2 = z11.A();
                        ta.b bVar3 = new ta.b();
                        bVar3.setName(strA2);
                        bVar3.setNameLength(strA2.getBytes(StandardCharsets.UTF_8).length);
                        bVar3.setMinValue(i10);
                        bVar3.setMaxValue(6);
                        int[] iArr3 = z11.f305u0;
                        bVar3.setFrequency(Arrays.copyOf(iArr3, iArr3.length));
                        bVar3.setDbValue(Arrays.copyOf(iArr, iArr.length));
                        bVar = bVar3;
                    }
                }
                if (bVar != null) {
                    if (cOUIEditText != null) {
                        InputMethodManager inputMethodManager = (InputMethodManager) cOUIEditText.getContext().getSystemService("input_method");
                        if (inputMethodManager != null) {
                            inputMethodManager.hideSoftInputFromWindow(cOUIEditText.getWindowToken(), 0);
                        }
                        cOUIEditText.clearFocus();
                    }
                    androidx.appcompat.app.g gVar = (androidx.appcompat.app.g) obj2;
                    gVar.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: Ab.y
                        @Override // android.content.DialogInterface.OnDismissListener
                        public final void onDismiss(DialogInterface dialogInterface) {
                            Z z14 = z11;
                            androidx.fragment.app.f fVarC2 = z14.C("showImportEqPreviewDialog");
                            if (fVarC2 == null) {
                                return;
                            }
                            if (z14.E()) {
                                X1.a.H(fVarC2, fVarC2.getString(R.string.melody_ui_import_eq_limit));
                                return;
                            }
                            X8.b bVar4 = new X8.b(fVarC2, R.style.MelodyUiTheme_ShareCustomEq);
                            bVar4.i(R.string.melody_ui_common_cancel, new L(0));
                            bVar4.o(R.string.melody_ui_import_eq_confirm, null);
                            androidx.appcompat.app.g gVarShow = bVar4.show();
                            ta.b bVar5 = bVar;
                            z14.x(gVarShow, bVar5);
                            Button buttonD = gVarShow.d(-1);
                            if (buttonD != null) {
                                buttonD.setOnClickListener(new M(z14, bVar5, gVarShow, 0));
                            }
                        }
                    });
                    gVar.dismiss();
                    break;
                }
                break;
            case 1:
                GuideEntranceFragment.c cVar = (GuideEntranceFragment.c) obj3;
                if (cVar != null) {
                    cVar.a();
                }
                GuideEntranceFragment.a aVar = (GuideEntranceFragment.a) obj;
                Ma.x.E(aVar.getAddress(), true);
                X1.a.G((Context) obj2, R.string.melody_common_control_guide_exit_toast);
                Ra.B.d(aVar.getProductId(), 0, -1, aVar.getAddress());
                break;
            default:
                Intent intent = (Intent) obj3;
                intent.addFlags(SQLiteDatabase.CREATE_IF_NECESSARY);
                intent.addFlags(67108864);
                SpatialAudioContentFragment spatialAudioContentFragment = (SpatialAudioContentFragment) obj2;
                WhitelistConfigDTO whitelistConfigDTO = (WhitelistConfigDTO) obj;
                if (whitelistConfigDTO != null && (function = whitelistConfigDTO.getFunction()) != null && function.getSpatialVip() == 1) {
                    com.oplus.melody.common.util.y.b("SpatialAudioContentFragment", "add params");
                    intent.putExtra("deviceAddress", spatialAudioContentFragment.f25789E);
                    intent.putExtra("deviceName", spatialAudioContentFragment.f25790F);
                }
                androidx.fragment.app.f fVarRequireActivity = spatialAudioContentFragment.requireActivity();
                kotlin.jvm.internal.i.e(fVarRequireActivity, "requireActivity(...)");
                com.oplus.melody.common.util.j.j(fVarRequireActivity, intent, null);
                break;
        }
    }
