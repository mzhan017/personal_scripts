# MTU overview

## MTU's confusion
下面是从Huawei的使用文档里摘抄的一段
> https://support.huawei.cn/hedex/hdx.do?docid=EDOC1100612071&id=ZH-CN_TOPIC_0000209949316711
>华为设备的MTU定义为三层MTU，不包含以太帧头长度。在华为设备和其他厂商互通场景下，需确认对端设备的MTU含义（部分厂商的MTU包含以太帧头）。若两端MTU定义不一致，实际转发帧长可能超出对端承载能力，导致大包丢弃或业务受损。例如，IS-IS邻接关系无法建立、OSPF/OSPFv3邻居立即重建或邻居下次重建后无法成功建立。