# OPPO Enco Free4 型号配置与降噪协议证据

本记录依据用户提供的 `example.apk` 静态分析。APK SHA256：`eacb314e092cfb6c2f075eee834498412255cadf184978f3dc16400f6e1dd5d4`。没有通过真实耳机验证 Windows 连接、命令响应或听感；静态代码中的 UI 名称不保证所有固件都提供相同能力。

## 精确型号与配置

可加载型号文件为 `../../profiles/enco-free4.json`，包含 `profiles` 数组和两个版本的完整原始 `function` 字段；降噪英文 API 名、中文标签和父子关系在同文件的 `resolved_noise_modes` 中，属于为本项目整理的映射。

| 产品 | APK 产品 ID | 最低 App 版本字段 | supportSpp |
| --- | --- | --- | --- |
| OPPO Enco Free4 | `068C10` | `15003002` | true |
| OPPO Enco Free4（丹拿版） | `06C010` | `15003002` | true |

两者原始 `uuid` 为 `0000079A-D102-11E1-9B23-00025B00A5A5`。传输证据已确认该值复制到 `SupportDeviceConfig`，再由 SPP socket 路径使用；GATT 路径也读取该可配置 UUID。Windows 真机仍应执行 SDP / BLE 服务发现，不应从字符串形式判断连接方式。对应证据在 `../transport/support-config-map.json`、`support-config-init0.json`、`support-config-uuid.json`、`spp-device-init.json` 与 `spp-create-connection.json`。

两种配置均声明：`multiDevicesConnect=1`、`gameMode=1`、`highToneQuality=1`、`customEqualizer=1`、`heyFindDevice=1`、`spatialTypes=[0,1]`、`spatialHiResMutex=1` 和 `noiseReductionUIVersion=2`。这些是 App 型号配置；设备实际返回的命令能力和当前固件状态仍需查询。

EQ 模式不能将两个型号混用：普通版原始 `equalizerMode` 为 `(protocolIndex,modeType) = (0,26),(1,28),(2,29)`；丹拿版另有 `(3,30)`。两者 `equalizerModeCompat` 包含 `(7,34)`，条件 `minFirmVersion=118`。丹拿版 `equalizerModeByVersion` 另有 `(8,40)`，条件 `minFirmVersion=136,minAppVersion=15011000`。这些数字需要走 EQ 对应协议，不能用 ANC 位图解释。

## 内置白名单解码

APK 资源为 `res/raw/heymelody_app_whitelist.json`，文件并非明文 JSON。`whitelist.a.n(InputStream,byte[])` 显示：前 12 字节 nonce、AES-GCM 解密、gzip 解压。以 APK 签名证书 SHA256 的原始 32 字节为 key，GCM 认证成功后得到完整 JSON。

- 证书 SHA256 / key：`49bd5f8f3f687aa3c71e79d570034455d68945c3ec45bb5f186169b8503c8e3e`
- 加密资源 SHA256：`3acaa7285b85b01ab45906282642b1a27d26b049a6fc368fdd6b1a439c697ba4`
- 解码 JSON SHA256：`0ef07d3361d4ae3e4bf1e5f6aea5a07ca010af57b6630588fc1f532ae13cc8b9`
- 解码长度：120294 字节。实际型号数据来自 `compatWhiteList` 的 85 条记录；`whiteList` 为空。
- 完整文件：`packaged-whitelist.json`；解码来源：`packaged-whitelist-provenance.json`。
- 静态解码入口证据：`whitelist-decode1.json`，Evidence `ev_70ecf8426097663cc3c5ad3d0900f0345b1a6b0d41ae50b2ae46bf53d6a7d949`。

解码脚本是本项目分析工具，没有运行 APK，也没有访问 OPPO 云端；认证成功证明所用 key 与该资源匹配，不构成对 APK 官方来源的鉴定。

## ANC 查询与响应

应用层命令 `0x010C` 的 payload 必须带查询动作和类型：

| 查询目标 | payload | 已保留证据 |
| --- | --- | --- |
| 当前降噪模式 | `01 01` | `dex-anc-query-h.json`，`commands.m.h` 的 DEX 字节数组 |
| 支持的降噪模式位图 | `02 01` | `dex-anc-query-v.json`，`commands.m.v` |
| 长按切换相关模式 | `03 01` | `anc-query0.json`，Evidence `ev_f19ec52b6e6dfbfea6ab4d04a17ed12abd3d19ff97f6bca3faccf915fc451821` |
| 智能切换当前匹配等级 | `04 01` | `dex-anc-query-s.json`，`commands.m.s` |

当前只观察到 `01 01` 的常规当前模式查询入口；没有 `01 02` 可用的证据。

`0x810C` 响应 payload：`[status, action, type, value...]`。其中第 1 个字节为 status，第 2 个字节为 action，第 3 个字节才是 type。`action==1` 使用 `CurrentNoiseModeInfo(offset=2, payload)`；`action==2/3` 使用 `NoiseReductionInfo(offset=1,payload)`；`action==4` 使用智能模式数据对象。不要将 action 当成 type。

响应分派证据：`receive-parser.json` / `receive-parser.smali`，Evidence `ev_085cfab5d58a906cf76431b0269881dd3794a3a316364fd90de43a2271c3489a`。

`CurrentNoiseModeInfo` 的 type 1 和 5 为 LSB first 位图；type 2 为等级 byte。支持模式对象使用最多 4 字节的小端整数，并通过 `(value & (1 << protocolIndex)) != 0` 判断某项。

## Free4 降噪模式与真实设置方式

`modeType` 是 App 显示语义；`protocolIndex` 是协议位编号，两者不能互换。普通版与丹拿版的 ANC 配置相同。

