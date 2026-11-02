    /* JADX WARN: Code duplicated, block: B:38:0x00fd  */
    /* JADX WARN: Code duplicated, block: B:43:0x011b A[Catch: all -> 0x0120, TryCatch #0 {all -> 0x0120, blocks: (B:41:0x0115, B:43:0x011b, B:46:0x0122, B:47:0x0127), top: B:62:0x0115 }] */
    /* JADX WARN: Code duplicated, block: B:62:0x0115 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:66:0x012b A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Instruction removed from duplicated block: B:38:0x00fd, please report this as an issue */
    public final void e(a aVar) {
        Q8.a.a(this.f2632c, "handleReadDataInit");
        try {
            this.f2644p = this.f2639k.getInputStream();
            Q8.a.a(this.f2632c, "handleReadDataInit after getInputStream");
            Q8.a.a(this.f2632c, "startReadLoop");
            this.f2642n = false;
            byte[] bArr = new byte[990];
            while (true) {
                InputStream inputStream = this.f2644p;
                if (inputStream == null) {
                    break;
                }
                try {
                    int i10 = inputStream.read(bArr, 0, 3);
                    if (i10 == 3 && -86 == bArr[0]) {
                        int i11 = 0;
                        int i12 = 0;
                        while (i11 < 2) {
                            int i13 = i11 + 1;
                            byte b10 = bArr[i13];
                            i12 += (b10 & 127) << (i11 * 7);
                            if ((b10 & 128) == 0) {
                                i12 -= 1 - i11;
                                break;
                            }
                            i11 = i13;
                        }
                        int i14 = i12 > 0 ? this.f2644p.read(bArr, 3, i12) : 0;
                        byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr, 0, i14 + 3);
                        if (y.l()) {
                            int iMin = Math.min(48, bArrCopyOfRange.length);
                            String str = this.f2632c;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("receiveData: dataLen=");
                            sb2.append(bArrCopyOfRange.length);
                            sb2.append(" remainLen=");
                            sb2.append(i12);
                            sb2.append(", read=");
                            sb2.append(i14);
                            sb2.append(", data: ");
                            sb2.append(Wa.a.f(iMin, bArrCopyOfRange));
                            sb2.append(iMin < bArrCopyOfRange.length ? "…" : "");
                            Q8.a.a(str, sb2.toString());
                        }
                        HandlerC0028a handlerC0028a = this.f2654z;
                        Message messageObtainMessage = handlerC0028a.obtainMessage();
                        messageObtainMessage.what = 1;
                        messageObtainMessage.obj = bArrCopyOfRange;
                        handlerC0028a.sendMessage(messageObtainMessage);
                    } else {
                        Q8.a.f(this.f2632c, "receiveData: sofLenBuf error, read: " + i10 + ", sofLenBuf: " + Wa.a.f(3, bArr));
                    }
                } catch (Throwable th) {
                    Q8.a.h(this.f2632c, "startReadLoop", th);
                }
                Q8.a.a(this.f2632c, "startReadLoop exit, set mIsReadLoopExit true");
                if (y.l()) {
                    Q8.a.e(this.f2632c, "handleReadLoopStop, device=" + this.h);
                }
                synchronized (this.f2631b) {
                    try {
                        if (this.f2636g == EnumCloseType.f22316c) {
                            k(4);
                        }
                        j();
                        this.f2642n = true;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                synchronized (this.f2631b) {
                    InputStream inputStream2 = this.f2644p;
                    this.f2644p = null;
                }
                o.b(inputStream2);
                b();
                Q8.a.a(this.f2632c, "closeInputStreamAndSocket, close the InputStream and close the mSocket ok");
                g(aVar);
            }
            Q8.a.f(this.f2632c, "startReadLoop, mInputStream is null, break");
            Q8.a.a(this.f2632c, "startReadLoop exit, set mIsReadLoopExit true");
            if (y.l()) {
                Q8.a.e(this.f2632c, "handleReadLoopStop, device=" + this.h);
            }
            synchronized (this.f2631b) {
                if (this.f2636g == EnumCloseType.f22316c) {
                    k(4);
                }
                j();
                this.f2642n = true;
                synchronized (this.f2631b) {
                    InputStream inputStream3 = this.f2644p;
                    this.f2644p = null;
                    o.b(inputStream3);
                    b();
                    Q8.a.a(this.f2632c, "closeInputStreamAndSocket, close the InputStream and close the mSocket ok");
                    g(aVar);
                }
            }
        } catch (Exception e3) {
            Q8.a.h(this.f2632c, "handleReadDataInit, mSocket.getInputStream() fail", e3);
            Q8.a.a(this.f2632c, "stopConnect(), sendFlagToExitWriteDataLoop()");
            j();
            b();
        }
    }
