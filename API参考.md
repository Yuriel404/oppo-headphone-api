# Enco Free4 Python API 与蓝牙协议参考

0.2.0新增内容见 [多型号目录与适配方案](docs/multi-model/README.md) 和 [电量、版本查询](docs/multi-model/common-queries.md)。下面的Free4设置枚举继续保持原范围。

这份参考来自本次 APK 静态还原。Python 类名与方法名是本项目设计的封装；命令号与 payload 字段来自 APK。不能把它当成 OPPO 的官方 API 合约。0.1.1 已在本机通过 RFCOMM 验证功能状态读取与游戏模式开关，完整验证范围见 validation.json 和 [修复说明](修复说明-0.1.1.md)。

## 1. 导入与生命周期

~~~python
from enco_free4 import (
    HeadsetClient, WindowsRfcommTransport, BleakTransport,
    Feature, NoiseMode, KeyBinding, load_profile,
    DeviceRejected, UnsupportedFeature, ReadbackMismatch,
)

profile = load_profile("068C10")  # 丹拿版选择 06C010
transport = WindowsRfcommTransport(
    "AA:BB:CC:DD:EE:FF",
    service_uuid=profile.service_uuid,
    channel=0,
)
async with HeadsetClient(transport, profile=profile, timeout=10,
                         verify_timeout=3, verify_interval=0.2) as headset:
    info = await headset.initialize()
    current = await headset.snapshot()
~~~

推荐传入 profile，以便同时检查型号配置与设备能力。省略 profile 是面向协议研究的用法，只保留命令能力和设备响应校验。

| 方法 | 输入 | 返回 / 行为 |
|---|---|---|
| connect() / close() | 无 | 打开 / 关闭传输，断线使等待中的请求报错 |
| initialize(subscribe=False) | 是否订阅已知普通通知 | 能力位图、命令列表、已订阅事件；写设置前必须调用 |
| snapshot() | 无 | 功能开关、降噪、EQ、空间类型、按键；保留单项读取错误 |
| request(command,payload=b"") | 低层命令与原始 bytes | Packet，payload 包含 status；调用者负责解释 |
| next_event(timeout=None) | 可选超时秒数 | 未与请求匹配的原始 Packet |
| load_profile(product_id) | 068C10 / 06C010 | ModelProfile |
| profile.eq_options(firmware_version=None) | APK 模型使用的固件比较整数 | 可见的预设参数列表；版本未知时排除有固件门槛的条目 |

一个 HeadsetClient 对应一个连接。请求按顺序发送，写操作包含的读前 / 写入 / 读回由业务锁保护。不要让多个程序同时管理同一个耳机配置连接。

timeout 是每次应用请求的回复超时。verify_timeout 是功能开关收到成功 ACK 后的回读轮询窗口，默认 3 秒；verify_interval 默认 0.2 秒。窗口内只重读 010D，0403 设置只发送一次。首个读回相符就返回；窗口到期仍不符则抛出 ReadbackMismatch。verify_timeout=0 表示只立即查询一次。单次读取仍受 timeout 限制，因此无回复时会抛出 TimeoutError，最后一次请求可能延长实际等待时间。这两个验证参数仅用于 set_feature 及其具名开关方法。

### WriteResult

~~~python
WriteResult(
    command=0x0403,
    sequence=3,
    acknowledged=True,
    verified=True,
    readback={17: 1},
)
~~~

acknowledged 表示收到且通过应用层 status 检查。verified 表示按该方法的校验规则读回相符。两者都不代表配置已跨断电持久保存；查找模式也不声称已听见声音。

## 2. 功能开关

| 方法 | 参数 | 读回 |
|---|---|---|
| get_features(feature_ids=None) | 默认查询 profile 声明的功能；可显式给 ID 列表 | dict[int,int] |
| set_feature(feature_id,enabled) | ID 与严格 bool | 写一次，在验证窗口内重复查询该 ID，直到相符 |
| set_multipoint(enabled) | bool | featureId 17 |
| set_game_mode(enabled) | bool | featureId 6 |
| set_high_quality_audio(enabled) | bool | featureId 24 |
| set_spatial_audio(enabled) | bool | 旧路径 featureId 27 |
| set_bass_engine(enabled) | bool | featureId 29，Free4 当前 profile 未声明，默认拒绝 |

| Feature | 十进制 / hex | Free4 包内配置 |
|---|---|---|
| GAME_MODE | 6 / 06 | 声明支持 |
| MULTIPOINT | 17 / 11 | 声明支持 |
| HIGH_QUALITY_AUDIO | 24 / 18 | 声明支持 |
| SPATIAL_AUDIO | 27 / 1B | 声明空间类型 0、1 |
| BASS_ENGINE | 29 / 1D | 未声明该独立开关 |
| GAME_EQ | 33 / 21 | 未声明 |
| GAME_SOUND | 39 / 27 | 未声明 |
| GAME_MASTER | 40 / 28 | 未声明 |

