# EQ 列表、增删改与 Free4 预设映射

本结论来自本地欢律 17.6.5 APK 静态分析，SHA-256 为 `eacb314e092cfb6c2f075eee834498412255cadf184978f3dc16400f6e1dd5d4`。未连接耳机进行实测。工厂预设的协议 modeID 与自定义 EQ 的 eqId 属于不同字段。

## 0x0122 查询：完整 EqInfo 列表

请求命令 `0x0122`，payload 为空。响应 `0x8122`：

```text
status:u8
count:u8
repeat count times:
    selected:u8
    minGain:i8
    maxGain:i8
    eqId:u8
    nameByteLength:u8
    nameBytes:byte[nameByteLength]
    bandCount:u8
    repeat bandCount times:
        frequencyHz:u16 little-endian
        gain:i8
```

没有每项总长度字段，解析下一项依赖 nameByteLength 与 bandCount。nameByteLength 是字节数。名称写入明确使用 UTF-8；读取源码使用 Android 默认字符集，可在 Python 以 UTF-8 解析。minGain、maxGain、gain 直接读取 Java byte，必须按有符号 8 位解释；selected、eqId、nameByteLength、bandCount 都按无符号字节解释。频率通过 n7.d.d(...,2,true) 解码，该工具函数已确认 true 表示小端。

status 非零时停止解析。count=0 是合法空列表；bandCount=0 在原解析器中被判为错误。应对每次读取做边界检查，不应接受残缺列表为完整状态。

直接证据：

- controls/eq-list-query.java：commands.m.d 发送 290 / 0x0122，空 payload。
- commands/receive-parser.smali 的 :pswitch_41f 对应 0x8122：status=0 后调用 e.b(1,payload)。Evidence `ev_085cfab5d58a906cf76431b0269881dd3794a3a316364fd90de43a2271c3489a`。
- eq-list-parse.java/json：commands.e.b 的完整字段解析。Evidence `ev_78c30a1d2d7f15a7be186c52b6d3fe3f02bfb9198e9d6b8d6773a613959dc1c4`。
- eq-integer-decode.java/json：n7.d.d 的大小端规则。Evidence `ev_7468ac7a023834e45eee5782b46d269c3e2d638766403f68f13facd489a81a4c`。

## 0x0418 设置：action 枚举与结构

```text
action:u8
minGain:i8
maxGain:i8
eqId:u8
nameByteLength:u8
nameBytes:byte[nameByteLength]  # UTF-8
bandCount:u8
repeat bandCount times:
    frequencyHz:u16 little-endian
    gain:i8
```

该命令不含 selected 字段。总 payload 长度为 `6 + UTF8名称字节数 + 3*bandCount`，见 commands/core2.java 的 HeadsetCoreService.M0，以及 eq-byte-length.java/json。

| action | 业务意义 | 直接调用证据 |
|---|---|---|
| 0 | NONE，服务端拒绝发送 | BluetoothService$a.handleMessage 的 param_set_eq_action 默认值及分支 |
| 1 | 创建自定义 EQ | eq-create-ui.java：Ab.Z$i.a 新建 DTO、设置名称及数组后调用 i(1,...) |
| 2 | 写入现有 EQ／选用自定义 EQ | eq-update-ui.java：点击自定义预设调用 i(2,...)；eq-save-ui.smali：修改名称后同样传 2 |
| 3 | 删除自定义 EQ | eq-delete-ui.java：Ab.s.onClick 删除选中配置调用 i(3,...) |

action2 可能同时激活被修改配置，不能承诺“后台修改而保持当前音效不变”。action3 在原发送器中仍传完整 EqInfo，且发送器始终检查频率与增益数组非空、长度相同；不应自创只传 eqId 的删除包。

创建路径新 DTO 未设置 eqId，构造器只初始化 nameLength，因此 Java 默认 eqId 为 0；不能把这个输入值当作最终分配结果。创建成功后重新查询 0x0122，以设备返回的 ID、selected 和数组为准。修改与删除应使用刚查询到的现有 eqId 及完整配置。频率数组优先保留耳机返回值，不应给所有型号硬编码相同频点或段数。

响应命令为 0x8418。通用回调观察到 status 与可选第二字节 rspValue；本次没有确定第二字节在 EQ 操作中的全部语义，应把它保留为原始值。SDK 的完成条件宜为 status=0 且重新查询得到目标状态。

动作证据 IDs：

