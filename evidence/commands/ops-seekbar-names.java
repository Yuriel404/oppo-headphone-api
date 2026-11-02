    public final void i() {
        y.b("NoiseReductionButtonSeekBarView", "updateActionView...");
        ArrayList arrayList = new ArrayList();
        Context context = getContext();
        Drawable drawableT = Wa.a.t(getContext(), R.drawable.melody_ui_reduction_noise_strong);
        String string = getContext().getString(R.string.melody_ui_noise_reduction_open_choose);
        int i10 = this.f25675x;
        arrayList.add(f(context, 0, drawableT, string, i10 == 4 || i10 == 8 || i10 == 16));
        arrayList.add(f(getContext(), 1, Wa.a.t(getContext(), R.drawable.melody_ui_reduction_noise_close), getContext().getString(R.string.melody_ui_noise_reduction_action_close_reduction), this.f25675x == 1));
        arrayList.add(f(getContext(), 2, Wa.a.t(getContext(), R.drawable.melody_ui_reduction_noise_transparent), getContext().getString(R.string.melody_ui_noise_reduction_action_pass_through_reduction), this.f25675x == 2));
        this.f25667p.b(arrayList);
    }
