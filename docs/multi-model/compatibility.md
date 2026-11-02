# 跨型号 API 业务兼容性审查

日期：2026-11-02。范围：当前 Python 0.1.1、已保存 APK 静态证据、包内 compatWhiteList 的 85 条记录；未连接耳机、未执行写命令。以下路径相对项目 outputs/oppo-headphone-api。原 APK SHA-256：eacb314e092cfb6c2f075eee834498412255cadf184978f3dc16400f6e1dd5d4。

## 结论

可以继续逆向其他型号，并且已经有跨型号共享命令的证据，但不能把 Free4 的枚举和白名单直接扩为所有型号的可写 API。建议第一阶段发布型号目录与显式 opt-in 的只读协议探测，维持 Free4 原接口兼容；其他型号的写方法按经过取证的策略单独开放。

静态目录不是设备能力；命令能力位也不是某个 featureId、ANC 子模式或按键功能有效的证明。应同时保留型号策略、实际命令能力、响应格式与硬件验证状态。

## 已证实的业务差异

### 1. ANC 的位编号不是跨型号语义枚举

现有 `models.py:NoiseMode` 将 1 定义为 ANC、2 定义为通透、4 为深度；`client.py:set_noise_mode` 对所有 profile 使用相同枚举和父子家族 `{0:{0,3},1:{1,4,5,6,7},2:{2,8}}`。

包内 Enco X（061410）却声明 `(protocolIndex,modeType)=(3,4),(2,3),(0,1),(1,2)`，即索引 1 为通透、2 为轻度、3 为深度。仅检查索引存在仍会把 `NoiseMode.ANC` 发成通透。自动对比发现 **16 条型号记录的相同索引语义与 Free4 冲突**，具体记录见 compatibility-audit.json；这只是发现确定不兼容项的下界，不代表其余型号完整兼容。

Enco X2（063C10）的通透家族包含索引 9，现有 Free4 枚举和父模式回读校验均未覆盖。应由选定型号的 `noiseReductionMode/childrenMode` 建立选项与家族，不使用固定 enum 承载跨型号语义。

证据：`evidence/commands/anc-current-mode-resolve.java` 根据每个型号配置以 protocolIndex 查 modeType；`anc-mode1.java` 还会在 `decideByEarDevice` 为真时检查设备支持位。`CurrentNoiseModeInfo` 的 type 1/5 为位图、type 2 为单字节等级，故原始读取必须保留 type，不能一律解释为位掩码。当前 `set_noise_mode` 固定发送 type=1；旧型号是否走该写分支仍须逐族核实，配置的 `noiseReductionUIVersion` 只是 UI 字段，不能作为 wire 协议版本。

### 2. featureId 映射与“字段非空”不是同一层证据

`profiles.py:feature_ids` 使用 Python truthy 解释各字段。完整静态统计：gameMode=1 有 68 条；multiDevicesConnect=1 有 39 条、=2 有 12 条；highToneQuality=1 有 28 条；spatialTypes 列表有 48 条；bassEngineSupport=1 有 24 条；gameSoundList 列表有 17 条；gameEqPkgList 在 85 条中全部缺失。

这批字段实际是整数、列表或缺失，没有观察到字符串布尔值；不要为了适配将原值统一强制成 bool 而丢失 1/2 差异。multiDevicesConnect=2 的 UI/协议扩展含义未在本审查中恢复，不能仅用 truthy 宣称完整双连管理兼容。gameSoundList 是游戏音效条目列表，不是独立证明 feature39 与 feature40 都可写的开关许可。

feature6/17/24/27 的全局名字有直接代码证据；29/33/39 的现有主要证据是 refreshSwitch 状态映射。`evidence/switches/feature-refresh.json` Evidence ID ev_140dda3cf7f674e376a8f827904af7db32a51c566e3d335b49eae7f98d9f33e3；H0/I0/payload2 证明通用 0403 两字节封包。不能由全局映射直接证明所有型号的适用性。

有 **12 条型号记录在当前八项映射下无任何 feature 候选**。`get_features(None)` 会因空列表被 byte_ids 拒绝；`snapshot` 不捕获 ValueError，因此纯读快照也不能原封不动泛化。无候选应返回“未确定可查询项目”，而不是隐式查询 Free4 默认值或阻断整份快照。

### 3. 新旧空间接口必须分开

旧路径 `HeadSetSpatialAudioVM.h` 写 feature27；新路径 `HeadSetSpatialAudioVMV2.h → repository.u0 → HeadsetCoreService.U0` 写 0422[type]，读 012A。Evidence IDs：设置 ev_33efa919318f3df4b4035a34ab848f0a3245fc439f08873b09494c7b45d41060，读取 ev_dae183c1d7673d35aa4edaa4a73818c70827cae957bce23bb6ee7ab45e700173。

现有 `feature_ids` 因 spatialTypes 非空就允许 feature27，这不能证明旧 bool 接口适用于该型号；同样，缺 spatialTypes 也不证明没有旧空间功能。应显式策略 `legacy_feature27 / spatial_type / unknown`，结合运行时 012A/0422 能力选择，未知保留原始值。当前未完成空间类型数字的通用文案映射，不能擅自称 type2 为头部追踪。