- 创建：`ev_a454354b13a88d547010acd67d39be065d8b9ab87ebe81a13bc30bdc573d5ff5`
- 选用：`ev_c4ead9dfc756eb1242c4d108b98a37b6b2589956b2aa0a3eaf946f8fbfac1374`
- 改名保存：`ev_5fadcbedce444343bcbdbab06c8ae9bec2cca59ecdc688260bdd205e767cc2a4`
- 删除：`ev_94abd371a98fa9a6a41b6b5e7422c4d56168b557a0f5c6c692a389b9678d7fb6`
- 参数桥接：`ev_5cf7825b4c714b866c755ead0616dca6314e7516dbdff627ec56a37f6865c6da`
- 创建默认值：`ev_4878cfa1d45ab1f8afebe86332b1132399027a5763b54cf1c0d050afb83b1877`
- 通用响应：`ev_32798b02567876b1c8cf555b7778a34172fe671cb0cee2dc204ea375d9ecc45c`

## 增益单位

已确认的 APK 编辑界面按整数 dB 显示：Ab.Z.y 将 getDbValue() 原样传给 Ab.d 编辑器；Ab.d.onCreate 使用原整数值定位滑块，上下限原样格式化到 `+%s dB`／`%s dB`，没有比例换算。因此该 UI 路径按 1 raw unit = 1 dB 展示。创建路径使用 -6 至 +6，原始频点与每段增益都是整数。

证据为 eq-db-display.java/json（`ev_f6dacb0d7e48e38deb747b896f1c396ae9a3ca440284eaae3b89a30fe9a309c0`）及 eq-editor-entry.java/json（`ev_da609ae1a5c43866c77752ae1df4f79bdd51815788666f680ebf46c9cb48c766`）。Free4 是否实际选择该编辑器分支尚未追完；API 保留原始整数并使用设备返回上下限即可，不必额外缩放。

## Free4 工厂预设名称

`packaged-whitelist.json` 的 compatWhiteList[8] 为普通版 068C10，[9] 为丹拿版 06C010。protocolIndex 是发送给 0x0406 的 modeID；modeType 是 App 的展示枚举。Ab.h0.d 将 modeType 映射到资源名，再由 APK 的 values-zh-rCN/strings.xml 取得中文文案。

| modeID | modeType | 中文名称 | 型号／条件 |
|---|---|---|---|
| 0 | 26 | 至臻原音 | 两版基础项 |
| 1 | 28 | 纯享人声 | 两版基础项 |
| 2 | 29 | 澎湃低音 | 两版基础项 |
| 3 | 30 | 丹拿特调 | 仅丹拿版基础项 |
| 7 | 34 | 活力动感 | 两版 equalizerModeCompat，minFirmVersion=118 |
| 8 | 40 | 丹拿人声 | 仅丹拿版 equalizerModeByVersion，minFirmVersion=136、minAppVersion=15011000 |

条件数值保留白名单原值，没有把它们擅自转换成固件显示版本。打包白名单是 App 自带默认配置；设备返回、云端配置与固件条件可能进一步限制列表。工厂预设选择使用 `0x0406 [modeID]`；当前模式查询由 controls/eq-query.java 确认为 `0x010F` 空 payload。自定义配置使用前述 0x0418 action2。它们不能共享一个未经区分的 ID 参数。

机器可读结果及来源哈希已保存为 free4-eq-presets.json；可重放提取脚本为 work/headphone-api/extract_free4_eq_presets.py。名称函数 Evidence：`ev_041d0371901683e861562fcc67f71599352933f614184c5a6e39639d82a4093d`。

关于 minAppVersion：APK 的真实 versionCode 是 117006005，versionName 是 17.6.5；Manifest 另有 meta-data versionCode=17006004。17006005 是按版本名归一得到的推导值，不应写成直接读取的 APK versionCode。本次 15011000 门槛低于三者，不影响这一项条件判断，但完整版本比较算法仍需另行核实。

## 可直接用于实现的参考

eq_reference.py 提供独立的 parse_eq_list(payload) 与 build_eq_payload(action,profile)，只处理二进制，不包含蓝牙连接或 SDK 修改。已用合成数据验证 UTF-8 名称、负增益、ID 高位、LEu16 频率、连续多项，以及截断／多余字节拒绝。

编码样例：action2，eqId=128，名称“测试”，范围 -6..+6，两频点 60/15000 Hz、增益 -6/+6：

```text
02 FA 06 80 06 E6 B5 8B E8 AF 95 02 3C 00 FA 98 3A 06
```

该样例只用于离线编码校验，未发送到设备。
