# OPPO Headphone API

用于 OPPO Enco Free4 的非官方 Python 蓝牙配置 API，包含 Windows RFCOMM 连接、配置命令、命令行工具及协议分析文档。基于 HeyMelody / 欢律 17.6.5 APK 的静态分析实现，不是 OPPO 官方 SDK。

当前版本 **0.1.1**。支持 Python **3.11+**；首选连接方式为 Windows RFCOMM，使用 Python 标准库，无须安装串口驱动或创建 COM 口。BLE 为可选实现，尚未完成真机验证。

## 功能与验证范围

| 功能 | 实现 | 真机验证 |
|---|---|---|
| 连接、能力查询、功能状态读取 | Windows RFCOMM / SDP | 已在一副 Free4 上验证 |
| 游戏模式 | 读取、开关、等待状态生效后读回 | 已验证开启和关闭，并恢复原状态 |
| 降噪 / 通透 | 模式查询、设置、读回 | 待验证实际效果 |
| 设备双连 | 读取、开关、读回 | 待验证第二设备连接行为 |
| 音质音效 | 高音质、预设 / 自定义 EQ、空间类型 | 待验证实际效果与互斥规则 |
| 耳机操控 | 读取、修改现有手势映射 | 待验证实际手势 |
| 查找耳机 | 进入、退出、限时退出 | 待验证响铃行为 |

配置包含普通版 `068C10` 与丹拿版 `06C010`。型号配置与设备返回能力共同决定可用功能；两种型号、不同固件并未全部实测。游戏模式读回成功不代表已测得音频延迟改善；跨重连 / 断电保存仍待验证。

## 快速开始

```powershell
git clone git@github.com:Yuriel404/oppo-headphone-api.git
cd oppo-headphone-api/python
python -m enco_free4 --help
python -m enco_free4 profile
python -m unittest discover -s tests -v
```

先在 Windows 设置中配对耳机，保持唤醒。将下面的占位地址换为耳机的**经典蓝牙地址**，先读取快照：

```powershell
python -m enco_free4 --address AA:BB:CC:DD:EE:FF --output before.json snapshot
```

确认读取正常后，按需执行一个设置：

```powershell
python -m enco_free4 --address AA:BB:CC:DD:EE:FF set-feature game_mode on
python -m enco_free4 --address AA:BB:CC:DD:EE:FF set-feature game_mode off
```

每次设置只发送一次写入，收到成功响应后读回验证；功能开关默认允许 3 秒生效窗口。连接或读取超时可能意味着结果未知，应先重新读取状态。详细参数见 [API 参考](API参考.md)。

## 在自己的程序中使用

在仓库根目录创建环境并安装本地库：

```powershell
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install ./python
# 如需可选 BLE 通路：
.\.venv\Scripts\python.exe -m pip install './python[ble]'
```

下面示例读取状态；设置功能必须显式调用对应方法。

```python
import asyncio
from enco_free4 import HeadsetClient, WindowsRfcommTransport, load_profile

async def main():
    profile = load_profile("068C10")
    transport = WindowsRfcommTransport(
        "AA:BB:CC:DD:EE:FF", service_uuid=profile.service_uuid
    )
    async with HeadsetClient(transport, profile=profile) as headset:
        await headset.initialize()
        print(await headset.snapshot())

asyncio.run(main())
```

本项目的 API 是可导入的 Python 接口与本地蓝牙协议实现，没有部署 HTTP 服务。可在自己的应用中封装这些方法。

## 文件导航

| 路径 | 内容 |
|---|---|
| [配置流程与 API 方案](配置流程与API方案.md) | 连接、能力发现、配置、校验与验收流程 |
| [API 参考](API参考.md) | 方法、命令号、payload、响应及错误处理 |
| [python/](python/) | Python SDK、CLI、示例和离线测试 |
| [protocol.json](protocol.json) | 机器可读协议表 |
| [profiles/enco-free4.json](profiles/enco-free4.json) | 两个 Free4 型号配置 |
| [证据索引](证据索引.md) | 静态分析来源及结论边界 |
| [diagnostics/](diagnostics/) | 游戏模式验证结果与筛选后的通信记录 |
| [修复说明 0.1.1](修复说明-0.1.1.md) | 游戏模式成功响应后延迟生效的处理 |
| [validation.json](validation.json) | 历史验证记录及公开副本处理说明 |

2026-10-26 的真机记录仅覆盖 Windows RFCOMM、能力 / 功能状态读取及游戏模式开关。本次整理仓库未新增硬件测试。离线测试使用固定向量和模拟传输，不连接耳机。

## 来源与公开文件

APK SHA-256：`eacb314e092cfb6c2f075eee834498412255cadf184978f3dc16400f6e1dd5d4`。

仓库保留协议相关分析材料、来源定位和哈希，不包含 APK、REA 安装环境或完整反编译工程。公开证据副本已清理本机路径，设备地址示例使用占位值；诊断日志筛选规则见 [diagnostics/README.md](diagnostics/README.md)。Evidence ID 指向原始分析记录，公开副本哈希另行记录。

第三方反编译片段及型号资料用于协议说明，其权利归原权利人。本仓库暂未指定开源许可证。
