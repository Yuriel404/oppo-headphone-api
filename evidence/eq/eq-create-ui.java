        @Override // Ab.e
        public final void a(String str, int[] iArr) {
            Z z10 = Z.this;
            if (z10.f264E.f12886c.size() < z10.f294j0 + 1) {
                ta.b bVar = new ta.b();
                bVar.setName(str);
                bVar.setNameLength(str.getBytes(StandardCharsets.UTF_8).length);
                bVar.setMaxValue(6);
                bVar.setMinValue(-6);
                bVar.setFrequency(z10.f305u0);
                bVar.setDbValue(iArr);
                ta.c.e().i(1, z10.f278T, bVar);
            }
            if (z10.f264E.f12886c.size() >= z10.f294j0 + 1) {
                z10.f265F.setVisible(false);
                if (z10.f307w0 && z10.D() == 1) {
                    z10.f264E.m(z10.getString(R.string.melody_ui_import_eq));
                }
            }
        }
