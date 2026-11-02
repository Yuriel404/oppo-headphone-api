    public final List<byte[]> e(byte[] bArr) {
        int i10 = 0;
        int length = bArr.length;
        y.a aVar = Q8.a.f5077a;
        if (y.l()) {
            StringBuilder sb2 = new StringBuilder("Enter spliceMTUPackage, leftDataLen = ");
            sb2.append(this.f4503c);
            sb2.append(", totalDataLen = ");
            sb2.append(this.f4504p);
            sb2.append(", dataContentBytes.length = ");
            byte[] bArr2 = this.f4502b;
            sb2.append(bArr2 != null ? Integer.valueOf(bArr2.length) : "null");
            sb2.append(", dataLen = ");
            sb2.append(length);
            sb2.append(" data=");
            sb2.append(Wa.a.g(bArr));
            Q8.a.a("OPOv1Wrapper", sb2.toString());
        }
        if (-86 != bArr[0] || this.f4504p != 0) {
            Q8.a.c("OPOv1Wrapper", new c(this, 18));
            if (length != this.f4503c && -86 == bArr[0]) {
                Q8.a.m("OPOv1Wrapper", "spliceMTUPackage pre mtu data content invalid, drop it. data=" + Wa.a.g(this.f4502b));
                this.f4504p = 0;
                this.f4503c = 0;
                this.f4502b = null;
                return e(bArr);
            }
            byte[] bArr3 = this.f4502b;
            if (bArr3 != null) {
                byte[] bArr4 = new byte[bArr3.length + bArr.length];
                System.arraycopy(bArr3, 0, bArr4, 0, bArr3.length);
                System.arraycopy(bArr, 0, bArr4, bArr3.length, bArr.length);
                this.f4502b = bArr4;
            }
            int i11 = this.f4503c;
            if (length >= i11) {
                if (length == i11) {
                    Q8.a.a("OPOv1Wrapper", "spliceMTUPackage data content len equal mLeftDataLen.");
                    this.f4504p = 0;
                    this.f4503c = 0;
                    byte[] bArr5 = this.f4502b;
                    if (bArr5 != null) {
                        this.f4505q.add(bArr5);
                    }
                    return c();
                }
                Q8.a.a("OPOv1Wrapper", "spliceMTUPackage data content len more than mLeftDataLen.");
                byte[] bArr6 = this.f4502b;
                if (bArr6 != null) {
                    this.f4505q.add(Arrays.copyOf(bArr6, this.f4504p));
                    byte[] bArr7 = this.f4502b;
                    byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr7, this.f4504p, bArr7.length);
                    this.f4504p = 0;
                    this.f4503c = 0;
                    if (-86 == bArrCopyOfRange[0]) {
                        return e(bArrCopyOfRange);
                    }
                }
                return c();
            }
            Q8.a.a("OPOv1Wrapper", "spliceMTUPackage data content len less than mLeftDataLen.");
            this.f4503c -= length;
        } else {
            if (length < 9) {
                Q8.a.m("OPOv1Wrapper", "spliceMTUPackage strDataContentHex length is invalid with data = " + Wa.a.g(bArr));
                return c();
            }
            int iB = b(bArr);
            int i12 = iB + 1 + (iB > 127 ? 2 : 1);
            if (i12 == bArr.length) {
                this.f4505q.add(bArr);
                return c();
            }
            if (i12 < bArr.length) {
                Q8.a.c("OPOv1Wrapper", new a(i12, i10, bArr));
                this.f4505q.add(Arrays.copyOf(bArr, i12));
                byte[] bArrCopyOfRange2 = Arrays.copyOfRange(bArr, i12, bArr.length);
                this.f4504p = 0;
                this.f4503c = 0;
                return -86 == bArrCopyOfRange2[0] ? e(bArrCopyOfRange2) : c();
            }
            StringBuilder sbJ = A0.j(i12, length, "spliceMTUPackage frame incomplete, frameLength > dataContent, frameLength= ", ", dataLen = ", ", data=");
            sbJ.append(Wa.a.g(bArr));
            Q8.a.m("OPOv1Wrapper", sbJ.toString());
            this.f4502b = bArr;
            this.f4504p = i12;
            this.f4503c = i12 - bArr.length;
        }
        return c();
    }
