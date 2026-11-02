    /* JADX WARN: Multi-variable type inference failed */
    public final void y(Preference preference, String str) {
        int i10;
        b.a aVar;
        d dVar = (d) preference;
        b.a aVar2 = (b.a) dVar.getTag();
        if (aVar2 == null) {
            y.b("BaseEarControlFragment", "sendKeyFunctionInfo control is null");
            return;
        }
        int i11 = 2;
        int iW = aVar2.getShowEar() == 1 ? 2 : w();
        if (iW == 0) {
            i11 = 1;
        } else if (iW != 1) {
            i11 = iW != 2 ? 255 : 4;
        }
        int iC = db.a.c(getContext(), str, this.f24836c0);
        int action = aVar2.getAction();
        Pattern pattern = com.oplus.melody.model.repository.earphone.Q.f24312a;
        int action2 = 0;
        switch (action) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 22:
            case 23:
            case 25:
            case 26:
            case 27:
                i10 = 1;
                break;
            case 21:
            case 24:
            default:
                i10 = 0;
                break;
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
            case 36:
            case 37:
                i10 = 6;
                break;
        }
        KeyFunctionInfoDTO keyFunctionInfoDTO = new KeyFunctionInfoDTO(i10 != 6 ? i11 : 4, i10, com.oplus.melody.model.repository.earphone.Q.d(aVar2.getAction()), iC);
        ArrayList arrayList = new ArrayList(1);
        arrayList.add(keyFunctionInfoDTO);
        y.c("BaseEarControlFragment", new h(keyFunctionInfoDTO, 17));
        EarControlViewModel earControlViewModel = this.f24850w;
        Context context = getContext();
        String str2 = this.f24835b0;
        earControlViewModel.getClass();
        com.oplus.melody.model.repository.earphone.b.G().x0(str2, context, arrayList, 1025);
        Context context2 = getContext();
        String str3 = this.f24836c0;
        int iA = (context2 == null || TextUtils.isEmpty(str)) ? -1 : db.a.a(db.a.c(context2, str, str3), str3);
        String str4 = this.f24834a0;
        String str5 = this.f24835b0;
        String strX = com.oplus.melody.model.repository.earphone.Q.x(this.f24850w.f(str5));
        int iW2 = w() + 1;
        if ((preference instanceof d) && (aVar = (b.a) dVar.getTag()) != null) {
            action2 = aVar.getAction();
        }
        B.k(str4, str5, iW2, action2, strX, Integer.toString(iA));
    }
