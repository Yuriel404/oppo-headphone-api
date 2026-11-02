# 多型号协议族、传输与型号识别

调查日期：2026-11-02。仅静态读取既有 HeyMelody 17.6.5 APK，SHA-256 `eacb314e092cfb6c2f075eee834498412255cadf184978f3dc16400f6e1dd5d4`。没有运行 APK、连接其他耳机或访问云端。既有证据位于仓库根目录 evidence/；新增证据位于 evidence/multi-model/protocol/。

## 结论

**可以复用现有协议框架来研究更多型号，但本次没有发现“每个型号各有一套独立 API”的结构。** 所检查的设备工厂把运行时 `productType=101` 和 `102` 都交给 `N8.b` 包装器与 `M8.a` 通信处理器；差异主要在传输通道、型号选项和设备返回能力。这里的 `productType` 是运行时通信类型，不能与白名单 `type` 混为一谈。

未在该工厂中看到第三种编码器分支；其他 productType 返回 null。这是对 `D8.c.c` 的完整方法观察，不代表已排除整个 APK 的所有旁路、OTA、账户同步或其他产品族。

## 已确认的路由

| 层 | 代码事实 | 依据 |
|---|---|---|
| 型号类别 | `DeviceInfoManager.e` 默认 `setProductType(101)`，随后另行 `setType(supportConfig.getType())`，还复制 `isSupportSpp` | 新增 `device-init.json` / `ev_8be2c45213c3804959f1b7ba26ce2f2541398913a23c28cd1c94b4950db55c48` |
| 动态通信类型 | `n8.b.d(address)`：LE-only 返回102；在 LE Audio 支持且 LE Audio 已开启时返回102；否则101 | 新增 `route.json`，以及 `route-k.json`、`route-j.json` |
| 传输 | `I8.c.c` 每次创建前重新调用 `n8.b.d`；101→`G8.d`，102→`F8.m` | 既有 `evidence/transport/transport-connect-route.json` |
| 应用编码 | 101/102 都用 `N8.b` + `M8.a`，MTU来自DeviceInfo；负值回退512 | 既有 `evidence/transport/codec-select.json` / `ev_5b2632668de668b12cf0c04a47a6199f39b488ac7e947ac54cd579a41d43690a` |

`n8.b.k` 检查设备服务、系统 `isLeOnlyDevice` 反射结果，以及本地 LE 子地址；`n8.b.j` 还读取 LE Audio 管理状态。自研 Windows API 不应照搬这些 Android 私有系统查询。应明确选择已确认暴露的 RFCOMM 或 GATT 服务，并分别验证。

## UUID 与分片差异

- `G8.d.<init>` 从型号配置读取 UUID，非空时用于 RFCOMM；空值用 `00001107-d102-11e1-9b23-00025b00a5a5`。不能将 Free4 的 `079a` 默认值推广到所有型号。
- `F8.m.<init>` 同样允许型号配置覆盖 GATT service；空值回退 `0000079a-d102-11e1-9b23-00025b00a5a5`。
- GATT 写与通知特征的静态常量分别是 `0100079a-...` 和 `0200079a-...`。覆盖 service UUID 不等于可以按字符串规则推导新 characteristic UUID，必须发现服务并确认特征。
- `M8.b.HandlerC0041b.handleMessage` 中 `productType=102` 有独立帧大小分支；普通控制与 `0x0302` OTA 命令处理不同。经典通道普通帧使用660；另有OTA特例12388。不能用普通配置命令的成功证明OTA或超长包兼容。
- `M8.b.c` 还按传输块大小切块、等待发送回调；BLE ATT切块与应用层分片不能混用。

上述来自既有 `spp-device-init`、`spp-static`、`gatt-device-init`、`gatt-static`、`gatt-characteristic-lookup`、`frame/link-handler`、`frame/link-send`。这些只是配置路径代码事实，没有证明每个白名单型号当前固件实际暴露服务。

## 型号识别不是简单的查询一个命令

已恢复一条初始化匹配路径：

1. `DeviceInfoManager.c` 先从蓝牙设备和白名单匹配配置。
2. `Y.b` 取设备名称，用 `Y.p` 比较：`fuzzyMatchName=true` 使用区分大小写的 startsWith，否则精确 equals。
3. 名称命中多项时，用设备服务UUID筛选；还比较了UUID两个64位部分交换并反转字节的形式。
4. 仍歧义时，APK记录重复名称并返回首项。这种行为不适合作为自研软件可靠识别策略。
5. `DeviceInfoManager.c` 从匹配到的白名单ID转为 productId，再创建DeviceInfo；这一条路径的productId不是从配置命令回复读出的。
6. `Y.a(collection,id,name)` 收集ID与名称命中项，优先交集；仅有ID则取ID首项；名称存在但交集为空则取名称首项。因此同名、同ID、多地区型号不能凭一个字段断言唯一。

新增证据：`match-device.json` / `ev_955ea48767f52a7cb73ee433a50a922f5f6dcdbce2fc70210c699c4893f3ce51`；`match-config.json` / `ev_02d672d2d02ed8c70a16ce99a082a1786cfc90e3a9230be833b2786bd053662d`；`match-name.json`；`device-create.json` / `ev_502ae418b93dead9e79c0faee3a8c7312c4e1216d5bf8bb1c9da439bee3eee20`。DEX owner定位记录见 `device-create-dex.json`，用来消除反编译别名Y/E歧义。

本轮没有恢复出一个能够保证唯一型号识别的无线ProductID查询及完整解析器；也没有把 `0102` 猜作该接口。最小实现应由调用方明确选择型号记录，名称/UUID仅作匹配提示，出现歧义停止自动选择。云端更新、改名及不同地区固件可能进一步影响匹配。

## 多型号最小 API 流程

`选择唯一型号记录 → 校验配置字段与已实现功能 → 选择传输与实际服务 → 0100获取设备能力 → 读取当前功能 → 型号配置∩设备能力∩已实现解析器 → 显式设置 → 匹配sequence和状态 → 读回 → 重连验证持久性`。

已有码可复用普通帧编码、请求/回复匹配、能力位图和部分命令；不应把新型号白名单全部装入旧Free4枚举后宣称已支持。尤其降噪索引、预设EQ、按键意义及版本门槛需逐型号对照。

## 握手与鉴权的边界

既有 `evidence/handshake/` 恢复了 `0100`能力、`0200`通知能力与订阅、`0500`时间和`051C`主机能力请求；代码中普通配置帧直接构造命令、序号、长度和payload。所检查的两种传输工厂及UUID选择没有出现按白名单型号分派的独立加密认证步骤。

这不能证明所有固件均无鉴权。未完整分析账户配对、账号匹配、云资源、OTA、LE双耳共存及全部05xx主机请求。本轮未执行握手；已有Free4 RFCOMM真机记录仅适用于此前那副设备，不能扩展到其他型号。若新设备服务可连接但0100无响应，应保留字节记录并与该设备官方软件的正常会话对照，而不是自动遍历命令。

## 调查完成程度

- 已回答：现有工厂中编码器共享、运行时101/102含义、UUID覆盖与回退、型号匹配路径。
- 部分回答：通用配置握手；已恢复常用部分，其他05xx与固件前置条件未知。
- 未回答：其他型号真机兼容性、自动唯一识别无线接口、所有旁路协议族、设置持久性与实际声音效果。
