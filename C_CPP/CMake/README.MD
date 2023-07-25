# CMake 笔记

[TOC]

## 基础项目

实现一个CMakeLists.txt最简单是以下三步：

```bash
# 最低 CMake 版本要求：指定项目所需的最低 CMake 版本
cmake_minimum_required(VERSION 3.12)

# 项目名称：使用 project() 命令设置项目的名称
project(MyProject)

# 将源文件添加到项目中
add_executable(myapp main.cpp)
```

**以后接触到的CMakeLists.txt内容都是基于这三步进行扩展和延伸**
问题来了，如果我们只有一个源文件，用这三步当然可以，但是，如果我们有100个呢？这种方式显然不适用了。

> aux_source_directory

该命令会查找指定目录下的所有源文件，然后将结果存进指定变量名。

```bash
aux_source_directory(<dir> <variable>)
```

- dir：指定目录
- variable：变量


因此，可以修改 CMakeLists.txt 如下：

```bash
# 最低 CMake 版本要求：指定项目所需的最低 CMake 版本
cmake_minimum_required(VERSION 3.12)

# 项目名称：使用 project() 命令设置项目的名称
project(MyProject)

# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

# 将源文件添加到项目中
add_executable(myapp ${DIR_SRCS})
```

## 多个目录创建项目

### 链接库

上述过程都是建立在**一个目录下**的，实际的项目往往包含几十个甚至上百个目录，因此我们需要添加需要编译的子目录。

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230706111630.png width=50%/> </div>

#### 用到的指令

```bash
# 于添加子目录的命令，用于将其他 CMakeLists.txt 文件所在的子目录添加到当前项目中
add_subdirectory(<directory> [binary_dir] [EXCLUDE_FROM_ALL])
# - directory：子目录的路径，可以是相对路径或绝对路径
# - binary_dir：放置输出文件的目录，若未指定，输出到 source_dir 指定的目录下
# - EXCLUDE_FROM_ALL：只在生成的输出目录中开始构建
```

```bash
# 用于创建库（静态库或共享库）的命令
add_library(<name> [STATIC | SHARED | MODULE] [EXCLUDE_FROM_ALL]
            [source1] [source2 ...])
# - name：要创建的库的名称。
# - 库的类型：（STATIC，SHARED 或 MODULE），默认创建一个静态库
# - EXCLUDE_FROM_ALL 是一个可选标志，表示将库排除在构建系统的 "all" 目标之外，即不会随默认构建一起构建
# - [source1] [source2 ...] 是库的源文件列表。可以将源文件逐个列出，也可以使用变量、通配符等方法指定源文件
```

```bash
# 用于为目标添加包含目录的命令，它指定了目标（可执行文件、库等）的头文件搜索路径
target_include_directories(target_name [SYSTEM] [BEFORE]
                           <INTERFACE|PUBLIC|PRIVATE> [directory1] [directory2 ...])
# - target_name：目标的名称，通过 add_executable 或 add_library 命令定义的名称
# - directoryx：添加的目录列表，可以指定一个或多个目录
# - <INTERFACE|PUBLIC|PRIVATE> 是一个可选标记，用于指定目录的可见性范围。这些标记之间的区别如下：
#   - INTERFACE 表示指定目录为接口依赖项，并适用于目标的使用者。
#   - PUBLIC 表示指定目录为公共依赖项，并适用于目标的使用者和目标本身。
#   - PRIVATE 表示指定目录仅适用于目标本身。
```

```bash
# 为目标添加链接库的命令。它用于将库与可执行文件或其他库进行链接
target_link_libraries(target_name [PRIVATE|PUBLIC|INTERFACE] library1 library2 ...)
```

#### 实验

首先，在math文件夹中创建一个 CMakeLists.txt 文件，写入

```cmake
# 查找当前目录下的所有源文件，保存到 DIR_LIB_SRCS 变量
aux_source_directory(. DIR_LIB_SRCS)

# 生成链接库
add_library (mathlib ${DIR_LIB_SRCS})
```

其次，回到项目目录下，在 CMakeLists.txt 文件写入

```cmake
# 最小版本
cmake_minimum_required(VERSION 3.0)
# 工程名
project(Test VERSION 1.0)

# # 添加 math 子目录
add_subdirectory(math)

# 将所有相关文件都添加进来，用于编译
add_executable(myapp main.cpp)

# 为目标添加包含目录的命令
# 添加库的搜索路径，PROJECT_SOURCE_DIR 是工程顶层目录
target_include_directories(myapp PUBLIC "${PROJECT_SOURCE_DIR}/math")

# 链接库
target_link_libraries (myapp mathlib)
```

源码见[Demo2](C_CPP/CMake/Demo2)

