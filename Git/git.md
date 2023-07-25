#

- [](#)
  - [安装 Git](#安装-git)
  - [第一次运行 Git](#第一次运行-git)
    - [1. 配置用户信息](#1-配置用户信息)
    - [2. 设置默认编辑器](#2-设置默认编辑器)
  - [Git 基础操作\*](#git-基础操作)
    - [1.提交到本地仓库](#1提交到本地仓库)
    - [2.克隆现有的仓库](#2克隆现有的仓库)
    - [3.文件状态](#3文件状态)
  - [ssh](#ssh)
  - [参考文献](#参考文献)

![](https://images0.cnblogs.com/blog2015/547153/201507/291414318921370.png)

## 安装 Git

Ubuntu 安装指令：

```shell
sudo apt install git-all
```

Ubuntu 中的git配置文件默认存储在用户主目录下的.gitconfig文件中

通过该命令可查看：

```shell
git config --list  --show-origin 
```

## 第一次运行 Git

### 1. 配置用户信息

```shell
git config --global user.name "baineng.shou"
git config --global user.email baineng.shou@nio.com
```

### 2. 设置默认编辑器

如果你想使用不同的文本编辑器，例如 Emacs，可以这样做：
```shell
git config --global core.editor emacs
```

## Git 基础操作*

### 1.提交到本地仓库

新建一个文件夹用于存储项目文件，然后进入到该文件夹中进行初始化配置

```shell
cd ~/workspace/gittest/
```

之后**执行下面的指令初始化本地仓库**，可以说进行所有git操作之前都是需要做这步的

```shell
git init
```

之后会发现该文件夹下会有一个 .git 文件，随后新建一个文件，进行 add 操作
这步的意思是**让本地仓库知道该文件的存在**，执行后本地仓库就会对该文件进行跟踪

```shell
touch README.md
git add README.md
```

执行 commit 操作，正式将文件提交到本地仓库，提交之后才能和远程仓库进行同步

```shell
git commit -m README.md 
```

### 2.克隆现有的仓库

很多时候，我们都是在已有的项目上进行开发，所以需要从远程的项目仓库中把项目拉取下来，存放在本地然后进行开发，新建一个文件夹，输入下面的指令：

```shell
git init
git clone https://github.com/xxxx
```

clone 后面是远程仓库地址，如果想在克隆的时候自定义仓库的名字，可以使用下面的命令：

```shell
git clone https://github.com/xxxx mylib
```

这是使用 http 协议，同时可以用 ssh 进行传输，但是后者相对麻烦些，在[](#1) 章节会进行讲解

### 3.文件状态

git对于空间的理解非常重要，主要分为 **workspace（本地计算机）、index（暂存区）、local repository（本地仓库）和 remote repository（远程仓库）**
前三者都是在本地计算机上的，第一个是你能看得见的，其余两者是需要通过命令才可以知道，最后一个是在远程服务器上，比如创建在github上的仓库。它们之间的关系可以表示为：

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230516101323.png width=100%/> </div>

关于文件的状态，结合上面来理解，**文件处在不同的空间就会有不同的状态**

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230516093832.png width=100%/> </div>

## ssh

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230516170735.png width=70%/> </div>

已知密钥文件

```shell
cat ~/.ssh/known_hosts
```

## 参考文献

[1] [《Pro Git》](https://git-scm.com/book/zh/v2)

[2] [Git流程详解](http://cycle263.github.io/blogs/team/git/advanced.html)