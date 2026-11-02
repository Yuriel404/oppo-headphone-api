# OPPO Enco Free4：Windows / Python 配置流程与 API 方案

版本 0.1.1，整理日期：2026-10-26。适用目标为你自己的 OPPO Enco Free4；“设备管理”按你确认的含义实现为设备双连。

本方案附带可导入的 Python 参考库和命令行工具。协议与型号参数来自你提供的欢律 / HeyMelody 17.6.5 APK，不是 OPPO 发布的公共 SDK。已完成静态还原、离线测试，以及本机 RFCOMM 连接、功能状态读取、游戏模式开启与关闭的真机验证。其他设置的实际效果、音频延迟和重连后的保存结果仍须单独验证。

## 1. 交付内容

| 文件或目录 | 用途 |
|---|---|
| 本文件 | 功能范围、连接流程、配置步骤、真机验收 |
| [API参考.md](API参考.md) | Python 方法、命令号、字段格式、错误处理 |
| [python/](python/) | Python 3.11+ 参考库、CLI、示例和离线测试 |
| [profiles/enco-free4.json](profiles/enco-free4.json) | 普通版与丹拿版的 APK 内置型号配置 |
| [protocol.json](protocol.json) | 便于移植的机器可读协议表 |
| [证据索引.md](证据索引.md) | 主要结论对应的反编译文件与 Evidence ID |
| [validation.json](validation.json) | 离线与真机验证记录、未验证事项 |
| [修复说明-0.1.1.md](修复说明-0.1.1.md) | 游戏模式回读延迟的复现、修复与正确 CLI 用法 |

样本身份：包名 com.heytap.headset；versionCode 117006005；SHA-256：
~~~text
eacb314e092cfb6c2f075eee834498412255cadf184978f3dc16400f6e1dd5d4
~~~

## 2. 功能覆盖

| 你的功能 | 已还原的接口与范围 | 实现说明 |
|---|---|---|
| 降噪 | 关闭、通透、降噪、深度、中度、轻度、智能切换、自适应 | 型号白名单、UI 名称和单 bit 设置路径已交叉核实 |
| 设备双连 | 读取 / 开启 / 关闭 | featureId 17；这是耳机的多设备连接开关 |
| 音质音效 | 高音质开关、预设 EQ、自定义 EQ 读取 / 修改并启用、空间类型 | 不同版本的预设不同；部分预设有固件门槛 |
| 游戏功能 | 读取 / 开启 / 关闭游戏低延迟模式 | featureId 6；Android 游戏识别与手机侧优化需要另行实现 |
| 查找耳机 | 进入 / 退出查找模式、限时退出 | 复用 APK 的查找状态机所调用的 0400；实际响铃须真机观察 |
| 耳机操控 | 读取映射、修改现有手势的功能、读回校验 | 使用普通设置命令 0401；保留设备返回的耳侧、按键、动作字段 |

双连开启不等于已经连接第二台设备，第二台设备仍须完成正常配对 / 连接。这里的双连接口不包含枚举、删除历史配对设备的完整管理页面。

耳机高音质开关只改变耳机侧设置；Windows 实际采用的音频编解码器和延迟仍由主机、驱动与链路共同决定。

## 3. 软件结构

建议使用四层：

1. **型号与能力层**：选择产品配置，查询设备命令能力，只开放交集内功能。
2. **业务 API 层**：例如 set_multipoint、set_noise_mode、update_equalizer。
3. **事务与协议层**：序号、分帧、响应匹配、状态检查、写后读回。
4. **蓝牙传输层**：Windows RFCOMM 为首选；BLE GATT 为可选通路。

程序向耳机发送本地蓝牙命令。所选的普通配置路径中未发现需要调用云接口或使用云端凭证的步骤；这不等于所有型号、OTA 或其他协议路径都没有额外握手。

~~~mermaid
flowchart TD
    A[选择 Free4 型号配置] --> B[Windows 配对并确认设备地址]
    B --> C[连接型号指定的蓝牙服务]
    C --> D[0100 查询命令能力]
    D --> E[读取当前状态并保存快照]
    E --> F[用户修改一个设置]
    F --> G[生成命令与 sequence]
    G --> H{收到对应应用响应}
    H -->|非零 status| I[显示耳机拒绝原因及原始状态]
    H -->|超时或断线| J[标记结果未知 重新连接后读取]
    H -->|status 为零| K[查询并核对新状态]
    K --> L[显示已读回验证]
    L --> M[断开重连后再读 验证持久性]
~~~

查找耳机没有在本次调查中恢复出独立的响铃读回状态，返回值会保持 verified=false。其他设置的 verified=true 表示按对应方法读回相符，持久保存由最后一步单独验证。功能开关在成功 ACK 后默认以 0.2 秒间隔、3 秒窗口确认状态，避免耳机尚未生效时误报失败；窗口内只重读，不重发设置。

## 4. Windows 环境与连接

