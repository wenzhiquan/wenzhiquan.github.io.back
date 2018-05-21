---
layout:     post
title:      "Mac OS Yosemite 配置sublime text C语言开发环境"
date:       2015-05-04 12:00:00
copyright: true
categories:
    - Mac
tags:
    - Sublime
    - C
---

> “Sublime Text是一个轻便的文本编辑器”

### 概述

[Sublime Text](http://www.sublimetext.com/3 "sublime text 3") 是一个代码编辑器，也是HTML和散文先进的文本编辑器。它是由程序员Jon Skinner于2008年1月份所开发出来，它最初被设计为一个具有丰富扩展功能的[Vim](http://www.vim.org/download.php "Vim")。
[Sublime Text](http://www.sublimetext.com/3 "sublime text 3")具有漂亮的用户界面和强大的功能，例如代码缩略图，代码段等。还可自定义键绑定，菜单和工具栏。它的主要功能包括：拼写检查，书签，Goto 功能，即时项目切换，多选择，多窗口等等。它是一个跨平台的编辑器，同时支持Windows、Linux、Mac OS X等操作系统。它还具有大量的可扩展插件，极大地丰富了这款编辑器的功能。

<!-- more -->

### 安装配置sublime text

#### 安装sublime text 3

首先可以前往[Sublime Text官方网站](http://www.sublimetext.com/3 "sublime text 3")下载对应平台的软件，安装完成后即可使用。但是为了更好地使用这一款强大的软件，我们可以安装一些插件。

这款软件是永久免费的，但是免费版会时不时的弹出购买提示，下面提供一个注册码，可以直接注册这个软件：

```
—– BEGIN LICENSE —–
Andrew Weber
Single User License
EA7E-855605
813A03DD 5E4AD9E6 6C0EEB94 BC99798F
942194A6 02396E98 E62C9979 4BB979FE
91424C9D A45400BF F6747D88 2FB88078
90F5CC94 1CDC92DC 8457107A F151657B
1D22E383 A997F016 42397640 33F41CFC
E1D0AE85 A0BBD039 0E9C8D55 E1B89D5D
5CDB7036 E56DE1C0 EFCC0840 650CD3A6
B98FC99C 8FAC73EE D2B95564 DF450523
—— END LICENSE ——
```

#### 安装sublime text 3 插件

*Package Control组件：*

* 按control+`(键盘上1左边的按钮)调出console控制台

* 粘贴以下代码到底部命令行并回车：

```
import urllib.request,os; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); open(os.path.join(ipp, pf), 'wb').write(urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ','%20')).read())
```

* 重启Sublime Text 3

* 如果在Perferences->package settings中看到package control这一项，则安装成功

下面是sublime text 2 的安装命令：

```
import urllib2,os; pf='Package Control.sublime-package'; ipp = sublime.installed_packages_path(); os.makedirs( ipp ) if not os.path.exists(ipp) else None; urllib2.install_opener( urllib2.build_opener( urllib2.ProxyHandler( ))); open( os.path.join( ipp, pf), 'wb' ).write( urllib2.urlopen( 'http://sublime.wbond.net/' +pf.replace( ' ','%20' )).read()); print( 'Please restart Sublime Text to finish installation')
```

> 用Package Control安装插件的方法：

* 按下Ctrl+Shift+P调出命令面板

* 输入pcic 调出 Install Package 选项并回车，然后在列表中选中要安装的插件

*较为常用的一些插件*

1. `ConvertToUTF8`　　支持 GBK, BIG5, EUC-KR, EUC-JP, Shift_JIS 等编码的插件

2. `Bracket Highlighter`　　用于匹配括号，引号和html标签。对于很长的代码很有用。安装好之后，不需要设置插件会自动生效

3. `DocBlockr`　　DocBlockr可以自动生成PHPDoc风格的注释。它支持的语言有Javascript, PHP, ActionScript, CoffeeScript, Java, Objective C, C, C++

4. `Emmet(Zen Coding)`　　快速生成HTML代码段的插件，强大到无与伦比，不知道的请自行google

5. `SideBar Enhancements`　　这个插件改进了侧边栏，增加了许多功能

6. `SideBar Folders`　　增加了侧边栏对于文件夹的支持

7. `SublimeCodeIntel`	提供了代码提示和自动补全功能

sublime text 还具有很多插件，读者可以根据自己所使用的语言和需要进行相应的安装

*配置sublime text主题*

Sublime Text本身对于主题的扩展也是十分的强大，一些推荐的主题可以前往[design beep网站](http://designbeep.com/2014/06/10/35-cool-sublime-text-themes/)进行选择和安装

下面介绍一下我安装的主题和相应的配置文件：

在package control中分别输入`numix`和`itg.flat`进行主题的安装，然后安装插件`markdown extend`增加对markdown语法的支持，然后编辑`Settings-User`，加入以下内容：

```
{
	"color_scheme": "Packages/Theme - itg.flat/itg.dark.tmTheme",
	"numix_sidebar_tree_medium": true,
	"numix_small_tabs": true,
	"theme": "Numix.sublime-theme"
}

```

效果如下：

![numix主题](/uploads/in-post/sublime_theme.png)

### 安装gcc

安装完sublime text后，编辑C语言的文本编辑器就已经配置好了，但是想要编译C文件，则需要安装[gcc](http://gcc.gnu.org/ "gcc官方网站")，在Mac OS中，直接使用`brew`命令进行安装即可，安装命令如下：

```
brew install gcc
```

等待安装完成

输入命令`gcc -v`验证是否安装成功，如果安装成功，应该有以下提示：

```
Configured with: --prefix=/Library/Developer/CommandLineTools/usr --with-gxx-include-dir=/usr/include/c++/4.2.1
Apple LLVM version 6.1.0 (clang-602.0.49) (based on LLVM 3.6.0svn)
Target: x86_64-apple-darwin14.3.0
Thread model: posix
```

### 配置sublime text的C语言编译系统

经过前面的步骤，就可以分别进行C语言的编辑和编译，但是为了方便，只需要简单地配置就可以直接用sublime text进行编译了

打开Tools->Build System->New Build System，在新建的文件中输入以下内容：

```
{
    "cmd" : ["gcc -o ${file_base_name} $file_name"],
    "shell" : true,
    "working_dir" : "$file_path",
    "selector": "source.c",
    "encoding":"utf-8",
    "variants" :
    [{
        "name" : "Run",
        "cmd" : "./${file_base_name}"
    }]
}
```

使用control+B进行编译文件，使用control+shift+B运行编译好的文件

以下是sublime text 2的内容

```
{
    "cmd" : ["gcc",  "-o", "$file_base_name", "$file_name"],
    "cmd" : ["./$file_base_name"],
    "selector" : "source.c",
    "shell" : true,
    "working_dir" : "$file_path"
}
```

* 第一行相当于在shell中输入命令`gcc -o 文件名 文件名.c`

* 第二行则是运行编译成功的文件

* 第三行的意思是对后缀为`.c`的文件进行选择

编辑完成后，保存文件，命名为C.sublime-build，然后就可以在Build System中选中这个编译方式了

编辑文件hello.c:

```
#include <stdio.h>

int main(){
	printf("hello world\n");
	return 0;
}
```

使用命令`command + B`编译并运行，效果如下:

![hello world](/uploads/in-post/hello_world_c.png)

至此，就可以在你的Mac OS中使用sublime text进行C语言的开发了