后四项来自 APK 的通用功能表，不能因为 APK 有这些 ID 就向 Free4 全部开放。Free4 的“澎湃低音”预设属于 EQ mode=2，与独立 BASS_ENGINE 开关是不同接口。

~~~python
switches = await headset.get_features([6, 17, 24, 27])
await headset.set_multipoint(True)
~~~

查询 010D payload 是 count 后跟 ID，不是空 payload。Free4 四项查询为：

~~~text
04 06 11 18 1B
~~~

回复 810D：

~~~text
status:u8 | count:u8 | (featureId:u8,state:u8) × count
~~~

设置 0403：

~~~text
featureId:u8 | state:u8
~~~

例如双连开：11 01；双连关：11 00。SDK 先查询目标 ID，要求其当前值为 0 / 1，再写并轮询。2026-10-26 的 Free4 真机记录显示，设置成功 ACK 后约 0.4 秒仍可能读到旧值，约 0.7 秒才读到目标值；这是一次设备会话的观察，不是固定协议延时。返回 ID 本身不单独构成所有型号的支持证明。

## 3. 降噪

| 方法 | 输入 | 结果 |
|---|---|---|
| get_noise_raw() | 无 | action、type、data_hex、raw_hex |
| set_noise_mode(mode) | NoiseMode | Free4 命名模式，发送新建的 type=1 单 bit 位图并读回 |
| get_noise_support_raw() | 无 | 010C [02,01] 支持数据，保留原始 bytes |
| set_noise_raw(noise_type,data) | type=1/5 位图，或 type=2 单字节 level | 高级原始设置；严格对照 type 与数据字节读回 |

当前模式查询 010C 的 payload 为 01 01。回复 810C：

~~~text
status:u8 | action:u8=1 | type:u8 | value...
~~~

设置 0404：

~~~text
action:u8=1 | type:u8=1 | bitmask: little-endian bytes
~~~

bitmask = 1 << protocolIndex，长度为 protocolIndex // 8 + 1。使用新建位图，只置目标位；不要将旧活动模式位、父模式位与子模式位全部叠加。

| NoiseMode | protocolIndex | 0404 payload hex |
|---|---:|---|
| OFF | 0 | 01 01 01 |
| ANC | 1 | 01 01 02 |
| TRANSPARENCY | 2 | 01 01 04 |
| DEEP | 4 | 01 01 10 |
| MODERATE | 5 | 01 01 20 |
| MILD | 6 | 01 01 40 |
| SMART | 7 | 01 01 80 |
| ADAPTIVE | 11 | 01 01 00 08 |

另有 index3 关闭子项、index8 通透子项，保留在型号 JSON。主模式可能由固件恢复到其子档位；参考库对 ANC / OFF / TRANSPARENCY 校验所属模式家族，对具体档位校验对应位。这个兼容策略是本项目设计，归一化行为仍需真机确认。

~~~python
await headset.set_noise_mode(NoiseMode.DEEP)
state = await headset.get_noise_raw()
~~~

原始 level type=2 的可用取值与实际含义未为 Free4 完整验证，不把它作为面向用户的默认“降噪强度”滑块。已有命名档位应优先使用 set_noise_mode。

## 4. EQ 与空间音效

### 工厂预设

| modeID | 名称 | 型号 / 门槛 |
|---:|---|---|
| 0 | 至臻原音 | 普通版、丹拿版 |
| 1 | 纯享人声 | 两版 |
| 2 | 澎湃低音 | 两版 |
| 3 | 丹拿特调 | 丹拿版 |
| 7 | 活力动感 | 两版，白名单 minFirmVersion=118 |
| 8 | 丹拿人声 | 丹拿版，minFirmVersion=136、minAppVersion=15011000 |

固件整数是 APK 所用型号版本比较值，不能拿 Windows 蓝牙驱动版本代替。未知固件时，SDK 默认只开放基础预设。profile 中 app_version 默认 17006005 是由样本 versionName 17.6.5 归一推导的值；实际 APK versionCode 是 117006005，本次相关 App 门槛低于两者。比较器来源尚未完整追踪，移植版本门槛时保留这个区别。

| 方法 | 输入 | 结果 |
|---|---|---|
| get_eq_mode() | 无 | 010F → 810F [status,modeID] |
| set_eq_mode(mode_id,firmware_version=None) | 预设 ID，及已确认的固件整数 | 0406 [modeID]，查询 010F 验证 |
| get_equalizers() | 无 | 自定义 EQ 描述列表 |
| update_equalizer(eq_id,gains,name=None) | 从描述列表取得的 eq_id，原始整数增益数组 | 0418 action2，写入并选用后重查描述 |