当前电脑已有 Python 3.14.6，可直接运行本项目的标准库 RFCOMM 通路，无须先安装 BLE 依赖。示例运行目录：

~~~powershell
Set-Location './python'
python -m enco_free4 --help
python -m enco_free4 profile
python -m unittest discover -s tests -v
~~~

真机步骤：

1. 在 Windows 蓝牙设置中与耳机正常配对，保持耳机唤醒。
2. 记录配对设备的**经典蓝牙 MAC**，用于 RFCOMM。不要直接把 BLE 扫描地址当作经典地址。
3. 初次联调时关闭手机上可能占用配置连接的欢律页面。
4. 先执行只读 snapshot，确认返回能力和当前状态，再选择一个设置进行写入。

~~~powershell
python -m enco_free4 --address AA:BB:CC:DD:EE:FF --trace session.jsonl --output before.json snapshot
~~~

地址只是格式示例，需要换成你的真实设备地址。此处为通用调用示例；已有真机验证的范围见第 8 节。

### 型号与服务 UUID

| 配置 | 产品 ID | 首选 RFCOMM service UUID |
|---|---|---|
| OPPO Enco Free4 普通版 | 068C10 | 0000079a-d102-11e1-9b23-00025b00a5a5 |
| OPPO Enco Free4 丹拿版 | 06C010 | 同上 |

这是由 APK 内置白名单与 SupportDeviceConfig → RFCOMM socket 的调用链共同确认的型号参数。SDK 使用它作为默认值，实际固件是否暴露该服务仍需 SDP 连接验证。通用回退 UUID 00001107-d102-11e1-9b23-00025b00a5a5 只适用于没有型号覆盖的路径，不应替代 Free4 的首选值。

RFCOMM 实现通过 Winsock AF_BTH、SOCKADDR_BTH、UUID 与 port=0 请求服务连接；不需要预先创建 COM 口。Windows SDK 中该地址结构按 1 字节对齐，共 30 字节。

### BLE 可选通路

如需 BLE，可在项目目录创建独立环境后安装可选依赖；BLE/GATT 尚未完成真机验证：

~~~powershell
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install '.[ble]'
.\.venv\Scripts\python.exe -m enco_free4 scan
.\.venv\Scripts\python.exe -m enco_free4 --address AA:BB:CC:DD:EE:FF gatt
.\.venv\Scripts\python.exe -m enco_free4 --transport ble --address AA:BB:CC:DD:EE:FF snapshot
~~~

BLE 必须先确认服务和特征存在：

| 用途 | UUID |
|---|---|
| service | 0000079a-d102-11e1-9b23-00025b00a5a5 |
| write | 0100079a-d102-11e1-9b23-00025b00a5a5 |
| notify | 0200079a-d102-11e1-9b23-00025b00a5a5 |

先启用通知，再发命令。APK 使用 write-with-response，参考实现明确传 response=True，保守地按 20 字节进行 ATT 写入切块。ATT 切块和应用协议分片是两层机制，后续应结合真实服务行为联调。BLE 地址可能随设备广播或隐私地址机制变化。

## 5. 建议配置流程

### 5.1 建立连接并读取能力

选择普通版 068C10 或丹拿版 06C010，连接后发 0100 空 payload。成功回复 8100 的 payload 为 status 后跟能力位图。程序用 APK 的 69 组位映射解码；型号配置不能替代设备的实际能力回复。

默认使用主动查询即可。确有实时 UI 需求时可调用 initialize(subscribe=True)：先用 0200 查询通知能力，再订阅已返回的普通事件。参考实现只选择 1、2、3、5、6、17，避免把需要特定 host ACK 的诊断、历史事件一起注册。

### 5.2 读取与留存

读取降噪、功能开关、EQ、按键映射，保存 before.json。自定义 EQ 要保存完整频率、增益范围与原始值；按键要保存完整四字段记录，方便恢复原设置。

### 5.3 单项修改与确认

每次只发一个业务设置。匹配回复命令号和 sequence，检查 status=0，再查询该设置。界面区分：

| 结果 | 应显示的状态 |
|---|---|
| 非零 status | 设备拒绝，并保留原始 status 数字 |
| 成功 ACK 且读回相符 | 已应用，已读回验证 |
| 成功 ACK 但读回不符 | 状态不一致，展示实际读回值 |
| 超时或断开 | 结果未知，先重连读取；不要自动重复写入 |

SDK 不会自动重试写入。命令可能在 ACK 丢失之前已经执行，重复写入不应成为默认恢复方法。

### 5.4 互斥与系统侧功能

Free4 白名单声明 spatialHiResMutex=1，表示高音质与空间音效之间存在互斥规则。界面应让用户选择目标模式，分别读取两个状态，并以耳机结果为准。SDK 不会暗中关闭另一个开关。

游戏开关仅代表所确认的耳机功能。不要将“开启低延迟”显示为已经实现 Android 的自动游戏识别或 Windows 全系统音频优化。

