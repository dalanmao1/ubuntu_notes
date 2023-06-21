# Github拉取老版本或releases稳定版本的仓库

[TOC]

## 拉取老版本

### 方法一：clone

随便进入一个仓库，查看分支信息

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230620140657.png width=70%/> </div>

针对要拉取的分支版本，输入下面的指令：

```shell
git clone -b 分支名 仓库地址
```

以dev为例：

```bash
git clone -b dev https://github.com/doctest/doctest.git 
```

进入到这个 doctest 目录里面，发现我们已经处于 dev 分支下了，说明已经把该分支拉下来了

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230620190904.png width=70%/> </div>

### 方法二：checkout

针对在本地已有远程仓库的项目，想要切换到其它分支，可以使用下面指令：

```bash
git checkout 分支名
```

接着上面的例子，现在处于 dev 分支，想要切换到 fix-608 分支，执行：

```bash
git checkout fix-608
```

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230620191830.png width=70%/> </div>

如果本地没有，可以用方法一，或者：

```bash
git clone https://github.com/doctest/doctest.git
git checkout fix-608
```

## 下载 releases 版本

开发有时候需要稳定的版本而不是正在开发的版本，releases 是发行的较为稳定的版本。如果下载的生活不希望带任何git的东西，可以把仓库的 zip 包下载下来。

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230620192254.png width=70%/> </div>

随便选择一个稳定版本

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230620192327.png width=70%/> </div>

下载解压即可

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230620192405.png width=70%/> </div>