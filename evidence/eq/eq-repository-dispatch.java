    @Override // da.b, android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        Bundle data = message.getData();
        switch (message.what) {
            case 10001:
            case 10005:
                break;
            case 10002:
                f(data.getString("arg1"));
                break;
            case 10003:
                b bVar = (b) JsonUtils.c(b.class, data.getString("arg2"));
                if (bVar != null) {
                    i(data.getInt("arg3"), data.getString("arg1"), bVar);
                }
                break;
            case 10004:
                h(data.getString("arg1"));
                break;
            case 10006:
                p pVar = D.f6025c;
                D.i(message, (k) this.f32926q.computeIfAbsent(data.getString("arg1"), new com.oplus.melody.model.repository.earphone.d(29)));
                return true;
            case 10007:
                data.getString("arg1");
                p pVar2 = D.f6025c;
                D.i(message, this.f32925p);
                return true;
            case 10008:
                g(data.getString("arg1"));
                break;
            default:
                return false;
        }
        D.h(message, null);
        return true;
    }
