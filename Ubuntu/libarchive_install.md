# libarchive 如何在Ubuntu中进行安装

libarchive是一个开源的压缩和归档库。 它支持实时访问多种压缩文件格式，比如7z、zip、cpio、pax、rar、cab、uuencode等，因此应用十分广泛。

举个例子，我写了一段代码，想要解压一个压缩包，那我就得 fork 一个 tar 进程，然后还得 fork 一个 bash 来运行这个 tar 命令，这样做一个是麻烦还有一个是不好判断什么时候解压结束，因此有了 libarchive 就可以在代码中实现该功能，不需要额外添加进程。

## 下载安装

1.下载

下载地址：[https://github.com/libarchive/libarchive](https://github.com/libarchive/libarchive)

先克隆到本地仓库

```shell
git clone https://github.com/libarchive/libarchive
```

2.打开 libarchive 文件下的 INSTALL，得到具体安装的方法

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230603132646.png width=70%/> </div>

但是一开始文件夹里面是没有 configure 文件的，因此需要下载一些工具

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230603133405.png width=50%/> </div>

3.下载 autotools 和 automake

上面的工具用来产生configure文件,能设置源程序来适应各种不同的操作系统平台,并且根据不同的系统来产生合适的Makefile

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230603132756.png width=70%/> </div>

```shell
sudo apt-get install autotools-dev

sudo apt install libtool

sudo apt-get install automake
```

安装完毕之后运行 ./autogen.sh  

> autoconf 版本太低问题

我原来的autoconf版本只有2.69，然后编译需要的是2.71以上的版本，因此需要去官网重新下载一个。**如果没有可自行跳过**

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230603133708.png width=70%/> </div>

需要登录这个网站：[http://ftp.gnu.org/gnu/autoconf/](http://ftp.gnu.org/gnu/autoconf/)

下载最新版本（2.71）的 autoconf

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230603133903.png width=70%/> </div>

卸载原来的 autoconf

```shell
sudo apt remove autoconf
```

然后对最新版本的 autoconf 进行解压并安装

```shell
tar -zxvf autoconf-2.71.tar.gz

cd autoconf-2.71/

./configure

make

make install # 不行就 sudo make install
```

输入 `autoconf --version` 查看安装情况

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230603135233.png width=70%/> </div>

重新下载 automake

```shell
sudo apt-get install automake
```

4.安装libarchive
再次运行autogen.sh后发现libarchive下面已经有configure这个文件了

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230603140128.png width=70%/> </div>

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230603140141.png width=70%/> </div>

然后我们依次输入下面命令进行安装：

```shell
./configure 

make

make install # 不行就 sudo make install
```

### 方式二 cmake

同时我们也可以用cmake的方式进行安装

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230603154001.png width=70%/> </div>

```shell
# 定位到 libarchive 目录下
cd libarchive 

cmake ./

```

发现一堆依赖没有

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230603155842.png width=100%/> </div>

根据cmake的提示，依次安装需要的依赖（不同电脑可能缺少的依赖不同，因此要根据自己的缺来安装）

```bash
sudo apt-get install libbz2-dev 
sudo apt-get install liblzma-dev
sudo apt-get install libb2-dev
sudo apt-get install zstd 
sudo apt-get install libzstd-dev 
sudo apt-get install libssl-dev
sudo apt-get install libxml2-dev 
sudo apt-get install liblz4-dev
```

下载完之后再次进行 cmake，查看是否还有报错

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230603161819.png width=70%/> </div>

接着继续安装：

```bash
make

make install # 出现权限问题就 sudo make install
```
