# 其他型号的 APK 配置目录调查

调查日期：2026-11-02。基于此前已认证解码的欢律 17.6.5 包内 `res/raw/heymelody_app_whitelist.json`；本轮没有安装、执行 APK，也没有连接新耳机。这里的名称只是 APK 配置记录，不能用于证明产品已经发布、目前在售或真实设备已兼容。

## 清单与来源

`compatWhiteList` 有 **85 条记录、85 个唯一 ID、83 个唯一名称**；`whiteList` 是空列表。没有重复 ID。OPPO 53 条，OnePlus 32 条。原始 `type` 分布为 T1 45、T2 32、O1 4、N 4；本字段不是已确认的数字 productType，也不能据此直接选择某种帧协议。

所有 85 条的 `supportSpp` 都为布尔 true。66 条的 `uuid` 为 `0000079A-D102-11E1-9B23-00025B00A5A5`，19 条为 `00001107-D102-11E1-9B23-00025B00A5A5`。这是配置观察，不能替代固件的真实 SDP / GATT 服务发现。

机器可读结果为 [model-catalog.json](../../profiles/model-catalog.json)。保留 collection 与零基 index、名称、ID、别名、type、UUID、原始数值配置、版本门槛及所省略字段清单；字段不存在时不补 false。该文件用于离线查询型号参数，不应直接作为开放 85 个型号写入权限的名单。

复现提取：`python scripts/extract_model_catalog.py DECODED_JSON OUTPUT_DIR`。脚本先校验解码文件 SHA-256，再从原始字节解析；拒绝其他样本。不包含解密凭据、本机路径、云 URL 或应用包名列表。没有把完整原始白名单复制进本目录。

| 来源 | SHA-256 |
|---|---|
| APK | eacb314e092cfb6c2f075eee834498412255cadf184978f3dc16400f6e1dd5d4 |
| APK 内加密资源 | 3acaa7285b85b01ab45906282642b1a27d26b049a6fc368fdd6b1a439c697ba4 |
| 认证解码的原始 JSON 字节 | 0ef07d3361d4ae3e4bf1e5f6aea5a07ca010af57b6630588fc1f532ae13cc8b9 |

此前的解码来源与方法记录位于现有项目 `evidence/commands/packaged-whitelist-provenance.json`。服务 UUID 的代码传递链记录为 `support-config-map.json`（ev_38e849e0bc286282983ab41b02760813741a44c935b9ac683ede886a16919705）、`support-config-init0.json`（ev_4bee5307b1d6c8c61b7e0b2f8edb7a7b8f2c9650007ed8d21c87242c32daa48a）、`support-config-uuid.json`（ev_37aaf148ccb8c86312a6ef78dbbef2d144a22404f7deb192e14cad394f3c2da2）。这些定位支持“配置参与选择传输服务”，不支持“相同 UUID 就具有完全相同 API”。

## 需要单独适配的区别

| 示例记录 | ID | 配置差异及下一步 |
|---|---|---|
| OPPO Enco X3 | 067410 | gameMode=1、双连=1、equalizer=4、自定义 EQ=1、空间类型 [0,1,2]；与 Free4 有共用候选，但 EQ 模式索引应取本型号 |
| OPPO Enco X2 | 063C10 | equalizer=1、highAudio=1，未列 spatialTypes；不能复制 X3 / Free4 的功能集合 |
| OPPO Enco Free3 | 066010 | type=T2、equalizer=2、空间 [0,1]；type 与 equalizer 的业务分支需要追踪 |
| OPPO Enco Air4 Pro | 067C10 | equalizer=2、空间 [0,1]，未列 customEqualizer；不能默认开启自定义 EQ |
| OnePlus Buds Pro 3 | 064014 | equalizer=4、自定义 EQ=1、空间 [0,1,2]，可作为重点复用候选 |
| OnePlus Buds Pro 2 | 062014 | equalizer=4、自定义 EQ=1，未列 spatialTypes；缺字段不能推定设备完全不支持空间功能 |
| OnePlus Buds Pro | 060C14 | 使用 1107 UUID，自定义 EQ=1、双连=1，未列 equalizer/gameMode；读取与写入路径需分别验证 |
| OPPO Enco W31 / M31 | 060810 / 050410 | 配置较少且使用 1107；不宜从新款直接推广功能命令 |

相同业务字段也可能是枚举。例如 `multiDevicesConnect` 存在 1 与 2；`wearDetection`、`equalizer`、`zenMode` 等值不是统一的布尔能力位。版本限制包含顶层 minVersion、podsVersion / opsPodsVersion / heyMelodyVersion，以及嵌套 minFirmVersion、minAppVersion 等；必须保留原值与所在层级，不能通过“版本号看起来更大”自行解释跨产品比较规则。

## 隐藏项、别名和同名冲突

28 条配置含真值 `hideFromUIList`。14 条含 children 名称，共 18 个别名，包括 Bohr、Nobel、Einstein、Laplace、ohm、Curie、xiapu 等名称。这些可以是内部标识、地区名称或匹配别名；本轮仅证实其存在，不将它们认定为测试型号，也不认定为已经上市的产品。

两个主名称对应多个 ID：

- OnePlus Buds Z：060814、068814。
- OnePlus Buds：060414、068414。

保留的配置字段相同，但原始记录仍有其他省略字段差异，因此目录查询必须以产品 ID 为准。Air3i 的 067010（`OPPO Enco Air3i`）与 068810（`OPPO Enco Air 3i`）存在空格近似名称，不应仅依据标准化名称合并。

包内没有字段能让本轮把某条记录确定分类为“占位型号”或“测试型号”。仅依据名字或隐藏标记作此结论会超出证据范围。

## 可交付与剩余边界

已完成：全量 collection 计数、85 条配置目录、重复 ID / 名称检查、18 个别名及隐藏项保留、功能与门槛提取、源文件哈希核验、可复现的离线提取脚本。

仍待确认：各 type 对应的代码分支和数字 productType；功能配置到命令的完整调用路径；旧款 / OnePlus 的 EQ、降噪、按键编码差异；鉴权与握手分支；所有新增型号的真实服务、响应、配置效果与保存行为。目录 API 可以立即提供查询；蓝牙配置接口应按命令证据逐项开放，并且继续查询设备返回的能力。

本轮其他专项已补充协议路由和业务差异，见 [总报告](README.md)；本报告保留目录调查阶段的边界。
