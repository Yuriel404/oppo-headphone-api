# 电量与版本查询API

本轮从同一APK新恢复的读取接口。只做静态还原和离线测试，没有新增真机验证。先连接并调用initialize()，查询仍会检查命令能力并处理设备拒绝。

## 电量：get_batteries()

请求0106，payload为空。回复8106，使用同sequence：

```text
status:u8, count:u8, (deviceType:u8, packedBattery:u8) × count
levelRaw = packedBattery & 0x7F
charging = (packedBattery & 0x80) != 0
```

返回list[BatteryReading]：device_type、level_raw、charging、value_raw。保留原始deviceType，不统一标成左耳/右耳/盒；0或大于100的值保持原样，不宣称有效百分比。APK另有fixBattery/fixBatteries修正逻辑，本接口未复制型号/状态修正。

例：去掉status后的 `03 01 64 02 B2 03 FF` 解析为 `(1,100,false)`、`(2,50,true)`、`(3,127,true)`。

## 版本：get_versions()

请求0105，payload为空。回复8105：

```text
status:u8, count:u8, UTF8("deviceType,versionType,version,...")
```

逗号分隔字段必须组成count组三元组。返回list[VersionReading]：device_type_raw、version_type_raw、version_raw，保留字符串。例如Version_118不会自动变成整数118，也不据此开放EQ预设。

APK构造器会归一化设备类型、解析版本类型并调用trimVersion；参考库保留原始字段，避免未核实的跨型号转换。0105对应能力位0；0106同时在APK baseline命令集中，但baseline不是设备必然接受的保证。

## CLI与错误

在python/中按需执行，地址为占位值：

```powershell
python -m enco_free4 --address AA:BB:CC:DD:EE:FF battery
python -m enco_free4 --address AA:BB:CC:DD:EE:FF versions
```

CLI可执行profile仍限Free4两项，型号目录命令与设备读取命令独立。

默认服务UUID仍来自所选Free4配置。研究其他型号时，必须先确认服务，再显式构造对应传输或传入service-uuid；不能只改蓝牙地址就认为完成型号适配。

非零status抛DeviceRejected，能力不足抛UnsupportedFeature，格式不符抛ProtocolError，断线或超时沿用现有错误。解析器比APK部分宽松分支更严格：拒绝额外尾字节、空版本字段、非法UTF-8或不一致的三元组计数。未来扩展格式应单独适配。

## 静态证据

以下文件位于仓库evidence/multi-model/common-queries/：

| 文件 | 结论 |
|---|---|
| query-battery.json | commands.m.e发送262，即0106 |
| query-versions.json | commands.m.A发送261，即0105 |
| empty-payload-dex.json | w8.b字段为空byte数组；JADX初始化方法失败后用DEX核对 |
| battery-parser.json | commands.e.d从count读取二字节记录 |
| battery-record.json | BatteryInfo的0x7F/0x80拆分 |
| parse-0105.json | commands.m.K检查status后解析版本 |
| version-parser.json | commands.e.m的UTF-8逗号三元组结构（有反编译重复块告警） |
| version-record.json | VersionInfo接收三项字段 |

既有evidence/commands/receive-parser.smali的packed-switch 0x8100将8105路由到K，将8106路由到电量解析，避免仅按方法名猜命令。ID及哈希见总索引。空数组初始化的DEX记录为本地格式解析，不冒充REA Evidence。
