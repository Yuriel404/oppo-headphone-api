    public static void v(Z z10, CustomEqPreference customEqPreference) {
        if (customEqPreference.isChecked()) {
            return;
        }
        customEqPreference.setChecked(true);
        for (int i10 = 0; i10 < z10.f263D.f12886c.size(); i10++) {
            Preference preferenceH = z10.f263D.h(i10);
            if (customEqPreference != preferenceH) {
                ((CheckBoxPreference) preferenceH).setChecked(false);
            }
        }
        for (int i11 = 0; i11 < z10.f264E.f12886c.size(); i11++) {
            Preference preferenceH2 = z10.f264E.h(i11);
            if ((preferenceH2 instanceof CheckBoxPreference) && customEqPreference != preferenceH2) {
                ((CheckBoxPreference) preferenceH2).setChecked(false);
            }
        }
        ta.b bVar = customEqPreference.f25469s;
        if (bVar != null) {
            z10.f292h0 = bVar.getEqId();
            ta.c.e().i(2, z10.f278T, bVar);
        }
    }