### 5.5 重连与验收

关闭连接，重新连接同一耳机并重复读取。即刻读回和重连读回都相符，才可在自己的软件中记录为“配置已保存”。持久性必须以当前固件的真机结果为依据。

## 6. 六类功能的调用示例

以下方法位于已连接并完成 initialize() 的 HeadsetClient 上；每一项都是独立操作示例，不应在连接时全部自动执行。

~~~python
from enco_free4 import NoiseMode

await headset.set_noise_mode(NoiseMode.DEEP)       # 深度降噪
await headset.set_noise_mode(NoiseMode.ADAPTIVE)   # 自适应
await headset.set_multipoint(True)                # 双连
await headset.set_game_mode(True)                 # 游戏低延迟
await headset.set_high_quality_audio(True)        # 高音质开关
await headset.set_eq_mode(1)                      # 普通版：纯享人声
~~~

推荐的最小 Python 连接方式：

~~~python
import asyncio
from enco_free4 import HeadsetClient, WindowsRfcommTransport, load_profile

async def main():
    profile = load_profile("068C10")
    transport = WindowsRfcommTransport(
        "AA:BB:CC:DD:EE:FF", service_uuid=profile.service_uuid
    )
    async with HeadsetClient(transport, profile=profile) as headset:
        print(await headset.initialize())
        print(await headset.snapshot())  # 只读

asyncio.run(main())
~~~

自定义 EQ、空间类型、按键和查找的参数及示例见 [API参考.md](API参考.md)。

## 7. 真机联调顺序与验收标准

| 顺序 | 检查项目 | 合格结果 |
|---|---|---|
| 1 | Windows 服务连接 | Free4 型号 UUID 能连接；记录 transport、MAC、固件 |
| 2 | 0100 与状态读取 | 能解码能力，并连续读取降噪、双连和 EQ |
| 3 | 设备双连 | 开关 ACK 与读回相符，第二台设备连接行为符合设置 |
| 4 | 降噪 | 关闭、通透、深度、自适应分别切换，声音效果与返回位一致 |
| 5 | EQ / 高音质 / 空间 | 预设相符，自定义值与频率保持一致；互斥状态可解释 |
| 6 | 游戏模式 | 开关读回相符；延迟效果另行测量 |
| 7 | 耳机操控 | 只改已读出的一个组合，实际手势与读回一致 |
| 8 | 查找 | 摘下耳机后短时试验，确认进入、响铃、退出以及异常中止行为 |
| 9 | 持久性 | 断开重连后，预期保存的设置仍一致 |

查找功能在 APK 中会检查入耳和通话状态。测试前摘下耳机，保留清晰的“停止查找”按钮；不要把它放到自动化配置或开机动作中。本次没有触发铃声。

如果服务连接成功但 0100 无响应，先检查字节日志、序号、链路分片和是否有其他配置端占用。仍无法解释时，在你自己的 Android 手机上记录一次正常操作的 Bluetooth HCI snoop，以对照实际 UUID、握手、请求与回复；不要通过遍历命令号来试探设备。

## 8. 当前完成程度与边界

已完成：样本身份确认；Free4 两个型号配置提取；RFCOMM/GATT 参数追踪；帧格式、能力查询、功能命令和读回结构还原；Python SDK、CLI、示例与 38 项离线测试。2026-10-26 已在用户耳机上完成 Windows RFCOMM/SDP 连接、0100 能力查询、010D 状态读取、0403 游戏模式开关验证，并恢复原先关闭状态。公开的筛选后记录见 diagnostics/，筛选范围见 diagnostics/README.md。

待真机确认：BLE/GATT 实际服务；其他型号或固件的连接与鉴权步骤；其他设置的真实效果和所有设置的保存行为；游戏模式的实际音频延迟；降噪父模式是否归一化到子档位；查找模式是否直接响铃及其自动停止行为；按键的实际耳侧标识；高音质与空间音效的互斥细节。

参考实现不包含手机云端查找、离线定位、OTA、原厂账号系统、自动游戏识别或完整历史配对设备管理。若你的后续软件要包含这些功能，应作为独立接口继续取证和验证。

## 9. Windows / BLE 官方实现资料

以下资料用于核对主机 API，耳机私有命令依据本地 APK Evidence：

- Microsoft：SOCKADDR_BTH 结构及 serviceClassId / port 语义
  https://learn.microsoft.com/en-us/windows/win32/api/ws2bth/ns-ws2bth-sockaddr_bth
- Microsoft Bluetooth Winsock 客户端示例
  https://github.com/microsoft/Windows-classic-samples/blob/main/Samples/Win7Samples/netds/winsock/bluetooth/bthcxn.cpp
- Bleak：BleakClient、start_notify、write_gatt_char
  https://bleak.readthedocs.io/en/stable/api/client.html
- Bleak：Windows WinRT backend
  https://bleak.readthedocs.io/en/stable/backends/windows.html
