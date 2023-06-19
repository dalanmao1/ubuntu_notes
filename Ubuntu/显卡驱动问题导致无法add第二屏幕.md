# Ububtu20.04 无法显示第二个屏幕（显卡驱动问题）

[Ububtu20.04 无法显示第二个屏幕（显卡驱动问题）](#ububtu2004-无法显示第二个屏幕显卡驱动问题)
- [Ububtu20.04 无法显示第二个屏幕（显卡驱动问题）](#ububtu2004-无法显示第二个屏幕显卡驱动问题)
  - [1. 问题描述](#1-问题描述)
  - [2. 解决方案](#2-解决方案)


## 1. 问题描述

一开始我的ububtu是可以连接上外屏的，后来更新了软件重启之后，屏幕连接上一直闪烁，怀疑是显卡驱动的问题
，更新了显卡驱动，直接识别不到HDMI和VGA。

这是我的显卡安装情况，下面的几种基本上都试过了，无一例外，都是无法连上屏幕。

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230507113651.png width=100%/> </div>

在设置里面是无法识别到第二个显示器的

<div align=center><img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230507105806.png width=50%/></div>

命令行也是一样

<div align=center><img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230507105708.png width=80%/></div>

## 2. 解决方案

首先可以确定是显卡的问题，接下来就是挨个查找。

在启动 NVIDIA 驱动程序的时候报错，

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230507115008.png width=70%/> </div>

执行这条指令:

```shell
sudo ubuntu-drivers autoinstall
```

它的作用是自动安装可用的推荐或建议的驱动程序。
这边要说明一下，命令和ububtu software&update -> Additional Drivers的作用是一样的，都是安装驱动，前者是直接选择最适合的安装，后者是有很多种选择。这边推荐用命令行装，因为我用后者一直装不上。

**一定要重启！！！** 否则会报错：

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230507142417.png width=70%/> </div>

重启之后就可以看到显卡信息、外接设备信息

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230507145207.png width=70%/> </div>

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230507145302.png width=70%/> </div>

针对屏幕闪烁问题，可以提高刷新频率来解决

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230507144357.png width=60%/> </div>