# Linux 下 doctest 测试框架（C++）

[TOC]

## 简介

doctest是一个新的 **C++ 测试框架**，包括以下几个主要优点：

1. 简单快速：doctest本身非常轻巧，它的编译速度是最快的，使用也非常简单；
2. 无须依赖：doctest不依赖于其他库或工具，几乎任何C++项目都可以使用，且不需要安装依赖；
3. 单头文件：这也是第一条优点——简单，它不需要额外进行资源配置，引用一个头文件就够了；
4. 自动化测试发现：doctest能够自动发现并运行项目中的所有测试用例，无需手动指定或管理测试套件。这样可以节省时间和精力，并确保所有的测试用例都得到了执行。

![](https://github.com/doctest/doctest/raw/master/scripts/data/benchmarks/header.png)

## 在Linux中进行配置

doctest地址：[https://github.com/doctest/doctest](https://github.com/doctest/doctest)

1.克隆到本地

```shell
git clone https://github.com/doctest/doctest
```

2.编译安装

```bash
# 进入doctest目录下
cd doctest
# 创建一个文件夹用于存放cmake文件
mkdir build
# 进入该文件
cd build
# 编译
cmake ..
make
```

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230619132026.png width=100%/> </div>

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230619133629.png width=100%/> </div>