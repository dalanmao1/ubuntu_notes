# 最小版本
cmake_minimum_required(VERSION 3.0)
# 工程名
project(Test VERSION 1.0)

set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

#这两个命令通常一起使用，以确保编译器使用所需的 C++ 标准进行编译。
set(CMAKE_CXX_STANDARD 11)#设置要使用的 C++ 标准为 C++11
set(CMAKE_CXX_STANDARD_REQUIRED True)#表示要求编译器使用指定的 C++ 标准


configure_file(TutorialConfig.h.in TutorialConfig.h)
aux_source_directory(. DIR_SRCS)

# 将所有相关文件都添加进来，用于编译
add_executable(myapp ${DIR_SRCS})