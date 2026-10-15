# MTU overview
MTU这个topic是最复杂的一个概念。原因是每个厂家锁实现的机制，支持的MTU的大小可能都不一样。
后续的SDN的出现，GRE tunnel，IPsec，等让这个MTU的设置逻辑变的异常复杂。
这里收录一些关于MTU的参考信息。
## MTU每个厂家所定义的MTU还不太一样？
下面是从Huawei的使用文档里摘抄的一段
> https://support.huawei.cn/hedex/hdx.do?docid=EDOC1100612071&id=ZH-CN_TOPIC_0000209949316711
>华为设备的MTU定义为三层MTU，不包含以太帧头长度。在华为设备和其他厂商互通场景下，需确认对端设备的MTU含义（部分厂商的MTU包含以太帧头）。若两端MTU定义不一致，实际转发帧长可能超出对端承载能力，导致大包丢弃或业务受损。例如，IS-IS邻接关系无法建立、OSPF/OSPFv3邻居立即重建或邻居下次重建后无法成功建立。

## Huawei网络设备MTU详细的计算公式
需要大家点进去详细看一下
https://support.huawei.cn/hedex/hdx.do?docid=EDOC1100612071&id=ZH-CN_TASK_0000001130781986
>在本设备上，MTU是三层的定义。如图2所示，MTU表示IP报文头与IP载荷的最大长度。如果一个以太接口的MTU设置为1500Bytes，那么IP报文头与IP载荷小于1500Bytes的报文将不会被分片发出。