### 使用自定义库

CMake 允许为项目增加编译选项，从而可以根据用户的环境和需求选择最合适的编译方案。例如，可以将 mathlib 库设为一个可选的库。

#### 用到的指令

```bash
option(<option_name> <option_description> [default_value])
# <option_name> 是选项的名称，可以是任意合法的标识符。
# <option_description> 是对选项的描述，将在配置过程中显示给用户（随便写）
# [default_value] 是一个可选参数，用于指定选项的默认值。如果未提供默认值，则默认为 OFF
# 示例：option(ENABLE_FEATURE "Enable some feature" ON)
```

```bash
# 添加头文件搜索路径，以便编译器可以找到所需的头文件
include_directories([AFTER|BEFORE] [SYSTEM] directory1 [directory2 ...])
# AFTER 或 BEFORE 是可选标记，用于指定添加目录的位置，是在已有目录之后还是之前，默认是 AFTER。
# SYSTEM 是可选标记，用于标记目录为系统目录，以区分于用户目录。某些编译器可能会有不同的处理方式。
# directory1 [directory2 ...] 是一个或多个目录路径，用于添加到包含目录中。
# 示例：include_directories(include)
```

与 target_include_directories 区别在于后者是已经得到可执行目标文件

#### 实验

基于 [Demo2](C_CPP/CMake/Demo2) 只修改项目根目录下的 CMakeLists.txt 文件

```bash
# 最小版本
cmake_minimum_required(VERSION 3.0)
# 工程名
project(Test VERSION 1.0)

# 加入一个配置头文件，用于处理 CMake 对源码的设置
configure_file (
  "${PROJECT_SOURCE_DIR}/config.h.in"
  "${PROJECT_SOURCE_DIR}/config.h"
  )

# 是否使用自己的库
option(USE_MYLIB "Use my math implementation" ON)
if(USE_MYLIB)
    include_directories("${PROJECT_SOURCE_DIR}/math")
    # 添加 math 子目录
    add_subdirectory(math)
    # 这将把变量 EXTRA_LIBS 的当前值与 mathlib 连接起来，并将结果赋值给 EXTRA_LIBS 变量。新值将包含原始值和新添加的值
    set(EXTRA_LIBS ${EXTRA_LIBS} mathlib)
endif(USE_MYLIB)

# 将所有相关文件都添加进来，用于编译
add_executable(myapp main.cpp)

# 添加库的搜索路径，PROJECT_SOURCE_DIR 是工程顶层目录
target_include_directories(myapp PUBLIC "${PROJECT_SOURCE_DIR}/math")

# 链接库
target_link_libraries (myapp ${EXTRA_LIBS})
```

main.cpp

```cpp
#include <cstdlib>
#include <iostream>
#include "config.h"
using namespace std;


#ifdef USE_MYLIB
  #include "head.h"
#else
  #include <math.h>
#endif

int main(int argc, char const *argv[]) {
  int a = 20;
  int b = 12;
  printf("a = %d, b = %d\n", a, b);
  printf("a + b = %d\n", add(a, b));
  printf("a - b = %d\n", subtract(a, b));
  printf("a / b = %f\n", divide(a, b));
  printf("a * b = %d\n", multiply(a, b));
  printf("a / b = %f\n", divide(a, b));

  #ifdef USE_MYLIB
  cout<<"use my lib"<<endl;
  #else
  cout<<"don't use my lib"<<endl;
  #endif
  return 0;
}
```

执行后会自动生成一个 config.h 文件，如果 `option(USE_MYLIB "Use my math implementation" ON)`就会用自己的库，如果`option(USE_MYLIB "Use my math implementation" OFF)`就会调用 math.h















> set

```bash
# SET 指令的语法是：
# [] 中的参数为可选项, 如不需要可以不写
SET(VAR [VALUE] [CACHE TYPE DOCSTRING [FORCE]])
```

> find_package

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230621151341.png width=70%/> </div>




## 指定 C++ 标准

```shell
#最小版本
cmake_minimum_required(VERSION 3.0)
#工程名
project(Test)

#这两个命令通常一起使用，以确保编译器使用所需的 C++ 标准进行编译。
set(CMAKE_CXX_STANDARD 11)#设置要使用的 C++ 标准为 C++11
set(CMAKE_CXX_STANDARD_REQUIRED True)#表示要求编译器使用指定的 C++ 标准

#add_subdirectory(doctest)

aux_source_directory(. DIR_SRCS)

#将所有相关文件都添加进来，用于编译
add_executable(myapp ${DIR_SRCS})
```

## CMake常见变量名

[CMake常用变量和指令](https://blog.csdn.net/dcrmg/article/details/103930432)