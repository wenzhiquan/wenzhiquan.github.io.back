---
layout:     post
title:      "Mac系统重装后必备"
date:        2016-08-05 13:00:00
copyright: true
categories:
    - Mac
tags:
    - Mac
    - Software
---

> “Mac系统常用软件，可以提升工作效率”

### 程序员必备

#### Homebrew

这个是最需要安装的软件，利用`homebrew`可以快速的安装和管理其他软件包，类似于`Fedora`系统中的`dnf`命令。

安装方法如下：

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

直接在命令行中输入上述命令即可快速安装`homebrew`了。

<!-- more -->

#### iTerm2

Mac自带的终端感觉不是特别方便，可以安装`iTerm2`，并调整出`HotKey Window`，就可以快速的开关命令行啦。

直接在[官网](http://www.iterm2.com/)下载安装包安装即可。常用配置方法如下：

![iterm hotkey](/uploads/in-post/Mac/iterm_hotkey.png)

开启`HotKey`，将打开的窗口选择为`Hotkey Window`。

![iterm setdefault](/uploads/in-post/Mac/iterm_setdefault.png)

将`Hotkey Window`设置为默认打开窗口。

![iterm window](/uploads/in-post/Mac/iterm_window.png)

勾选`Hide after opening`，这样打开`iTerm2`的时候默认窗口就会自动隐藏，不用每次都自己隐藏了。上面的红框调整的是窗口的透明度和模糊程度，根据自己的爱好调整即可。

#### vim

命令行必备文本编辑器，`brew install vim`安装。

#### git

相信有过多人协作开发经验的人对`git`一定不陌生，直接`brew install git`即可。

#### zsh

`bash`的功能感觉不够强大，个人觉得还是`zsh`更加好用一些。

打开命令行，输入命令：

```
brew install zsh
```

安装完成后，可以给刚刚安装的`zsh`安装主题，安装的前提是安装了`git`，命令如下：

```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

静候安装完成，然后编辑配置文件：

```
cd  // 切换到自己的根目录
vim .zshrc
```

将`ZSH_THEME`后面的变量改为自己喜欢的主题名称，地址在[zsh主题](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes )。

#### Dash

一个非常方便的可以查找`API`的软件，直接在[官网](https://kapeli.com/dash)下载安装即可，需要购买。

#### hexo

想要写托管到`github`的博客并且想马上看到效果，需要安装这款软件，具体安装方法请见我的博客：[迁移至Hexo博客](https://wenzhiquan.github.io/2018/05/04/2018-05-04-move-to-hexo-blog/)。

### 加快效率的软件

软件名称|推荐理由
--|--
`alfred`|可以视为加强版Spotlight，可以安装各种workflow，极大提升查找效率
`moom`|预置了几种窗口位置，是对mac自带的最大化的加强
`atom`|很好用的文本编辑器，界面美观，插件很多
`xmind`|跨平台的思维导图软件，导师力荐的软件
`远程桌面连接`|想用Mac控制Windows操作系统必需的软件
`Cyberduck`|大家都在用的ftp客户端，操作简单
`CleanMyMac`|Mac版的电脑管家
`lantern`|科学上网的利器
`keka`|小巧精致的解压缩软件，可以解压各种格式的压缩包
`chrome`|这个就不用多说了
`Karabiner`|感觉自己的快捷键不够用了吗？使用这款软件吧
`parallel desktop`|Mac上的最强虚拟机软件

### Mac截图小技巧

* 基础快捷键（`+`表示同时操作、`-`表示分步操作）

    + `Cmd+Shift+3`：全屏截图；截取整个屏幕，保存截图至桌面。
    + `Cmd+Shift+4`：区域截图；鼠标光标变成带坐标的小十字，通过拖拽截取特定区域，保存截图至桌面。
    + `Cmd+Shift+4 - 单击空格键 - 鼠标单击指定窗口`：窗口截图；出现小十字光标后对指定窗口按空格键，鼠标光标变成照相机，鼠标单击截取指定窗口，保存截图至桌面。

* 进阶快捷键

    + `Cmd+Shift+4 - 按住空格键拖动鼠标`：区域截图；选取区域范围后，按住空格键并拖到鼠标可移动选取范围，释放按键后保存截图至桌面文件夹。
    + `Cmd+Shift+4 - 按住Shift - 上下/左右移动鼠标`：区域截图；选取区域范围后，按住 Shift 并上下/左右移动鼠标即可固定选取范围宽度/高度改变高度/宽度，释放按键后保存截图至桌面文件夹。
    + `Cmd+Shift+4 - 按住Shift和Option`: 区域截图；选取区域范围后，按住 Shift 和 Option 键在上一快捷键功能的基础上自由切换高度宽度，释放按键后保存截图至桌面文件夹。
    + `Cmd+Shift+4 - 按住Option`: 区域截图；选取区域范围后，按住 Option 键可按比例缩放选取范围，释放按键后保存截图至桌面文件夹。

PS：以上介绍的快捷键配合按住`Control`键即可将截图文件保存在剪切板，以供调用。
