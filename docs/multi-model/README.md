# 其他型号 API 逆向结论与接入方案

日期：2026-11-02。样本为 HeyMelody / 欢律 17.6.5，APK SHA-256：`eacb314e092cfb6c2f075eee834498412255cadf184978f3dc16400f6e1dd5d4`。本轮复核原始 APK 和已解码资源哈希，复用已有证据，并补充协议路由、型号识别、电量和版本解析的静态取证。

**可以继续逆向并覆盖其他型号。主要工作是共用通信协议，加上每个型号自己的参数、功能策略和验证记录。** APK 中有85个配置ID，其中83个在既有两款Free4配置之外；它们不是85个已经验证可用的设备。包含28条隐藏配置，名称也不构成产品已发布或在售的证明。

## 本轮成果

| 成果 | 范围与状态 |
|---|---|
| 型号目录 | 85个ID，83个主名称；OPPO 53条、OnePlus 32条；18个别名 |
| 通信复用依据 | 运行时productType 101/102共享N8.b + M8.a；分别走RFCOMM / GATT |
| UUID | 66条配置使用079A，19条使用1107；须按型号取完整UUID并确认真实服务 |
| 业务差异 | 16条配置存在与Free4冲突的ANC索引含义；旧款OnePlus有按键特例 |
| 新查询API | get_batteries() / get_versions()，含解析器、CLI和离线测试；这两项尚未真机验证 |
| 离线目录API | list_models()、get_model()、catalog_summary()；可立即查询全部配置 |

现有可执行 `--profile` 仍为两个Free4配置。新增目录不会自动把其他型号名称套入Free4的降噪、EQ和按键枚举。其他型号的连接、写入效果与持久保存仍需对应设备验证。

本轮验证：48项离线测试通过；安装包在隔离Python导入检查中包含全部85条目录记录；目录提取脚本从已核验的原始解码资源重建出的文件与发布副本逐字节一致。独立代码审查未发现阻止交付的问题。

## 型号与接口差异

| 型号例子 | ID | 已确认的适配重点 |
|---|---|---|
| OPPO Enco X | 061410 | ANC索引1为通透、2为轻度、3为深度；与Free4冲突 |
| OPPO Enco X2 | 063C10 | 通透家族还有索引9，不能用Free4固定家族检查；EQ配置不同 |
| OPPO Enco X3 | 067410 | 普通协议复用候选；空间列表含0/1/2，自定义EQ按本型号参数 |
| OPPO Enco Free3 | 066010 | type=T2不是wire协议版本；EQ和空间配置须独立处理 |
| OPPO Enco Air4 Pro | 067C10 | 目录未列customEqualizer，不能因此开放自定义EQ写入 |
| OnePlus Buds Pro 3 | 064014 | 通用查询复用候选；预设EQ、空间和门槛按本型号 |
| OnePlus Buds Pro | 060C14 | 配置UUID为1107；不能直接用Free4默认079A |
| OnePlus Buds / Buds Z | 060414/068414、060814/068814 | 同名多ID；上一首/下一首为4/5，普通分支为5/6 |
| OPPO Enco W31 / M31 | 060810 / 050410 | 配置较少、UUID为1107；不应默认具有新款功能 |

全量数据见 [85条配置表](model-table.md) 和 [机器可读目录](../../profiles/model-catalog.json)。本轮目录检查覆盖全部配置记录；业务深度取证覆盖共用路径和明确特例，并未对每个固件逐项验证。

## 共用命令与型号参数

命令号是本地蓝牙应用协议，不是HTTP地址。共享结构来自APK；运行时仍须检查命令能力、应答状态及型号语义。