### 自定义 EQ

自定义 eq_id 和工厂预设 modeID 属于两套标识，不要混用。先查询设备描述，使用其频率与范围，不能假定每个固件都是固定十段 EQ。

0122 空 payload；8122：

~~~text
status:u8 | count:u8 | entry × count

entry:
selected:u8 | min:i8 | max:i8 | eqId:u8
nameLength:u8 | UTF8 name bytes
bandCount:u8 | (frequency:u16 LE, gain:i8) × bandCount
~~~

0418 设置：

~~~text
action:u8 | min:i8 | max:i8 | eqId:u8
nameLength:u8 | UTF8 name bytes
bandCount:u8 | (frequency:u16 LE, gain:i8) × bandCount
~~~

action=1 创建，2 写入并选用，3 删除。参考库封装现有 EQ 的 action2 更新；创建与删除仅提供底层编码，完整 UI 流程及 ID 分配规则需另行实现。已查到的 APK 编辑界面按整数 dB 显示，API 保留原始整数；Free4 的实际编辑器路径与显示效果仍待联调。

~~~python
from dataclasses import replace

equalizers = await headset.get_equalizers()
if equalizers:
    original = equalizers[0]
    # 按你的 UI 产生 gains；长度须匹配 frequencies，值在 min_gain/max_gain 内。
    gains = list(original.gains)
    gains[0] = max(original.min_gain, min(original.max_gain, gains[0] + 1))
    await headset.update_equalizer(original.eq_id, gains)
~~~

修改会同时选用该自定义配置。返回值会核对 name、frequency、gain 和 selected=1。

### 空间音效

两条路径都存在于 APK：

- 旧式布尔开关：0403 [27,bool]，用 010D 查询 ID 27。
- 新式类型：012A 查询，812A [status,type]；0422 [type] 设置，能力位 47。

~~~python
current_type = await headset.get_spatial_type()
await headset.set_spatial_type(0)  # 只传型号允许且已明确其含义的类型
~~~

Free4 白名单类型列表为 [0,1]。本次尚未完整恢复这两个数字在该 UI 版本中的展示语义，因此 SDK 不将其猜成“头部追踪”“影院”等名称。软件可先保留数字及原始状态，实际标签经 UI / 真机对照后补齐。

## 5. 耳机操控

0108 查询 payload：

~~~text
count:u8 | deviceTypes:u8 × count
~~~

APK 普通路径出现 [02,03,01]，另一个分支增加 type2。这里的查询 selector 不应凭名称直接解释成左耳 / 右耳。SDK 默认使用已观察到的 (3,1)，也接受显式 device_types。

8108：

~~~text
status:u8 | count:u8
(deviceType:u8,button:u8,buttonAction:u8,function:u8) × count
~~~

普通设置用 0401：

~~~text
count:u8 | 相同的四字段记录 × count
~~~

0416 在操作教学页面使用，不能当作普通配置的协议升级替代品。

~~~python
from dataclasses import replace

keys = await headset.get_key_bindings()
if keys:
    chosen = keys[0]  # 实际软件应由用户选择已经读取的手势
    # function6 在 OPPO 普通映射中为下一首，仍需确认此手势允许该功能。
    await headset.set_key_bindings([replace(chosen, function=6)])
~~~

SDK 拒绝写入读前查询中不存在的 device_type/button/action 组合。四字段均保留整数，不把 JSON 白名单中的 UI action 或 support 位掩码直接当 wire function 发送。

常用 OPPO 普通 function：0 无；1 播放暂停；3 语音助手；5 上一首；6 下一首；8 切换降噪；11 增音量；12 减音量；13 切设备；17 游戏模式。完整 APK 映射和品牌分支见 evidence/controls/key-findings.md。这是一份定义表，不表示 Free4 的每个手势都支持其中每项功能。

## 6. 查找耳机

~~~python
await headset.set_find_mode(True)
# 查找结束或用户点停止
await headset.set_find_mode(False)

# 或显式短时操作，finally 中会尝试发送退出
await headset.find_for(seconds=5)
~~~

0400 payload 仅为 [1] 进入、[0] 退出，没有单耳选择字段。APK 的 PlayToneStateMachine 经 repository.o0 调用此命令，并把成功响应作为进入播放状态的依据；本次没有恢复出该路径中必须再发送的独立播放命令，也不把未确认的 0402 当作“播放铃声”。

本次未实测实际声音、单耳控制、自动停止时限或离线查找。set_find_mode 的 WriteResult.verified 固定为 false。find_for 的返回值是最后一次“退出查找”的 ACK；如果连接已丢失，finally 的退出也可能失败，应用应显示这一状态。

APK 查找流程包含入耳与通话检查。摘下耳机后才能开始测试。参考 CLI 的 find 要显式传 --earbuds-removed；stop-find 可以独立执行。

