# Fakelt

github 地址：[https://github.com/eranpeer/FakeIt](https://github.com/eranpeer/FakeIt)

## 安装

```bash
# 拉代码
git clone https://github.com/eranpeer/FakeIt

# 安装
# <INSTALL_DIR> 是安装的路径
cmake -S . -B build -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
cmake --build build
cmake --install build
```

如果要使用 Fakelt，需要在工程文件中的 CMakeLists.txt 写入：

```bash
find_package(FakeIt REQUIRED)
[...]
target_link_libraries(<YOUR_TARGET> PRIVATE FakeIt::FakeIt-<CONFIG>)
```
