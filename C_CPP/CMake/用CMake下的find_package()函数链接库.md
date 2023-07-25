

[TOC]

## find_package()原理

关于find_package()函数的相关内容可参考：

[https://www.cnblogs.com/lidabo/p/16635249.html](https://www.cnblogs.com/lidabo/p/16635249.html)

Cmake 会在以下的路径中寻找<package>Config.cmake或Find<package>.cmake文件。找到后即可执行该文件并生成相关链接信息

```bash
<prefix>/(lib/<arch>|lib|share)/cmake/<name>*/          (U)
<prefix>/(lib/<arch>|lib|share)/<name>*/                (U)
<prefix>/(lib/<arch>|lib|share)/<name>*/(cmake|CMake)/  (U)
```

例如在我们的linux系统上用下面命令就能查看xxx.cmake文件

```bash
ls /usr/share/cmake-3.16/Modules
```

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230625153433.png width=70%/> </div>

find_package的工作模式：
- Module模式
find_package命令基础工作模式(Basic Signature)，也是默认工作模式。
- Config模式
find_package命令高级工作模式(Full Signature)。 只有在find_package()中指定CONFIG、NO_MODULE等关键字，或者Module模式查找失败后才会进入到Config模式。

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230625153501.png width=70%/> </div>

## 案例1：为项目添加库

**需求**：现有一个libadd库,我们希望别的项目可以通过find_package对它进行引用我们应该怎么办呢?

首先我们创建一个文件夹 **libadd**
在该文件夹下有两个文件：
libadd.cpp

```cpp
#include <iostream>
#include "libadd.h"

using namespace std;

void libadd(int a,int b){
    int res = a+b;
    cout<<a<<"+"<<b<<"="<<res<<endl;
}
```

libadd.h

```cpp
#ifndef _HEAD_H
#define _HEAD_H
// 加法
void libadd(int a, int b);
#endif
```

接下来需要得到一个库文件，输入下面的命令：

```bash
# 编译生成共享库，也可以在makefile中编译
g++ -c -fPIC libadd.cpp -o libadd.so
```

同时在该文件夹下新建 Makefile 文件，输入：

```bash
CC = g++
CFLAGS  := -Wall -O3 -std=c++11 

LIB = libadd.so # 目标文件名
INCLUDE = ./ # 头文件目录
HEADER = libadd.h # 头文件

all : install

# 2. 生成.o文件 

# 3. 生成动态库文件


# 4. 删除中间过程生成的文件 

# 5.安装文件
install:
    cp $(LIB) /home/nio/workspace/Gitspace/cmaketest/install
    cp $(HEADER) /home/nio/workspace/Gitspace/cmaketest/install
```

现在该文件夹(/home/nio/workspace/Gitspace/cmaketest/libadd)下有下面四个文件:

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230625160158.png width=70%/> </div>

接下来把头文件和库安装到一个自定义文件夹中，这边装在install里面

```bash
mkdir ../install

make install
```

不出意外的话，install里面会有头文件和库

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230625160435.png width=70%/> </div>

第一步工作完成了，也就是说libadd的库已经做好了，接下来在任意地方新建一个test文件夹，创建一个main.cpp用于调用libadd
main.cpp

```cpp
#include<iostream>
#include "libadd.h"

int main(){
    libadd(1,2);
}
```

再新建一个CMakeLists.txt 文件，我们要在生存可执行文件的同时链接到Add的库

CMakeLists.txt 

```bash
cmake_minimum_required(VERSION 3.0)
# 工程名
project(Test)

# 设置FindAdd.cmake文件的地址
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}")
add_executable(main main.cpp)
find_package(Add)
if(ADD_FOUND)
    target_include_directories(main PRIVATE ${ADD_INCLUDE_DIR})
    target_link_libraries(main ${ADD_LIBRARY})
else(ADD_FOUND)
    message(FATAL_ERROR "ADD library not found")
endif(ADD_FOUND)

```

再新建一个FindAdd.cmake文件，用于找到Add的库，需要把头文件和库的地址都给出

FindAdd.cmake

```bash
find_path(ADD_INCLUDE_DIR libadd.h /home/nio/workspace/Gitspace/cmaketest/install)
find_library(ADD_LIBRARY libadd.so /home/nio/workspace/Gitspace/cmaketest/install)

if (ADD_INCLUDE_DIR AND ADD_LIBRARY)
    set(ADD_FOUND TRUE)
endif (ADD_INCLUDE_DIR AND ADD_LIBRAR)
```

最后在当前文件夹中执行：

```bash
mkdir build
cd build

cmake ..
make
./main
```

最后输出结果