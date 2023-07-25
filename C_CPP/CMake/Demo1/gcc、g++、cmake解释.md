# 一篇文章搞懂CMake （gcc、g++、cmake解释）

- [一篇文章搞懂CMake （gcc、g++、cmake解释）](#一篇文章搞懂cmake-gccgcmake解释)
  - [gcc](#gcc)
  - [g++](#g)
  - [cmake](#cmake)
    - [1. CMake 流程](#1-cmake-流程)
    - [如何使用cmake？](#如何使用cmake)
      - [简单的CMake.txt文件](#简单的cmaketxt文件)
  - [参考](#参考)

## gcc

gcc命令来自英文词组“GNU Compiler Collection”的缩写，其功能是用于C/C++语言编译器。原文链接：https://www.linuxcool.com/gcc

GCC 的编译流程包括以下几个阶段：

- 预处理（Preprocessing）：对源代码进行宏替换、头文件展开等操作，生成预处理文件（.i 文件）。
- 编译（Compilation）：将预处理文件转换为汇编代码（.s 文件）。
- 汇编（Assembly）：将汇编代码转换为目标文件（.o 文件）。
- 链接（Linking）：将目标文件与库文件等链接起来，生成可执行文件。

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230514151709.png width=100%/> </div>

下面是一个简单的示例，以 C 语言为例：

```c
#include <stdio.h>

int main() {
    printf("Hello, world!\n");
    return 0;
}
```

我们可以使用以下命令编译：

```shell
gcc hello.c -o hello
```

这个命令将进行以下几个步骤：

1. 预处理，还是c语言文件，但是对头文件（<stdio.h>）和宏会进行展开

```shell
gcc -E hello.c > hello.i # 和 gcc -E hello.c -o hello.i 效果是一样的
```

2. 编译，由c文件变成汇编文件

```shell
gcc -S hello.i -o hello.s
```

3. 汇编，生成目标文件，即二进制文件，但是此时的文件是没有链接的，不可以执行
  
```shell
gcc -c hello.s -o hello.o
```

4. 链接，生成可执行文件
  
```shell
gcc hello.o -o hello
```

运行该文件会输出 "Hello, world!"。

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230514145934.png width=80%/> </div>

## g++

gcc和g++是两个不同的编译器，gcc主要用于编译C语言代码，g++则主要用于编译**C++代码**。

虽然gcc也可以编译C++代码，但是使用g++更为方便。因为g++可以自动链接C++标准库，而gcc需要手动链接C++标准库。此外，g++还能够自动识别C++代码，并调用相应的编译器。

在使用g++编译C++代码时，需要使用“.cpp”作为文件扩展名。如果使用“.c”作为文件扩展名，g++会将代码识别为C语言代码进行编译，而不是C++代码。

参考： https://www.cnblogs.com/lulipro/p/6661763.html


编译流程和 gcc 是一样的，只需要把 gcc 换成 g++ 即可

- `-save-temps` 保留编译产生的中间文件，使用这个参数，就没必要将前面的参数 -E  -S  -c  一个一个地使用了

```shell
g++ -save-temps -o hello hello.cpp 
```

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230514161924.png width=70%/> </div>

- 优化器

```shell
g++ -O2 hello.cpp -o hello
```

-O0: 不进行优化，编译速度最快，但是生成的可执行文件执行速度最慢。
-O1: 开启一些简单的优化，会消耗更多的编译时间，但是可以稍微提高可执行文件的执行速度。
-O2: 开启更多的优化，可以提高可执行文件的执行速度，但是编译时间也会更长。
-O3: 开启大部分优化，可以极大地提高可执行文件的执行速度，但是编译时间也会非常长。
-Os: 优化可执行文件的大小，尽可能减小生成的可执行文件的体积。

一般用O2就够了,可以看到下面的这段代码，写的非常不合理，但是经过优化之后效率高了很多

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230514164026.png width=70%/> </div>

- -w
编译时，不显示任何警告消息。

- -Wall
编译时，显示所有出现的警告消息。

## cmake

CMake是一个跨平台的自动化构建系统，可以根据不同的平台、不同的编译器，生成相应的构建文件（如Makefile或Visual Studio项目文件等），以便进行编译、链接等操作。CMake通过**CMakeLists.txt** 文件来描述项目的构建过程，用户可以在这个文件中定义源代码、库、头文件、编译选项等信息，从而让CMake自动生成相应的构建文件。

**举个例子：** 比如说有一个项目需要跨平台，windows 下用 VS 编译，linux 下用 makefiles 或者 xcode 编译。如果这时候需要添加一个 bar.cpp 文件，一般做法就是每个IDE的项目文件中依次添加，但是如果工程太大，这种做法就很麻烦了，因此引入cmake就是为了方便，只需要把 bar.cpp 添加到 CMakeLists.txt 文件中即可。

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230514165017.png width=70%/> </div>

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230514165038.png width=70%/> </div>

### 1. CMake 流程

在 [gcc小节](#gcc) 中给出了程序生成可执行文件的流程，但是如果程序很多的时候，这种方式就显得太繁琐了。因此就需要用到 makefile，makefile 是一种能够自动化构建和编译项目的文本文件。简单来说只要存在 makefile文件， make 一下就能完成项目的编译工作。

但是夸平台的话，新的矛盾就会显现出来，makefile 通常依赖于当前的编译平台，而且编写 makefile 的工作量比较大，解决依赖关系时也容易出错。

因此 CMake 能够解决该问题，它能跟据不同的编译平台，**自动**生成 Makefile 文件，流程如下：

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230605155043.png width=70%/> </div>

### 如何使用cmake？

#### 简单的CMake.txt文件

CMake 最基本的步骤是以下三步：

```bash
# 最低 CMake 版本要求：指定项目所需的最低 CMake 版本
cmake_minimum_required(VERSION 3.12)

# 项目名称：使用 project() 命令设置项目的名称
project(MyProject)

# 将源文件添加到项目中
add_executable(myapp main.cpp)
```

**举个例子**

创建以下几个文件

add.c

```c
#include <stdio.h>
#include "head.h"

int add(int a, int b)
{
    return a+b;
}
```

div.c

```c
#include <stdio.h>
#include "head.h"

double divide(int a, int b)
{
    return (double)a/b;
}
```

head.h

```c
#ifndef _HEAD_H
#define _HEAD_H
// 加法
int add(int a, int b);
// 减法
int subtract(int a, int b);
// 乘法
int multiply(int a, int b);
// 除法
double divide(int a, int b);
#endif
```

main.c

```c
#include <stdio.h>
#include "head.h"

int main()
{
    int a = 20;
    int b = 12;
    printf("a = %d, b = %d\n", a, b);
    printf("a + b = %d\n", add(a, b));
    printf("a - b = %d\n", subtract(a, b));
    printf("a * b = %d\n", multiply(a, b));
    printf("a / b = %f\n", divide(a, b));
    return 0;
}
```

head.h

```c
#include <stdio.h>
#include "head.h"

int multiply(int a, int b)
{
    return a*b;
}
```

sub.c

```c
#include <stdio.h>
#include "head.h"

// 你好
int subtract(int a, int b)
{
    return a-b;
}
```

建立相关文件并保存

在同一目录下新建一个 CMakeLists.txt 文件
输入下面内容并保存：

```bash
# 最小版本
cmake_minimum_required(VERSION 3.0)
# 工程名
project(Test)
# 将所有相关文件都添加进来，用于编译
add_executable(myapp add.c div.c main.c mult.c sub.c)
```

文件结构如下：

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230605165239.png width=40%/> </div>

我们在当前文件下执行下面的操作：

1.建立一个文件夹，因为cmake之后会生成很多文件

```bash
mkdir bulid
```

2.进入到新建文件夹中

```bash
cd bulid
```

3.执行 cmake 生成 Makefile

```bash
cmake ..
```

cmake指令需要在和 CMakeLists.txt 文件同一个目录下执行，因此需要..

cmake之后我们发现在build文件夹下多了 Makefile 以及其他文件

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230605165902.png width=40%/> </div>

4.执行 make 指令生成可执行文件

```bash
make
```

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230605170902.png width=40%/> </div>

5.执行文件，测试是否编译成功

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230605171001.png width=70%/> </div>

至此一个简单的 cmake 编译过程就结束了。

## 参考

[1] https://subingwen.cn/cmake/CMake-primer/?highlight=cmake