### 4. EQ 封包可复用，预设名字和门槛不可照搬

010F/0406 工厂预设与 0122/0418 自定义 EQ 是两套 ID 空间。自定义描述符包含频率、段数、上下限，可复用结构解析，必须使用设备返回的原始描述符。证据 `eq/eq-list-parse.json` ev_78c30a1d2d7f15a7be186c52b6d3fe3f02bfb9198e9d6b8d6773a613959dc1c4。

当前 `profiles.py:eq_options` 的名字表仅包含 Free4 用到的 6 项。`eq/eq-preset-names.java`（Ab.h0.d，ev_041d0371901683e861562fcc67f71599352933f614184c5a6e39639d82a4093d）包含 1..46 展示枚举，而且 1..4 的文案还依赖型号名/f(str)。不能让“同一个 protocolIndex”代表全品牌相同音效。

完整目录有 **14 条带门槛的 EQ 条目**。现有 app_version 默认 17006005 是按版本名推导，实际 versionCode 是 117006005，Manifest meta-data 为 17006004；完整 APK 比较算法尚未还原。跨型号适配宜只显示无门槛项为候选，门槛项保留原字段及未评估状态，等实际固件比较规则明确后启用。调用者传整数不是该整数正确性的证明。

### 5. 按键功能枚举存在确定的型号特例

`controls/key-function-map.java` 中 db.a.c 对“上一首”返回 `f.G(name)?4:5`、“下一首”返回 `f.G(name)?5:6`；`key-brand-gate.java` 确认 G 仅匹配精确名字 OnePlus Buds 或 OnePlus Buds Z。四条产品记录（060414/068414、060814/068814）因此不能套用 Free4 上一首5、下一首6。证据 IDs：ev_895557486d80215a8602735f79fe0006b3bf72d3e56ffee78f89e607b7af3222、ev_515efc1668e01393724eb1861698e532812eaca217fc42b19c01913c83943b5a。

`key-action-map.java` 还证明 UI action16→wire1、17→2、18→3 等转换。白名单的 ear/action/support 不能直接复制成四字节 wire 记录。现有 get_key_bindings 默认 device_types=(3,1)，没有覆盖所有型号的耳侧/聚合语义；读探测应要求策略提供设备类型，未知仅展示 raw，不猜左右耳。

`set_key_bindings` 保留已读三字段身份的设计可复用，但当前只检查 function 是 uint8，没有按型号/手势允许列表验证；换型号后仍可能写入语义错误的功能。先恢复 control.support 掩码与 UI-to-wire 映射，之后再开放命名写 API。

## 推荐的最小适配结构

1. `ModelCatalog`：只负责 APK 配置枚举、产品 ID 精确选择、保留原值与来源；缺 uuid/版本/名字重复时显式记录，不能自动用 Free4 UUID。
2. `ProtocolStrategy`：codec、传输默认值、握手、已确认查询命令和解析器。只有族确认后才执行请求；initialize 默认 subscribe=False。
3. `FeaturePolicy`：每个业务功能标明 unknown / static_candidate / hardware_verified；ANC 模式与家族从该型号配置派生；keys、EQ、spatial 分别使用自己的转换规则。
4. 默认只读探测：0100 能力；已知族内 010D 显式非空 ID 列表；010C 原始 action/type/value；010F 原始预设ID；0122 自描述列表；012A 原始类型；0108 使用已确认 device_types。每项错误独立记录，不把“响应能解析”升级为“功能实际有效”。
5. 注意现有 `_receive` 会自动回复 0500 时间与 051C 主机请求。若承诺严格只读配置，应说明这是协议维护回复，或另设 host_request_policy；不要宣称当前连接完全不发任何写字节。
6. 初期新增型号不开放 set_noise_raw、set_feature 或 request 的任意写能力；如果暴露 raw API，明确它是高级研究接口，与安全只读客户端分离。Free4 原行为兼容保留。

## 有价值的回归检查

- Enco X 索引1显示为通透，不能通过 Free4 ANC 枚举发送；X2 通透家族包含9。
- 无 feature 候选的型号不发送 count=0 的010D，也不使快照整体失败。
- multiDevicesConnect=2 保留2；spatialTypes 列表不自动生成 legacy27写许可；gameSoundList 非空不自动生成39/40许可。
- OnePlus Buds/Z 两组产品ID使用上一首4/下一首5，普通组使用5/6；UI action不直接作为wire action。
- 不同型号同一个EQ协议ID可以有不同名称；未知固件门槛不被默认满足。
- 真机未验证/未知协议族的型号，在进入传输写函数之前拒绝设置；已有Free4用例保持通过。

审查使用本地脚本解析既有JSON，结果记录于 compatibility-audit.json；无额外设备或云操作。结论基于已有静态证据，无新增 REA 取证必要。协议族与传输分支由另一子任务独立核对。
