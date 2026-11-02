# 按键配置协议补充

样本为 example.apk，SHA-256 `eacb314e092cfb6c2f075eee834498412255cadf184978f3dc16400f6e1dd5d4`。以下为静态代码观察，未在 Enco Free4 联调。

## 普通配置和教程指令

`0x0401`（十进制1025）用于普通耳机操控设置。`com.oplus.melody.ui.component.control.a.y`、`LongPressVolumeViewModel.e`、`com.oplus.melody.app.discovery.i1.r` 均明确调用 repository.x0(...,1025)。证据 key-ui-set.json `ev_2f478a686bf9d2000fc1a15dc4bc411b29bc3736e6855dc7946227cb3ca6a3ae`，key-volume-set.json `ev_cdec1028c827f45b4af71b7f43381eb0d6e09f9aef1f94a29f477d967f64f8d3`。

`0x0416`（1046）在 `ControlGuideFragment$initView$3.invoke` 操作教学页加载时使用，从教程 controlPages 读取 earType/button/action/function 后调用x0(...,1046)。不能把它描述成新版普通按键配置协议。证据 key-guide-set.json `ev_a0972bce71fc712a0a5bdf7bef027ec7d6895e4ffc3faa012a2a87195601e46e`。

两者共享 `HeadsetCoreService.X0(int cmd,String address,ArrayList records)`。其payload为 `count:u8` 后跟 count 条4字节记录 `[deviceType:u8,button:u8,buttonAction:u8,function:u8]`。count必须大于0。设置后该方法自动查询命令264（0x0108）。证据 key-core-set.json `ev_0e79167baaba114d89bb36e6988a455b6986578bec84160792d913bcf63c1484`，key-copy-data.json `ev_522827275e296a4d68533d4d65db338e2e23fb42142cbb46c29f1be7933df036`。

读取键映射请保留设备返回的deviceType/button/buttonAction，只改function后用0401下发，随后0108读回，避免将云端UI action代码直接放到wire字段。`Q.d`会把UI action16..等重新映射为wire action1..；详见 key-action-map.json `ev_78f36ed57b4596e8a613290f763728fb6782f60f72f9019e21bb4041f13f1117`。

明确例子：`key-discovery-set.java` 将设备类型1和2、button1、action3设为function26，并记录sendTriplePinchTranslation。`key-volume-set.java` 长按调音量为button1/action4。普通页面还支持deviceType4聚合设置。建议没有实机验证前以读回记录为准，不生成不存在的组合。

## 功能字段枚举

`db.a.c` 通过UI资源名称转为wire function。`Z4.f.G`仅对名称精确等于 OnePlus Buds 或 OnePlus Buds Z返回true；OPPO Enco Free4走普通映射（上一首5、下一首6）。证据 key-function-map.json `ev_895557486d80215a8602735f79fe0006b3bf72d3e56ffee78f89e607b7af3222`，key-brand-gate.json `ev_515efc1668e01393724eb1861698e532812eaca217fc42b19c01913c83943b5a`。

| function | APK所映射的功能 |
|---:|---|
|0|无|
|1|播放/暂停|
|2|听音乐|
|3|语音助手|
|5|上一首（普通映射）|
|6|下一首（普通映射）|
|7|调节音量|
|8|切换降噪模式|
|9|播放收藏音乐|
|10|切歌|
|11|增大音量|
|12|减小音量|
|13|切换设备|
|17|游戏模式|
|18|Zen模式|
|22|收藏音乐|
|25|AI摘要|
|26|翻译应用|
|27|实时翻译|
|28|拒接电话|
|29|接听/挂断|
|32|melody_spy_tap_title对应功能|
|34|Gmn播放暂停停止|
|35|触发Gmn|

这张表只证明APK定义了这些数字。每型号、固件、手势的允许功能子集由能力及型号资源配置影响；不能据此断言Free4支持全部功能。对未验证值保留raw读取，不默认允许写入。
