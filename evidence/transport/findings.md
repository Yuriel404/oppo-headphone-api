# 传输层静态证据

输入：example.apk，SHA-256 `eacb314e092cfb6c2f075eee834498412255cadf184978f3dc16400f6e1dd5d4`。以下均为 APK 静态代码事实，未连接 Enco Free4 实测。

| 项目 | 结果 | 原始证据 |
|---|---|---|
| BLE 配置 service 默认值 | `0000079a-d102-11e1-9b23-00025b00a5a5` | gatt-static.json / F8.m.<clinit>, ev_d7d38678ac2b4628fb76d0edee8d9f2b77c35702b0cb2696b35ae82443fe6c54 |
| BLE 写特征 | `0100079a-d102-11e1-9b23-00025b00a5a5` | gatt-device-send.json / F8.m.k, ev_a8e680df80725c9b601043987e815c0bd99fbfab9db548d8ff20fed98012ef80 |
| BLE 通知特征 | `0200079a-d102-11e1-9b23-00025b00a5a5` | gatt-setup-handler.json / B8.z.run case1, ev_dad277305753f1ca68ae9c39e686933b6e4bb48dab17079e665aa2f09150f7da |
| CCCD | `00002902-0000-1000-8000-00805f9b34fb`，开启 notification | gatt-static.json + gatt-cccd-write.json / Ab.O.run, ev_c25daa2b74e826655b28e23ea667b0b381f3449a1e3e24d6bcd157a8f3b8ef55 |
| 写操作类型 | Android setWriteType(2)，WRITE_TYPE_DEFAULT，需要GATT响应 | gatt-write-init.json / F8.n.<init>, ev_324ba9ed0e458e2a97473620ea68180ac3ed86bc466c5e5b1373dcc300f776a8 |
| RFCOMM 默认 service UUID | `00001107-d102-11e1-9b23-00025b00a5a5` | spp-static.json / H8.b.<clinit>, ev_7b26352c9af727416ed187833b11766209c955a0c718cdc61c8650314ffec76c |
| RFCOMM 连接调用 | createRfcommSocketToServiceRecord(uuid)，connect() | spp-create-connection.json + spp-socket-handler.json, ev_364f88e6ea017247a707e3f8f1d2b505b4cca5ab44772ea5497bc66225c1494d |

默认值可被 SupportDeviceConfig.getUuid() 覆盖。见 gatt-device-init.json / F8.m.<init> 及 spp-device-init.json / G8.d.<init>，后者 ev_f56f865265efdc57d86869607e63d5c0eb0edec420a942908cf6cf77f727d1fc。应通过实机服务发现确认所选服务，不能把默认 UUID 宣称为 Free4 已实测服务。

后续完成型号配置核对：`earphone.c.apply` case29/default 直接以 WhitelistConfigDTO 构造 SupportDeviceConfig；该构造器逐项复制 config.getUuid()，getter直接返回uuid。Free4包内白名单的079A UUID因此也覆盖RFCOMM通用1107回退值。对该样本的Free4配置，RFCOMM应首先使用白名单 `0000079a-d102-11e1-9b23-00025b00a5a5`；1107只作通用回退。证据 support-config-map.json `ev_38e849e0bc286282983ab41b02760813741a44c935b9ac683ede886a16919705`，support-config-init0.json `ev_4bee5307b1d6c8c61b7e0b2f8edb7a7b8f2c9650007ed8d21c87242c32daa48a`，support-config-uuid.json `ev_37aaf148ccb8c86312a6ef78dbbef2d144a22404f7deb192e14cad394f3c2da2`。这是代码与包内配置推导，依然不是实际SDP发现结果。

BLE 写：F8.m.k → F8.j.n → F8.n.a。bArr 原样交给 writeCharacteristic，传输层未增加前缀或改写；F8.j.n 串行队列，单次写超时 3000ms。通知：F8.j$a.onCharacteristicChanged → F8.g.run case0，clone 原字节 → E8.f.d → I8.c$a.d → D8.c$c.a → L8.a.a。订阅先 setCharacteristicNotification(true)，100ms 后写 CCCD，订阅超时3000ms。

RFCOMM 读：H8.a.e 先读3字节，检查0xAA，对随后最多2字节做7-bit continuation长度读取；没有额外的2字节长度头。若长度只占1字节，会扣掉已首读的第1个body字节。完整AA帧原样交给handler。见 spp-read-loop.json / ev_425fee8fa7a2cfe1ac31a7db8c251e8f534f9373d5e17c3615cb6ce7d290d0f7。

D8.c.c 为 productType101与102均创建 N8.b codec + M8.a；协议MTU由 DeviceInfo.getMTU 提供，负值时默认512。见 codec-select.json / ev_5b2632668de668b12cf0c04a47a6199f39b488ac7e947ac54cd579a41d43690a。这个MTU不是实测Windows ATT可写大小。

F8.j.d 使用 connectGatt(context,false,callback,2)，即主动LE连接，超时30000ms。有限DEX直接invoke扫描没有发现 BluetoothGatt.requestMtu 调用；这不证明操作系统不协商MTU。若实现BLE，应读取实际特征可写限制并由已验证的协议层分片，不能任意拼接分段假定耳机支持。

ja.l 中的 `0000079c...`、`b00d02af...` 等服务属于账号匹配/accountKey/ssoid相关流程，不应替代以上配置通道。当前尚未证明 Free4 实机暴露哪种通道或固件是否要求其他握手。
