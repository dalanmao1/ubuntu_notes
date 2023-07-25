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