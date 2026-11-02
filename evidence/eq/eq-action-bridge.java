    @Override // ta.c
    public final void i(int i10, String str, b bVar) {
        y.c("EqRepository", new m(i10, str, bVar));
        HeyMelodyApplication heyMelodyApplication = com.oplus.melody.common.util.k.f22410a;
        EqInfo eqInfo = bVar.toEqInfo();
        Intent intentJ = Wa.a.j(heyMelodyApplication, 1018);
        intentJ.putExtra("param_address", str);
        intentJ.putExtra("param_eq_info", eqInfo);
        intentJ.putExtra("param_set_eq_action", i10);
        Wa.a.N(heyMelodyApplication, intentJ);
    }
