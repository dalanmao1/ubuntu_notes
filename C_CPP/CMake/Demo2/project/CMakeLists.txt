# 最小版本
cmake_minimum_required(VERSION 3.0)
# 工程名
project(Test VERSION 1.0)

# # 添加 math 子目录
add_subdirectory(math)

# 将所有相关文件都添加进来，用于编译
add_executable(myapp main.cpp)

# 添加库的搜索路径，PROJECT_SOURCE_DIR 是工程顶层目录
target_include_directories(myapp PUBLIC "${PROJECT_SOURCE_DIR}/math")

# 链接库
target_link_libraries (myapp mathlib)