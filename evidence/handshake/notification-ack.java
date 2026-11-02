    public final void d(int i10, int i11, byte[] bArr, String str, w8.a aVar) {
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(bArr != null ? 2 + bArr.length : 2);
        byteBufferAllocate.put((byte) i10);
        byteBufferAllocate.put((byte) i11);
        if (bArr != null) {
            byteBufferAllocate.put(bArr);
        }
        Q8.a.c("NotificationCommandManager", new F8.e(i10, i11, bArr));
        byte[] bArrArray = byteBufferAllocate.array();
        this.f22225c.getClass();
        this.f22224b.z0(str, w8.b.b(aVar, bArrArray));
    }