## 7. 传输与帧格式

两种传输都直接承载 OPOv1 帧，不增加自定义的两字节总长度头。

~~~text
AA | bodyLength:ULEB128 | control:u8 | reserved:u8=0 | [fragmentIndex:u8] | application bytes
~~~

bodyLength 包含 control、reserved、可选 index 及应用数据，不包含 AA 和 ULEB128 本身。control 低两位：0 单帧、1 首片、2 中片、3 末片；分片索引从 0 递增。常规控制帧最大 660 字节，OTA 特例不在参考实现范围。

应用包：

~~~text
command:u16 LE | sequence:u8 | payloadLength:u16 LE | payload...
~~~

sequence 每连接从 0 开始，255 后回 0。命令回复为 requestCommand | 0x8000，并匹配原 sequence。BLE ATT write response 只说明传输层接收，业务仍要等待应用回复。

静态还原测试向量，非真机抓包：

~~~text
0100 能力查询，seq=0，空 payload：
AA 07 00 00 00 01 00 00 00

0403 双连开启，seq=0x17，payload=11 01：
AA 09 00 00 03 04 17 02 00 11 01
~~~

在本次所选普通控制路径中未发现额外 CRC 或加密字段，不能把这个结论推广到 OTA 或其他厂商协议。

### 主机请求与通知

已恢复的耳机 → 主机请求：

| 请求 | 回应 |
|---|---|
| 0500 | 8500，同 sequence，[status=0,UnixSeconds LEu32] |
| 051C | 851C，同 sequence，[0,0,0]，Windows 保守地不宣告快速发现能力 |

SDK 只自动处理这两种已确认请求，不会对未知 05xx 一律回复成功。普通通知 0204 的首字节为 eventId；它不能替代某次设置的对应回复。某些诊断 / 历史事件需要特定 host ACK，本项目默认不订阅它们。

## 8. 错误与状态

| Python 错误 | 意义 | 软件应采取的动作 |
|---|---|---|
| UnsupportedFeature | 命令、型号选项或读出的目标不存在 | 隐藏 / 禁用控件，保留能力日志 |
| DeviceRejected | 耳机返回非零 status | 记录 command/status，不臆造错误名称 |
| ReadbackMismatch | ACK 成功但按方法规则仍未读回目标状态 | 展示实际值；功能开关错误同时包含 before、查询次数和等待时间 |
| TimeoutError | 应用回复未按时到达 | 标记结果未知；先重新读取 |
| ConnectionError / OSError | 蓝牙链路或 Windows 服务错误 | 重新发现 / 配对 / 连接，然后读取状态 |
| ProtocolError | 字段长度、分片或数据格式不符 | 保存原始 RX/TX，修正解析，不报告成功 |

## 9. 常用 CLI

从 python 目录运行。全局参数放在子命令前。

set-feature 只接收功能名和 on/off。set-noise 与 keys 各自是独立子命令，例如 set-noise deep、keys；不要写成 set-feature set-noise deep 或 set-feature keys。

~~~powershell
python -m enco_free4 --address AA:BB:CC:DD:EE:FF snapshot
python -m enco_free4 --address AA:BB:CC:DD:EE:FF set-feature multipoint on
python -m enco_free4 --address AA:BB:CC:DD:EE:FF set-feature game_mode on
python -m enco_free4 --address AA:BB:CC:DD:EE:FF set-feature game_mode off
python -m enco_free4 --address AA:BB:CC:DD:EE:FF set-noise deep
python -m enco_free4 --address AA:BB:CC:DD:EE:FF set-noise adaptive
python -m enco_free4 --address AA:BB:CC:DD:EE:FF set-eq 1
python -m enco_free4 --address AA:BB:CC:DD:EE:FF equalizers
python -m enco_free4 --address AA:BB:CC:DD:EE:FF keys
python -m enco_free4 --address AA:BB:CC:DD:EE:FF find --seconds 5 --earbuds-removed
python -m enco_free4 --address AA:BB:CC:DD:EE:FF stop-find
~~~

若功能开关在当前固件上需要更长生效时间，可延长验证窗口并保留原始收发日志：

~~~powershell
python -m enco_free4 --address AA:BB:CC:DD:EE:FF --verify-timeout 5 --trace game-mode.jsonl set-feature game_mode on
~~~

高音质特性在 CLI 中名为 high_quality_audio。更换丹拿版配置使用 --profile 06C010。BLE 使用 --transport ble，扫描 / 服务发现先单独运行。

如果你要将这些功能提供给自己的桌面 UI，直接导入异步 Python 库即可；本次未启动 HTTP 服务。也可以在同一进程中将自己的 HTTP 或 GUI 操作映射到这些方法，但连接、请求串行化和错误状态应继续由一个 HeadsetClient 管理。
