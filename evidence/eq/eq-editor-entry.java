    public final void y(Preference preference) {
        for (int i10 = 0; i10 < this.f263D.f12886c.size(); i10++) {
            Preference preferenceH = this.f263D.h(i10);
            if (preference != preferenceH) {
                ((CheckBoxPreference) preferenceH).setChecked(false);
            }
        }
        for (int i11 = 0; i11 < this.f264E.f12886c.size(); i11++) {
            Preference preferenceH2 = this.f264E.h(i11);
            if ((preferenceH2 instanceof CheckBoxPreference) && preference != preferenceH2) {
                ((CheckBoxPreference) preferenceH2).setChecked(false);
            }
        }
        if (preference.getParent() == this.f264E) {
            ta.b bVar = ((CustomEqPreference) preference).f25469s;
            if (bVar != null) {
                this.f292h0 = bVar.getEqId();
                ta.c.e().i(2, this.f278T, bVar);
                COUIBottomSheetDialog cOUIBottomSheetDialog = this.f274P;
                if ((cOUIBottomSheetDialog == null || !cOUIBottomSheetDialog.isShowing()) && getActivity() != null) {
                    this.f287c0 = bVar;
                    int i12 = this.f306v0;
                    j jVar = this.f260B0;
                    if (i12 == 2) {
                        this.f274P = new Bb.c(getActivity(), this.f287c0.getName(), this.f305u0, this.f287c0.getDbValue(), jVar);
                    } else {
                        this.f274P = new Ab.d(getActivity(), this.f287c0.getName(), this.f305u0, this.f287c0.getDbValue(), jVar);
                    }
                    this.f274P.show();
                    this.f302r0 = true;
                    this.f274P.setOnDismissListener(new n(this, 0));
                    return;
                }
                return;
            }
            return;
        }
        if (preference.getParent() == this.f263D) {
            if (this.f304t0 != null) {
                com.oplus.melody.common.util.y.b("CustomEqFragment", "before click recommend eq immediately set bass");
                U8.Q.c.f6061a.removeCallbacks(this.f304t0);
                this.f304t0.run();
            }
            if (this.f282X != null) {
                int iC = h0.c(getActivity(), preference.getTitle().toString(), this.f279U, this.f282X);
                int iE = h0.e(iC, this.f282X);
                com.oplus.melody.common.util.y.c("CustomEqFragment", new Y(this, iE, 0));
                if (iE == this.f283Y) {
                    return;
                }
                this.f292h0 = iC;
                CompletableFuture<SetCommandStateDTO> completableFuture = this.f291g0;
                if (completableFuture != null) {
                    completableFuture.cancel(true);
                }
                this.f291g0 = com.oplus.melody.model.repository.earphone.b.G().n0(iC, this.f278T);
            }
        }
    }
