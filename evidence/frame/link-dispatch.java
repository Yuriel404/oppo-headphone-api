    public final synchronized void a(byte[] bArr) {
        J8.a aVarD = this.f4143e.d(bArr);
        if (aVarD == null) {
            Q8.a.f("TLVDataProcessor", "handleFrame: Parse response packet fail.");
            return;
        }
        if (aVarD.f3428c) {
            Q8.a.m("TLVDataProcessor", "handleFrame: isSliced=" + aVarD.f3428c + " isReceivedAll=" + aVarD.f3427b + " isSuccess=true");
            J8.a aVar = this.f4146i;
            if (aVar.f3429d != 0) {
                byte[] bArr2 = aVar.f3426a;
                byte[] bArr3 = new byte[bArr2.length + aVarD.f3426a.length];
                System.arraycopy(bArr2, 0, bArr3, 0, bArr2.length);
                byte[] bArr4 = aVarD.f3426a;
                System.arraycopy(bArr4, 0, bArr3, this.f4146i.f3426a.length, bArr4.length);
                this.f4146i.f3426a = bArr3;
            } else {
                aVar.f3426a = aVarD.f3426a;
            }
            J8.a aVar2 = this.f4146i;
            byte[] bArr5 = aVar2.f3426a;
            aVar2.f3429d = bArr5.length;
            boolean z10 = aVarD.f3427b;
            aVar2.f3427b = z10;
            if (z10) {
                b(bArr5);
                J8.a aVar3 = this.f4146i;
                aVar3.f3427b = false;
                aVar3.f3429d = 0;
                aVar3.f3426a = null;
                aVar3.f3428c = false;
            }
        } else {
            b(aVarD.f3426a);
        }
    }