| API 名（本项目命名） | 中文含义 | protocolIndex | modeType | 0x0404 payload |
| --- | --- | ---: | ---: | --- |
| `off` | 关闭 | 0 | 1 | `01 01 01` |
| `anc` | 降噪主项 | 1 | 5 | `01 01 02` |
| `transparency` | 通透主项 | 2 | 2 | `01 01 04` |
| `off_child` | 关闭子项 | 3 | 1 | `01 01 08` |
| `anc_deep` | 深度降噪 | 4 | 4 | `01 01 10` |
| `anc_moderate` | 中度降噪 | 5 | 8 | `01 01 20` |
| `anc_mild` | 轻度降噪 | 6 | 3 | `01 01 40` |
| `anc_smart` | 智能切换 | 7 | 7 | `01 01 80` |
| `transparency_child` | 通透子项 | 8 | 2 | `01 01 00 01` |
| `adaptive` | 自适应 | 11 | 10 | `01 01 00 08` |

这些是应用层 payload，不含蓝牙链路帧、序号或校验。表中内容由 APK 实际构造逻辑和认证解密后的型号配置推导；没有声称设备已执行这些报文。

主项/子项只是 UI 层级。普通 UI 点击只选一个 `protocolIndex`，**不能因为存在父子关系而同时置 parent 和 child 两位**。调用链：

1. `NoiseReductionItem.a.c` 把选项的 `getProtocolIndex()` 传给 `repository.b.m0(index,address)`。
2. 具体实现 `repository.O.m0` 调用 `l0(index,1,address)`。
3. `l0` 交给回调 `repository.y.get` 的 case 1。
4. 回调新建 `CurrentNoiseModeInfo()`，`setType(1)`，仅 `setCurrentNoiseReductionModeValue(index,true)`，提交 service 动作 1014。
5. `HeadsetCoreService.I0` 以命令 `0x0404` 发送 `getData()`。

该路径创建全新的活动模式位图，没有复制旧活动位图。所以高层“切换 ANC 模式”API 应发单 bit；任意位图编辑应作为单独的 raw API 保留。

位图初始为 8 bit；当 index 超出现有数组时，`growArray` 将长度扩成 `((index // 8) + 1) * 8`。因此 index 11 必须用两字节值 `00 08`，不能将 11 当一个普通枚举字节下发。

## 静态实现证据索引

| 结论 | 文件 | Evidence ID |
| --- | --- | --- |
| 主项 1/2/5/10 中文语义 | `anc-mode-labels.json` | `ev_33f0e64ae9006fc4d0e0cb741cacf0f6dd23e567c293c40d51135ac25813cbfa` |
| 子项 3/4/7/8 为轻度/深度/智能切换/中度 | `anc-name-map.json` | `ev_5589b435ab9027f6465003bce3247e0c9bda462b7c8f5f6f21a39c848b0e8c7b` |
| UI 取 protocolIndex | `anc-button-selection.json` | `ev_14d8236230bbe8dc30dea5e09de7b38e6d0ba90f713707bf9ba535ebfc35cbb9` |
| 固定 type=1 的常规设置 | `anc-select-repository.json` | `ev_6b73bc2d28b0c29e16e7fe10976a5d9f1159c27081240a2d762f0833596a192c` |
| 新对象仅设置一个 bit | `anc-set-bit-construction.json` | `ev_4ae846590e29dc2a6f4997f85120a3900d56247cbf0b18caefaf04b3ef863c86` |
| 扩展布尔数组 | `anc-array-growth.json` | `ev_fffad41f342f1a6924ef22cf1b21cb1c98a9cace70fa5ed882e708653daca0f4` |
| 0404 设置命令 | `core0.json` | `ev_f70ddb47527ce2b9f3baa2fe6f74511d8ca6d4c0185d211b0ba33ce2c8ca3067` |
| 位图序列化 | `payload0.json` | `ev_e5a625a95f2318689e0191f1f161fae4f1aa7f79842aea7a14a0d7b3d3f3b867` |
| 当前模式响应解析 | `payload1.json` | `ev_ea5a35ad7edf618196cb4ad0d443c5b77d5d921f3081ece810157fb34df3c294` |
| 支持模式 bit 校验 | `anc-mode3.json` | `ev_7c96b0cccb2616183c98ba3b0f6dd3f6ee351d0b803d9b2e4b4a11a9525d4195` |

中文资源名与内容另见解包后的 `res/values-zh-rCN/strings.xml`。`anc-name-map` 的 modeType 7 使用 `melody_common_intelligent_noise_reduction_title_v2`，值为“智能切换”；modeType 10 使用 `melody_common_noise_reduction_action_auto`，值为“自适应”。这两个模式含义不同。

## 建议的 Windows/Python 操作流程与剩余实测项

先完成传输连接、协议握手和命令能力发现，再发 `010C 02 01` / `010C 01 01` 保存支持范围与原状态；按型号 profile 列出可选模式。用户选某项后，校验型号和设备能力，构造 type1 单 bit 的 `0404`，确认应用层 ACK，再用 `010C 01 01` 查询实际状态。

对于明确的子项，读回应观察到相应模式；对于“降噪/通透/关闭”主项，固件是否返回主项还是其子项需要真机确认。主项可能进入固件记住的子模式，是兼容设计要考虑的情况，尚不能作为已观察行为。不要把本地发送成功、链路 ACK 或 App 缓存更新当成独立的设备状态验证。

UI 还会检查命令能力、连接状态及佩戴/入盒状态。实际硬件拒绝可能由佩戴状态、固件支持或连接占用造成，需要保留原始 status 与响应帧以定位。所有参数读写、Windows SDP/GATT 发现、固件状态归一化及听感效果仍列为真机待测。