| 功能 | 查询 / 设置 | 共享结构 | 型号相关部分 |
|---|---|---|---|
| 能力 | 0100 / — | 空请求；响应status + 位图 | 实际支持项 |
| 版本 | 0105 / — | 空请求；status + count + UTF-8三元组 | 设备/版本类型及比较规则 |
| 电量 | 0106 / — | 空请求；status + count + 二字节记录 | deviceType、特殊值与修正 |
| 功能开关 | 010D / 0403 | 查询count + IDs；设置featureId + state | 可用featureId、配置枚举含义 |
| 降噪 | 010C / 0404 | action + type + value | 索引语义、父子项、type含义 |
| 预设EQ | 010F / 0406 | 预设ID | ID文案、固件门槛 |
| 自定义EQ | 0122 / 0418 | 频率/增益描述符 | 段数、范围、现有EQ ID |
| 空间类型 | 012A / 0422 | 类型值 | 新路径与legacy feature27选择 |
| 按键 | 0108 / 0401 | 耳侧/按键/动作/功能四字段 | UI到wire转换、功能编码 |

`multiDevicesConnect=2` 在12条配置中出现，不能简单等同“全部双连管理已支持”。有12条配置在原有八项feature映射下得到空列表；直接套入Free4快照会报错。缺字段应保留为未知，而不是补false或沿用Free4默认值。

## 多型号配置流程

1. **选定唯一配置ID。** 名称和UUID只辅助匹配。APK在名称仍歧义时取首项，不应作为可靠识别策略；本轮没有确认能唯一识别所有型号的无线ProductID查询。
2. **确认真实服务。** 从该型号取UUID，选择RFCOMM或GATT。GATT的service与characteristic分别检查，不能用字符串替换推导特征。
3. **查询0100，再读状态。** 将设备能力与型号配置、已实现解析器取交集；逐项保留失败，不因一项不支持丢掉整份快照。
4. **形成型号策略。** ANC从本型号树构建索引和家族；EQ保留门槛；按键使用型号映射；空间区分新旧路径。
5. **单项设置并读回。** 匹配回复命令和sequence，检查status，读回相符后标记“已应用”。写超时先读取，不自动重发。
6. **重连验证保存。** 记录具体ID、固件、传输、命令结果和实际效果；只将验证过的组合升级为已支持。

共用帧不代表相同握手。普通配置工厂中未观察到按型号分派的独立加密认证，但未排除其他固件鉴权、账户同步和其他05xx主机请求。现有客户端可能回应0500时间、051C主机能力请求；“读取配置”不等于完全不发送协议字节。

## 使用新增API

在仓库 `python/` 目录运行，目录命令不建立蓝牙连接：

```powershell
python -m enco_free4 models --brand OnePlus
python -m enco_free4 models --query 'Enco X' --visible-only
python -m enco_free4 model-info 063C10
```

```python
from enco_free4 import list_models, get_model

models = list_models(brand="oppo", include_hidden=False)
model = get_model("061410")
print(model["uuid"])
print(model["function"].get("noiseReductionMode"))
```

返回的是原始配置记录，不是可直接传给Free4写接口的ModelProfile。名称可重复，get_model只接受ID。默认包含隐藏配置，include_hidden=False可排除。

在已经初始化的客户端上，可显式读取新增通用数据：

```python
batteries = await headset.get_batteries()
versions = await headset.get_versions()
```

详见 [通用查询API](common-queries.md)。这两项没有加入默认快照，也不自动转换EQ门槛整数或猜左右耳。

## 来源与边界

- [目录调查](catalog-report.md)：资源统计、重复名称、别名和隐藏项。
- [协议族与型号识别](protocol-families.md)：类型、路由、匹配及握手。
- [业务兼容性审查](compatibility.md)：ANC、功能开关、EQ、空间和按键。
- [机器可读差异审查](compatibility-audit.json)：冲突型号与字段取值。
- [证据索引](../../evidence-index.json)：REA/DEX定位、原始和公开副本哈希。

已回答“能否继续逆向、有哪些型号、哪些协议可复用、有哪些确定的不兼容参数”，并交付目录API和两个新查询解析器。剩余工作是逐族还原未覆盖语义、补齐完整握手，以及其他设备的连接、写入效果和持久性验证。现有Free4真机记录不延伸为其他型号的兼容证明。
