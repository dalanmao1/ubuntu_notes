# Ubuntu——基于VSCode下的SSH远程开发（Remote-SSH插件）

[TOC]

## 简介

日常开发中，由于代码工程十分庞大，我们常常会把代码程序部署在远程服务器上，在本地通过远程连接到服务器，如此即使本地没有代码也能进行开发工作。

SSH远程开发的整体架构如下：

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230612104904.png width=70%/> </div>

安装Remote-SSH插件，只需要通过Visual Studio Code连接到远程机器，安装必要的插件（如Python插件），就可以使用Visual Studio Code所有的强大功能，如IntelliSense、代码跳转和调试，就像在本地开发一样。

## 配置过程

1. 安装插件

    <div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230612105548.png width=40%/> </div>

2. 点击远程开发按钮，得到与Remote-SSH插件相关的命令
    <div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230612105813.png width=40%/> </div>

    <div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230612105853.png width=70%/> </div>

3. 配置config文件，直接从远程复制过来，或者自己写

    <div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230612113107.png width=70%/> </div>

4. 
<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230612112002.png width=70%/> </div>

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230612113024.png width=70%/> </div>

