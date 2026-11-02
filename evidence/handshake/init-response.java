    public final void c(String str, w8.a aVar) {
        byte b10 = 0;
        if (str == null) {
            return;
        }
        com.oplus.melody.common.util.y.a aVar2 = Q8.a.f5077a;
        if (com.oplus.melody.common.util.y.l()) {
            Q8.a.a("NotificationCommandManager", "onReceivePacket key=0x" + Integer.toHexString(aVar.a()));
        }
        int i10 = aVar.f33771a;
        byte[] bArr = aVar.f33774d;
        if (i10 == 516) {
            if (bArr.length == 0) {
                Q8.a.f("NotificationCommandManager", "The length of data is 0 when receive notification event");
                return;
            } else {
                b(str, 0, bArr, aVar);
                return;
            }
        }
        if (i10 == 33285) {
            Q8.a.n("NotificationCommandManager", "onReceivePacket.CMD_REGISTER_NOTIFICATION_MULTI_RSP ok, init cost time: " + (System.currentTimeMillis() - this.f22228f), str);
            this.f22228f = System.currentTimeMillis();
            DeviceInfo deviceInfoF = DeviceInfoManager.a.f22177a.f(str);
            if (deviceInfoF == null || !n8.b.j(str)) {
                return;
            }
            deviceInfoF.setInitCmdCompleted(true);
            this.f22223a.obtainMessage(76, str).sendToTarget();
            return;
        }
        switch (i10) {
            case 33280:
                Q8.a.n("NotificationCommandManager", "onReceivePacket.CMD_GET_NOTIFICATION_CAPABILITY_RSP", str);
                int iL = e.l(bArr);
                ConcurrentHashMap<String, Set<Integer>> concurrentHashMap = this.f22227e;
                if (iL != 0) {
                    eb.J.b(iL, "handleReceiveNotificationCapabilities error. status = ", "NotificationCommandManager");
                } else if (bArr.length <= 1) {
                    Q8.a.f("NotificationCommandManager", "handleReceiveNotificationCapabilities error, the length of data is less than 1");
                } else {
                    int i11 = bArr[1] & 255;
                    if (bArr.length < 2 + i11) {
                        Q8.a.f("NotificationCommandManager", "handleReceiveNotificationCapabilities error, the length of data is less than ");
                    } else {
                        androidx.collection.b bVar = new androidx.collection.b(i11);
                        for (int i12 = 0; i12 < i11; i12++) {
                            bVar.add(Integer.valueOf(bArr[i12 + 2]));
                        }
                        concurrentHashMap.put(str, bVar);
                        com.oplus.melody.common.util.y.a aVar3 = Q8.a.f5077a;
                        if (com.oplus.melody.common.util.y.l()) {
                            Q8.a.a("NotificationCommandManager", "handleReceiveNotificationCapabilities: capability=" + e.a(bVar) + ", mac=" + com.oplus.melody.common.util.y.r(str));
                        }
                    }
                }
                Set<Integer> set = concurrentHashMap.get(str);
                if (set == null) {
                    Q8.a.d("NotificationCommandManager", new F8.d(12), str);
                } else {
                    Integer.toHexString(i10);
                    set.toString();
                    s8.c cVar = this.f22226d;
                    boolean zC = cVar.c(517, str);
                    HeadsetCoreService headsetCoreService = this.f22224b;
                    w8.b bVar2 = this.f22225c;
                    if (!zC) {
                        Iterator<Integer> it = set.iterator();
                        while (it.hasNext()) {
                            headsetCoreService.z0(str, bVar2.a(str, 513, new byte[]{(byte) it.next().intValue()}));
                        }
                    } else if (!cVar.c(517, str)) {
                        Q8.a.d("NotificationCommandManager", new G8.a(6), str);
                    } else if (set.isEmpty()) {
                        Q8.a.g("NotificationCommandManager", "registerMultiNotification support event set is null, cmd: 0x" + Integer.toHexString(517), str);
                    } else {
                        int size = set.size();
                        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(1 + size);
                        byteBufferAllocate.put((byte) size);
                        for (Integer num : set) {
                            if (num != null) {
                                byteBufferAllocate.put((byte) num.intValue());
                            }
                        }
                        Integer.toHexString(517);
                        Wa.a.g(byteBufferAllocate.array());
                        headsetCoreService.z0(str, bVar2.a(str, 517, byteBufferAllocate.array()));
                    }
                    if (cVar.c(265, str)) {
                        headsetCoreService.z0(str, bVar2.a(str, 265, w8.b.f33776b));
                    } else {
                        Q8.a.d("NotificationCommandManager", new B8.a(13), str);
                    }
                }
                break;
            case 33281:
                int iL2 = e.l(bArr);
                if (bArr != null && 1 < bArr.length) {
                    b10 = bArr[1];
                }
                if (iL2 != 0) {
                    Q8.a.g("NotificationCommandManager", g0.c.a("Failed when receive register notification event response status=", iL2, b10, " event="), str);
                } else if (com.oplus.melody.common.util.y.l()) {
                    StringBuilder sbK = A0.k(b10, "handleReceiveRegisterEventRsp SUCCESS event=", ", mac=");
                    sbK.append(com.oplus.melody.common.util.y.r(str));
                    Q8.a.a("NotificationCommandManager", sbK.toString());
                }
                break;
            case 33282:
                int iL3 = e.l(bArr);
                if (iL3 != 0) {
                    eb.J.b(iL3, "Failed when receive registered notification. ", "NotificationCommandManager");
                } else {
                    b(str, 1, bArr, aVar);
                }
                break;
            case 33283:
                int iL4 = e.l(bArr);
                if (iL4 != 0) {
                    eb.J.b(iL4, "Failed when receive cancel registered notification status = ", "NotificationCommandManager");
                } else if (bArr.length <= 1) {
                    Q8.a.f("NotificationCommandManager", "Error, the length of canceling registered notification is not valid");
                } else {
                    Q8.a.c("NotificationCommandManager", new r0(bArr[1], 26));
                }
                break;
            default:
                Q8.a.f("NotificationCommandManager", "Error, Receive unsupported packet " + Integer.toHexString(i10));
                break;
        }
    }
