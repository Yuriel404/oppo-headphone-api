    @Override // com.coui.appcompat.panel.COUIBottomSheetDialog, com.google.android.material.bottomsheet.a, androidx.appcompat.app.p, b.l, android.app.Dialog
    public final void onCreate(Bundle bundle) {
        View view = this.f344p;
        setContentView(view);
        super.onCreate(bundle);
        boolean z10 = false;
        getBehavior().setDraggable(false);
        getDragableLinearLayout().getDragView().setVisibility(8);
        int[] iArr = this.f350v;
        this.f342b = new E0[iArr.length];
        FrequencyView frequencyView = (FrequencyView) findViewById(R.id.view_frequency);
        this.f343c = frequencyView;
        frequencyView.setFrequencyNum(iArr.length);
        TextView textView = (TextView) findViewById(R.id.tv_max_value);
        int i10 = this.f348t;
        Object[] objArr = {String.valueOf(i10)};
        androidx.fragment.app.f fVar = this.f341a;
        textView.setText(fVar.getString(R.string.melody_ui_custom_eq_positive_db, objArr));
        TextView textView2 = (TextView) findViewById(R.id.tv_mid_value);
        int i11 = this.f349u;
        textView2.setText(fVar.getString(R.string.melody_ui_custom_eq_db, String.valueOf((i10 + i11) / 2)));
        ((TextView) findViewById(R.id.tv_min_value)).setText(fVar.getString(R.string.melody_ui_custom_eq_db, String.valueOf(i11)));
        this.f345q = (LinearLayout) findViewById(R.id.container_seekbars);
        LinearLayout linearLayout = (LinearLayout) findViewById(R.id.container_seekbars_mark);
        LinearLayout linearLayout2 = (LinearLayout) findViewById(R.id.container_seekbars_describe);
        this.f347s = i10 - i11;
        int i12 = 0;
        while (i12 < iArr.length) {
            E0 e3 = new E0(getContext(), null, R.attr.couiSectionSeekBarStyle);
            e3.f194a = 3;
            e3.f199r = z10;
            e3.f201t = -1;
            e3.f203v = -1.0f;
            AnimatorSet animatorSet = new AnimatorSet();
            e3.f183C = animatorSet;
            e3.f189J = z10;
            e3.f190K = z10;
            i2.a.d(e3, z10);
            int dimensionPixelOffset = e3.getResources().getDimensionPixelOffset(R.dimen.melody_ui_custom_eq_touch_thumb_radius);
            e3.f184D = dimensionPixelOffset;
            e3.f192M = e3.getResources().getDimensionPixelOffset(R.dimen.coui_seekbar_view_max_width);
            e3.f195b = ViewConfiguration.get(e3.getContext()).getScaledTouchSlop();
            E0.e eVar = e3.new e(e3);
            androidx.core.view.M.q(e3, eVar);
            e3.setImportantForAccessibility(1);
            eVar.h();
            animatorSet.setInterpolator(new PathInterpolator(0.3f, 0.0f, 0.1f, 1.0f));
            ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(0, dimensionPixelOffset);
            valueAnimatorOfInt.setDuration(202L);
            valueAnimatorOfInt.addUpdateListener(new D0(e3));
            animatorSet.play(valueAnimatorOfInt);
            e3.setIdentity(i12);
            e3.setNumber(this.f347s);
            int[] iArr2 = this.f353y;
            if (iArr2 == null) {
                e3.setThumbIndex(this.f347s / 2);
            } else if (i12 < iArr2.length) {
                e3.setThumbIndex(i10 - iArr2[i12]);
                this.f343c.f25477A[i12] = iArr2[i12];
            }
            e3.setOnSectionSeekBarChangeListener(this);
            e3.setLayoutParams(new LinearLayout.LayoutParams(0, -1, 1.0f));
            this.f345q.addView(e3);
            this.f342b[i12] = e3;
            TextView textView3 = (TextView) LayoutInflater.from(fVar).inflate(R.layout.melody_ui_custom_eq_seekbar_mark, (ViewGroup) null);
            textView3.setLayoutParams(new LinearLayout.LayoutParams(0, -2, 1.0f));
            int i13 = iArr[i12];
            textView3.setText(i13 < 1000 ? String.valueOf(i13) : fVar.getString(R.string.melody_ui_custom_eq_frequency, String.valueOf(i13 / 1000)));
            linearLayout.addView(textView3);
            TextView textView4 = (TextView) LayoutInflater.from(fVar).inflate(R.layout.melody_ui_custom_eq_seekbar_describe, (ViewGroup) null);
            textView4.setLayoutParams(new LinearLayout.LayoutParams(0, -2, 1.0f));
            if (i12 == 0) {
                textView4.setText(getContext().getString(R.string.melody_ui_hearing_enhancement_low_frequency));
            } else if (i12 == iArr.length - 1) {
                textView4.setText(getContext().getString(R.string.melody_ui_hearing_enhancement_high_frequency));
            }
            linearLayout2.addView(textView4);
            i12++;
            z10 = false;
        }
        int[] iArr3 = new int[this.f342b.length];
        int i14 = 0;
        while (true) {
            E0[] e0Arr = this.f342b;
            if (i14 >= e0Arr.length) {
                break;
            }
            iArr3[i14] = i10 - e0Arr[i14].getThumbIndex();
            i14++;
        }
        String str = this.f352x;
        e eVar2 = this.f346r;
        if (eVar2 != null) {
            eVar2.a(str, iArr3);
        }
        COUIToolbar cOUIToolbar = (COUIToolbar) view.findViewById(R.id.dialog_toolbar);
        cOUIToolbar.setVisibility(0);
        cOUIToolbar.setIsTitleCenterStyle(true);
        cOUIToolbar.setTitle(str);
        cOUIToolbar.inflateMenu(R.menu.melody_ui_custom_eq_adjust_dialog_menu);
        cOUIToolbar.getMenu().findItem(R.id.custom_eq_adjust_cancel).setOnMenuItemClickListener(new b(this, 0));
        cOUIToolbar.getMenu().findItem(R.id.custom_eq_adjust_confirm).setOnMenuItemClickListener(new c(this, 0));
    }
