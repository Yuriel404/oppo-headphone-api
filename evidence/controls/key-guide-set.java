/* JADX INFO: compiled from: ControlGuideFragment.kt */
/* JADX INFO: loaded from: classes3.dex */
@Metadata(k = 3, mv = {2, 3, 0}, xi = 48)
final /* synthetic */ class ControlGuideFragment$initView$3 extends FunctionReferenceImpl implements l<c, Ge.l> {
    @Override // Te.l
    public final Ge.l invoke(c cVar) {
        KeyFunctionInfoDTO keyFunctionInfoDTO;
        c cVar2 = cVar;
        ControlGuideFragment controlGuideFragment = (ControlGuideFragment) this.receiver;
        controlGuideFragment.getClass();
        controlGuideFragment.f24870L = (cVar2 != null ? cVar2.getPairDeviceGuide() : null) != null;
        if ((cVar2 != null ? cVar2.getControlPages() : null) != null) {
            controlGuideFragment.f24877u = cVar2;
            List<n> controlPages = cVar2.getControlPages();
            i.e(controlPages, "getControlPages(...)");
            List<n> list = controlPages;
            ArrayList arrayList = new ArrayList(He.n.j(list));
            for (n nVar : list) {
                g animation = nVar.getAnimation();
                i.e(animation, "getAnimation(...)");
                String title = nVar.getTitle();
                i.e(title, "getTitle(...)");
                String title2 = nVar.getTitle();
                i.e(title2, "getTitle(...)");
                String intro = nVar.getIntro();
                i.e(intro, "getIntro(...)");
                String guideHint = nVar.getGuideHint();
                i.e(guideHint, "getGuideHint(...)");
                arrayList.add(new w(animation, title, title2, intro, guideHint));
            }
            ControlGuideFragment.a aVar = controlGuideFragment.f24874r;
            if (aVar == null) {
                i.j("mPageAdapter");
                throw null;
            }
            String rootPath = cVar2.getRootPath();
            i.e(rootPath, "getRootPath(...)");
            aVar.f6623a = arrayList;
            aVar.f24883b = rootPath;
            aVar.notifyDataSetChanged();
            bb.c cVar3 = controlGuideFragment.f24879w;
            if (cVar3 == null) {
                i.j("mGuidePageStatus");
                throw null;
            }
            cVar3.f14538j = cVar2;
            int i10 = cVar3.f14530a.f24894j;
            Integer numDecode = Integer.decode(cVar2.getControlPages().get(i10).getAction());
            i.e(numDecode, "decode(...)");
            cVar3.f14532c = numDecode.intValue();
            c cVar4 = cVar3.f14538j;
            if (cVar4 == null) {
                i.j("mGuideVO");
                throw null;
            }
            Integer numDecode2 = Integer.decode(cVar4.getControlPages().get(i10).getEarType());
            i.e(numDecode2, "decode(...)");
            cVar3.f14533d = numDecode2.intValue();
            c cVar5 = cVar3.f14538j;
            if (cVar5 == null) {
                i.j("mGuideVO");
                throw null;
            }
            cVar3.f14534e = cVar5.getControlPages().get(i10).getGuideStepCode();
            c cVar6 = cVar3.f14538j;
            if (cVar6 == null) {
                i.j("mGuideVO");
                throw null;
            }
            cVar3.f14535f = cVar6.getControlPages().get(i10).getButton();
            c cVar7 = cVar3.f14538j;
            if (cVar7 == null) {
                i.j("mGuideVO");
                throw null;
            }
            cVar3.f14536g = cVar7.getControlPages().size();
            cVar3.f14531b.post(new o(cVar3, i10, 6));
            List<n> controlPages2 = cVar2.getControlPages();
            i.e(controlPages2, "getControlPages(...)");
            List<n> list2 = controlPages2;
            ArrayList arrayList2 = new ArrayList(He.n.j(list2));
            for (n nVar2 : list2) {
                Integer numDecode3 = Integer.decode(nVar2.getFunction());
                if (numDecode3 != null && numDecode3.intValue() == -1) {
                    keyFunctionInfoDTO = null;
                } else {
                    Integer numDecode4 = Integer.decode(nVar2.getEarType());
                    i.e(numDecode4, "decode(...)");
                    int iIntValue = numDecode4.intValue();
                    int button = nVar2.getButton();
                    Integer numDecode5 = Integer.decode(nVar2.getAction());
                    i.e(numDecode5, "decode(...)");
                    int iIntValue2 = numDecode5.intValue();
                    i.c(numDecode3);
                    keyFunctionInfoDTO = new KeyFunctionInfoDTO(iIntValue, button, iIntValue2, numDecode3.intValue());
                }
                arrayList2.add(keyFunctionInfoDTO);
            }
            if (controlGuideFragment.f24876t == null) {
                i.j("mControlGuideVM");
                throw null;
            }
            f fVar = controlGuideFragment.f24872p;
            i.c(fVar);
            com.oplus.melody.model.repository.earphone.b.G().x0(controlGuideFragment.f24861B, fVar, arrayList2, 1046);
        }
        return Ge.l.f2444a;
    }
