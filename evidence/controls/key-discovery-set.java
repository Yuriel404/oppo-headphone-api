    public final void r() {
        DiscoveryDialogViewModel discoveryDialogViewModel;
        DiscoveryDialogActivity discoveryDialogActivity = this.f21806b;
        COUISwitch cOUISwitch = this.f22006n;
        if (cOUISwitch != null && cOUISwitch.isChecked()) {
            A0 a0S = discoveryDialogActivity.S();
            String id2 = a0S != null ? a0S.getId() : null;
            if (TextUtils.isEmpty(id2)) {
                com.oplus.melody.common.util.y.y("DiscoveryViewStateFeaturePromoImpl", "sendTriplePinchTranslation skip empty address");
            } else {
                List listAsList = Arrays.asList(new KeyFunctionInfoDTO(1, 1, 3, 26), new KeyFunctionInfoDTO(2, 1, 3, 26));
                com.oplus.melody.common.util.y.c("DiscoveryViewStateFeaturePromoImpl", new C9.g(9));
                com.oplus.melody.model.repository.earphone.b.G().x0(id2, discoveryDialogActivity, listAsList, 1025);
            }
        }
        A0 a0S2 = discoveryDialogActivity.S();
        if (a0S2 == null) {
            return;
        }
        String id3 = a0S2.getId();
        int i10 = 6;
        if (!TextUtils.isEmpty(id3) && (discoveryDialogViewModel = discoveryDialogActivity.f21767y) != null) {
            discoveryDialogViewModel.f21784o = true;
            discoveryDialogViewModel.p(id3, new r0(i10, id3, 9));
        }
        discoveryDialogActivity.W(6, 1, a0S2.hashCode());
    }
