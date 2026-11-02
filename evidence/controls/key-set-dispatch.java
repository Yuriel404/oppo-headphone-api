    @Override // java.util.function.Supplier
    public final Object get() {
        switch (this.f2844a) {
            case 0:
                String strR = y.r(this.f2845b);
                String strQ = y.q((String) this.f2847d);
                String string = ((HeyMelodyApplication) this.f2848e).getString(this.f2846c);
                StringBuilder sbL = A0.l("showRemindNotification, addr=", strR, ", pid=", strQ, ", body=");
                sbL.append(string);
                return sbL.toString();
            default:
                List list = (List) ((List) this.f2847d).stream().filter(new q(5)).map(new l(15)).collect(Collectors.toList());
                Context context = this.f2848e;
                Intent intentJ = Wa.a.j(context, 1021);
                intentJ.putExtra("param_address", this.f2845b);
                intentJ.putExtra("param_protocol", this.f2846c);
                intentJ.putParcelableArrayListExtra("param_key_function_info", com.oplus.melody.common.util.e.b(list));
                Wa.a.N(context, intentJ);
                return new T(5L, TimeUnit.SECONDS);
        }
    }
