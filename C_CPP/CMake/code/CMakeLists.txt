# 最小版本
cmake_minimum_required(VERSION 3.0)
# 工程名
project(Test)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -00")

# add_subdirectory(doctest)

aux_source_directory(. DIR_SRCS)

# 将所有相关文件都添加进来，用于编译
add_executable(myapp ${DIR_SRCS})