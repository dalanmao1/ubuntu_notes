# Ubuntu高效工具——autojump、terminator(快捷键失灵问题)、解压神器unar

- [Ubuntu高效工具——autojump、terminator(快捷键失灵问题)、解压神器unar](#ubuntu高效工具autojumpterminator快捷键失灵问题解压神器unar)
  - [自动快速跳转工具 autojump](#自动快速跳转工具-autojump)
  - [终端高效工具 terminator](#终端高效工具-terminator)
  - [解压神器 unar](#解压神器-unar)
  - [Oh-my-zsh](#oh-my-zsh)


## 自动快速跳转工具 autojump

**安装指令：**

```bash
sudo apt -y install autojump 
```

安装完成后是不会自动生效的，需要我们输入这个命令：`source /usr/share/autojump/autojump.sh on startup`生效，但这样不是永久的，所以永久生效可以使用：

```bash
echo '. /usr/share/autojump/autojump.sh'>>~/.bashrc
```

然后输入 `source ~/.bashrc` 或者 重启终端生效

**使用方式：**

`j xxx` 实现快速到达想去的目录，xxx是目录的一部分

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230511101448.png width=50%/> </div>

## 终端高效工具 terminator

**安装指令：**

```bash
sudo apt-get -y install terminator
```

**使用方式：**

- 垂直分屏：`Ctrl+Shift+E`
- 水平分屏: `Ctrl+Shift+O`
- 关闭窗口: `Ctrl+Shift+W`
- 多终端同步输入: `win+G`
- 关闭多终端同步输入: `win+shift+G`
- 放大/缩小单个窗口: `win+shift+X`
- 调整窗口大小:`ctrl+shift+方向键`
- 搜索: `ctrl+shift+F`

**使用方式：**

输入命令：

```shell
gedit ~/.config/terminator/config
```

将里面的内容全部替换为下面的代码（有些偏好可以自己设计）

```shell
[global_config]
  title_transmit_bg_color = "#d30102"
  focus = system
  suppress_multiple_term_dialog = True
[keybindings]
[profiles]
  [[default]]
    palette = "#2d2d2d:#f2777a:#99cc99:#ffcc66:#6699cc:#cc99cc:#66cccc:#d3d0c8:#747369:#f2777a:#99cc99:#ffcc66:#6699cc:#cc99cc:#66cccc:#f2f0ec"
    background_color = "#2D2D2D" # 背景颜色
    background_image = None   
    background_darkness = 0.85 
    cursor_color = "#2D2D2D" # 光标颜色
    cursor_blink = True # 光标是否闪烁
    foreground_color = "#EEE9E9" # 文字的颜色
    use_system_font = False # 是否启用系统字体
    font = Ubuntu Mono 13  # 字体设置，后面的数字表示字体大小
    copy_on_selection = True # 选择文本时同时将数据拷贝到剪切板中
    show_titlebar = False # 不显示标e题栏，也就是 terminator 中那个默认的红色的标题栏
[layouts]
  [[default]]
    [[[child1]]]
      type = Terminal
      parent = window0
      profile = default
    [[[window0]]]
      type = Window
      parent = ""
[plugins]
```

**快捷键失灵的问题**

> 分屏键失灵

和 ibus 冲突
输入下面的指令调出ibus

```shell
ibus-setup
```

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230510185533.png width=70%/> </div>

> 关闭窗口键失灵

如果下载了飞书，点击我的头像->设置->快捷键，将显示/隐藏飞书快捷键变成空白

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230510185805.png width=50%/> </div>

> 搜索键 ctrl+shift+f 失灵

这个目前还没找到原因，不过可以在对 terminator 进行设置
右键->preferences -> Keybindings -> 重新定义搜索的快捷键

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230510191547.png width=80%/> </div>

接下来重新打开一个终端，输入 ctrl+alt+f 就可以看到搜索框了，这个功能还是很有用的，特别是在找历史命令的时候

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230510192505.png width=80%/> </div>

## 解压神器 unar

unar 几乎可以解压所有的安装包，因此就不需要用 tar ，uzip

```shell
sudo apt-get install unar
```

## Oh-my-zsh

玩shell强烈建议用 zsh 取代原本的bash作为自己的终端，前者优点很多，比如：更丰富的命令提示，更鲜明的演示标记，更强大的插件支持

首先在系统上查询是否安装了 zsh

```bash
cat /etc/shells
```

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230606142355.png width=40%/> </div>

如果没有，用下面的指令安装：

```bash
sudo apt install zsh
```

github 脚本安装

```bash
#github sh脚本安装
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

手动安装

```bash
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

#创建zsh配置文件
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```

配置主题

```bash
vim ~/.zshrc 
```

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230606151137.png width=70%/> </div>

主题样式可参考这个网站：[https://github.com/ohmyzsh/ohmyzsh/wiki/Themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)

<div align=center> <img src=https://mubaicppnio.oss-cn-shanghai.aliyuncs.com/20230606152748.png width=70%/> </div>