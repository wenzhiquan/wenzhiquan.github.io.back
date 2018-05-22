---
layout:     post
title:      "Linux基础学习"
date:       2016-06-20 12:00:00
copyright: true
categories:
    - Linux
tags:
    - Linux
---

> “Linux是一套免费使用和自由传播的类Unix操作系统，是一个基于POSIX和UNIX的多用户、多任务、支持多线程和多CPU的操作系统。”

### Linux系统简介

Linux是一个开源的免费操作系统，如下图所示，Linux就是`内核`与`系统调用`接口那两层。

![操作系统的角色](/uploads/in-post/linux_basic/os_level.png)

而平常我们使用的应用程序一般都是运行在操作系统之上的，如qq，浏览器，文本编辑器等。

<!-- more -->

#### Linux之前Unix的历史

早在Linux出现之前20年，就已经有一个相当稳定而成熟的操作系统`Unix`，那么`Unix`又是如何诞生的呢？

* 1969年以前，Bell实验室、MIT、GE（通用电气公司）的`Multics`系统

> 当时的输入设备只有卡片阅读机，输出设备只有打印机，因此如果要测试某个程序，则需要将读卡纸插入卡片机，如果有错误，还需要重新来过。

> 在一个学校里，主机只有一台，如果有多人使用，就需要等待，20世纪60年代初，MIT开发了分时操作系统，让大型主机可以通过提供多个终端机（Terminal）以连入主机

> 1965年前后，Bell、MIT、GE共同发起了Multiplexed Information and Computing Service项目，以使大型主机可以同时提供300台以上的终端连接使用，但由于资金短缺，项目进度落后，造成了失败。

* 1969年，Ken Thompson的小型File Server System

> 仅仅用4个星期，他就以汇编语言写了一组内核程序， 同时包括一些内核工具程序，以及一个小的文件系统，这个系统就是Unix系统的原型。Thompson将Multics系统简化了不少，同实验室的朋友戏称这个系统为Unics。

> 这个文件系统有两个重要的概念：① 所有的程序或系统装置都是文件；② 不管构件编辑器还是附属文件，所写的程序只有一个目的，就是有效的完成目标。

* 1973年，Unix正式诞生，Ritchie等人以C语言写出第一个正式Unix内核

> Thompson的操作系统由于其易用性，在贝尔实验室内部广为流传，但由于Unics是汇编语言写的，对于硬件有依赖性，所以他和Ritchie合作想将Unics用高级的程序语言来编写。当时现成的高级语言有B语言，但编译出来的内核性能不好。Ritchie和Thompson将B语言重新改写为C语言，再用C语言改写和编译Unics内核，发行出了Unix正式版本。而由于是C语言改写的内核，Unix很容易被移植到不同机器上。

* 1977年，重要的Unix分支——BSD诞生

> 1973年以后，Unix与学术界开始了合作开发，Berkeley大学的Bill Joy取得Unix内核源码后，将其改编，命名为Berkeley Software Distribution（即BSD），Bill Joy也是Sun公司的创办者

* 1979年，重要的System V架构与版权声明

> 早期的Unix只能与服务器（Server）或者大型工作站（Workstation）画上等号。而1979年AT&T推出的System V第七版Unix，可以支持x86架构的个人计算机系统。但为了收回Unix版权，增加了”不可对学生提供源码”的严格限制。

* 1984年之一， x86架构的Minix操作系统诞生

> Andrew Tanenbaum（谭宁邦）教授，完全不看Unix源码，自己动手写了Minix这个Unix Like的内核程序，专门用于教学。

* 1984年之二，GNU项目与FSF基金会成立

> Richard Mathew Stallman在1984年发起GNU项目，目的是创建一个自由、开放的Unix操作系统（Free Unix）。他从开发Unix可运行的小程序开始，开发了GCC、Emacs、Bash Shell、GLIBC等软件，打开了GNU项目的知名度，并成立了自由软件基金会

* 1985 年，GNU的通用公共许可证

> 为了避免 GNU 开发的自由软件被其他人用作专利软件，因此创建了`通用公共许可证`（General Public License， GPL），并称呼他为CopyLeft。

* 1988年， 图形接口XFree86项目

> 由于GUI的需求日益增加，MIT和其他第三方发布了X Window System，并成立了XFree86这个组织。

* 1991年，芬兰大学生Linus Torvalds基于bash，gcc开发了Intel 386机器上的内核程序

下面附上Unix系统的家族族谱

![Unix家族族谱](/uploads/in-post/linux_basic/Unix_family.png)

#### Linux的内核版本

Linux的内核版本号类似于：

```
4.3.1-42.e15
主版本.次版本.释出版本-修改版本
```

由于Linux的内核开发者太多，Linux内核经常变动。所以托瓦茨将内核的开发趋势分为两股，并根据两个内核的开发分别给予不同的内核编号：

* `主、次版本为奇数`：开发中版本（development）

> 如4.1.xx，这种内核版本主要用在测试与开发新功能，所以通常这种版本仅有内核开发工程师会使用

* `主、次版本为偶数`：稳定版本（stable）

> 如4.2.xx，等到内核功能开发成熟后会加到这类的版本中，主要用在一般家庭计算机及企业版本中。

#### Linux的特色

* 自由与开放的使用与学习环境

* 配置需求低廉

* 内核功能强大而稳定

* 独立作业

#### Linux的优缺点

**优点**：

* 稳定的系统

* 免费或少许费用

* 安全性、漏洞的快速修补

* 多任务、多用户

* 用户与用户组的规划

* 相对比较不耗资源的系统

* 适合需要小内核程序的嵌入式系统

* 整合度佳且多样的图形用户界面

**缺点**：

* 没有特定的支持厂商

* 游戏的支持度不足

* 专业软件的支持度不足

### 基本概念及操作

#### Linux桌面环境介绍

相对于现在的`Windows`系统，`Unix/Linux`本身是没有图形界面的，我们通常在`Unix/Linux`发行版上看到的图形界面实际都只是运行在Linux系统之上的软件。大家熟知的桌面环境有KDE，GNOME，XFCE，LXDE等，用户可以根据自己的需要安装喜欢的桌面环境，甚至定制桌面。

![Unix/Linux的GUI架构](/uploads/in-post/linux_basic/linux_GUI.png)

#### 终端（Terminal）

在使用`Linux`系统时，我们并不是直接与计算机系统进行交互，而是通过一个叫做`Shell`的中间程序来完成。`Shell`的中文含义是`壳`，可以理解为包裹在计算机内核外的软件，隐藏了操作系统底层的实现细节，他可以解析我们的命令，并将其转化为计算机可以看懂的字段，将命令交给计算机运行。在`Unix/Linux`中比较流行的常见的`Shell`有`bash`，`zsh`，`ksh`，`csh`等。为了提供一个可以接受用户输入并能够显示输出的窗口，Linux系统在图形界面下提供了一个叫做终端模拟器（Terminal）的程序。在MAC系统上推荐使用的Terminal为`iTerm`，Linux系统上推荐使用的Terminal为`Guake`。


#### Terminal命令行

##### 常用快捷键

* [Tab] 使用`Tab`键可以对命令进行快速补全

* [Ctrl+c] 使用`Ctrl+c`可以强行终止当前运行的程序

* [Ctrl+a] 使用`Ctrl+a`可以将光标移至输入行的头部，相当于`Home`键

* [Ctrl+e] 使用`Ctrl+e`可以将光标移至输入行的尾部，相当于`End`键

* [Ctrl+k] 使用`Ctrl+k`可以删除从光标所在位置到行尾的所有字符

##### 历史输入命令

* ⬆️  方向键的`上`键，可以快速查阅输入过的上一条命令

* ⬇️  方向键的`下`键，可以与`上`键在输入过的命令间进行切换

* order + ⬆️  输入部分命令后按`上`键，可以调出上一个包含该order字符的命令

##### 通配符

* \*  匹配 0 或多个字符

* ?  匹配任意一个字符

* [list]  匹配`list`中的任意单一字符，如[abc]，意为匹配a或b或c

* [!list]  匹配除`list`中的任意单一字符以外的字符，如[!abc]，意为不匹配a或b或c

* [c1-c2]  匹配`c1-c2`中的任意单一字符 如[0-9]，意为匹配数字0到9任意数字

* {s1,s2,...}  匹配`s1`或`s2`(或更多)其一字符串

* {c1..c2}  匹配`c1-c2`中全部字符 如{1..10}

### 用户权限管理

`Linux`是一个可以实现多用户登陆的操作系统，比如“admin”和“visitor”都可以同时登陆同一台主机，他们共享一些主机的资源，但他们也分别有自己的用户空间，用于存放各自的文件。但实际上他们的文件都是放在同一个物理磁盘上的甚至同一个逻辑分区或者目录里，但是由于`Linux `的`用户管理`和`权限机制`，不同用户不可以轻易地查看、修改彼此的文件。

#### 查看用户

打开终端，输入命令：

```
who am i
```

![who am i](/uploads/in-post/linux_basic/who_am_i.png)

可以看到，输入的第一列表示当前伪终端的用户的用户名（要查看当前登录用户的用户名，去掉空格直接使用`whoami`即可），第二列的`pts/0`中`pts`表示伪终端，所谓伪是相对于`/dev/tty`设备而言的，`pts/0`后面那个数字就表示打开的伪终端序号，第三列则表示当前伪终端的启动时间。

#### 创建用户

`Linux`系统中，`root`账户拥有整个系统最高的权限，可以对所有账户进行操作。

> `root`权限，系统权限的一种，与`SYSTEM`权限可以理解成一个概念，但高于`Administrator`权限，`root`是`Linux`和`Unix`系统中的超级管理员用户帐户，该帐户拥有整个系统至高无上的权力，所有对象他都可以操作，所以很多黑客在入侵系统的时候，都要把权限提升到`root`权限，获得`root`权限之后就意味着已经获得了手机的最高权限，这时候你可以对手机中的任何文件（包括系统文件）执行所有增、删、改、查的操作

一般登录系统时都是以普通账户的身份登录的，创建用户需要用到`root`权限，使用`root`权限有两种方式，一种是用`root`用户登录进行操作，另一种是使用`sudo`命令。

**su，su - 与 sudo**

`su <user>`可以切换到用户user，执行时需要输入目标用户的密码，`sudo <cmd>`可以以特权权限运行cmd命令，需要当前用户属于`sudo`组，且需要输入当前用户密码。`su - <user>`命令也是切换用户，同时环境变量也会跟着改变成目标用户的环境变量。

利用`sudo`命令创建一个名为`visitor`的用户：

```
sudo adduser visitor
```

系统会创建用户，并生成相应的`home`目录，如果不想生成目录，请使用`useradd`命令。

使用命令`su -l visitor`可以切换到`visitor`用户并将目录切换到其根目录。

![add user](/uploads/in-post/linux_basic/add_user.png)

退出当前用户使用命令`exit`或者使用快捷键`Ctrl+d`。

#### 用户组

在`Linux`中每个用户都有一个归属（用户组），用户组简单地理解就是一组用户的集合，它们共享一些资源和权限，同时拥有私有资源，就跟家的形式差不多，你的兄弟姐妹（不同的用户）属于同一个家（用户组），你们可以共同拥有这个家（共享资源），爸妈对待你们都一样（共享权限），你偶尔写写日记，其他人未经允许不能查看（私有资源和权限）。当然一个用户是可以属于多个用户组的，正如你既属于家庭，又属于学校或公司。

**查看自己所在用户组**

* 使用`groups`命令

![groups](/uploads/in-post/linux_basic/groups_visitor.png)

其中冒号之前表示用户，后面表示该用户所属的用户组。这里可以看到`visitor`用户属于`visitor`用户组，每次新建用户如果不指定用户组的话，默认会自动创建一个与用户名相同的用户组（差不多就相当于家长的意思，或者说是老总）。默认情况下在sudo用户组里的可以使用sudo命令获得root权限。

* 查看`/etc/group`文件

![groups](/uploads/in-post/linux_basic/etc_group.png)

`/etc/group`的内容包括用户组:用户组口令:GID:该用户组所包含的用户，每个用户组一条记录。格式如下：

> group_name:password:GID:user_list

`password`字段为一个`x`，表示密码不可见。

**将其他用户加入sudo组**

默认情况下新创建的用户是不具有`root`权限的，也不在`sudo`用户组，可以让其加入`sudo`用户组从而获取`root`权限。

```
su - l visitor
sudo ls
```

![not in sudo list](/uploads/in-post/linux_basic/not_in_sudo.png)

如上述提示，`visitor`用户不在`sudoers`文件中，如果想让`visitor`具有s`udo`权限，需要将其添加到`sudo`用户组

使用`usermod`命令可以为用户添加用户组，同样使用该命令你必需有`root`权限，你可以直接使用`root`用户为其它用户添加用户组，或者用其它已经在`sudo`用户组的用户使用`sudo`命令获取权限来执行该命令。

```
sudo usermod -G sudo visitor
```

上述命令将`visitor`用户添加到了`sudo`组中，可以使用`sudo`命令获取`root`权限。

#### 删除用户

想要删除用户，需要使用命令：

```
sudo userdel -rf visitor
```

### 文件权限管理

#### 查看文件权限

使用`ls -l`命令列出文件。

![ls](/uploads/in-post/linux_basic/ls_l.png)

每个文件名之前都有一段参数，这些参数的含义如下图：

![ls desc](/uploads/in-post/linux_basic/ls_desc.png)

* 文件类型

文件类型，分为`设备文件`（/dev目录下有各种设备文件）`socket`（网络套接字），`pipe`(管道)，`软链接文件`，`普通文件`和`目录`这几种。

* 文件权限

读权限，表示你可以使用`tail <file name>`之类的命令来读取某个文件的内容，用`r`表示。

写权限，表示你可以编辑和修改某个文件，用`w`表示。

执行权限，通常指可以运行的二进制程序文件或者脚本文件，用`x`表示。

文件类型和权限由`10`位构成，第一位表示文件的类型，后九位表示文件权限，2-4位表示拥有者权限，5-7位表示用户组权限，8-10位表示其他用户权限，`rwx`表示可读可写可执行，`---`表示不可读不可写不可执行，拥有那某个字母表示拥有该字母对应的权限。

![ls type](/uploads/in-post/linux_basic/ls_type.png)

拥有者权限表示文件创建者对该文件拥有的权限，用户组权限表示本组用户对该文件所拥有的权限，其他用户权限则表示非创建者和用户组的所有其他用户对该文件拥有的权限。

* 链接数

链接到该文件所在的`inode`结点的文件名数目。

* 文件大小

以`inode`结点大小为单位来表示的文件大小，可以使用`ls -lh`来更直观的查看文件的大小。

![ls lh](/uploads/in-post/linux_basic/ls_lh.png)

#### 变更文件所有者

用`visitor`用户创建一个文件。

![chown ls](/uploads/in-post/linux_basic/chown_ls.png)

然后切换回`root`用户修改文件所有者。

![chown](/uploads/in-post/linux_basic/chown.png)

发现文件的所有者变成了`root`用户。

#### 修改文件权限

如果想让自己创建的文件不能被其他用户读、写、执行，需要修改文件的相应权限。共有两种方法进行修改：

* 二进制数字表示

如4.1.所述，文件权限由后9位表示，每3位为一组，表示不同类型用户拥有的权限，可以将`rwx`转化为对应的二进制数字：

![binary present](/uploads/in-post/linux_basic/binary_present.png)

简单来说，`r`对应数字`4`，`w`对应数字`2`，`x`对应数字`1`。

`rwx`对应数字为4+2+1 = 7，`rw-`对应数字为4+2+0 = 6，以此类推。

修改文件权限，需要使用`chmod`命令：

![chmod](/uploads/in-post/linux_basic/chmod.png)

修改权限后，其他用户就不能读取该文件了：

![chmod can not read](/uploads/in-post/linux_basic/chmod_can_not_read.png)

* `+-`符号表示

利用下面的命令，可以达到上述同样的效果

![chmod rwx](/uploads/in-post/linux_basic/chmod_rwx.png)

`g`，`o`，`u`分别表示`group`，`others`，`user`。

`+`，`-`分别表示增加或者删除相应的权限。

### Linux目录结构

`Unix`是以目录为主的，`Linux`也继承了这一优良特性。`Linux`是以树形目录结构的形式来构建整个系统的，可以理解为一个用户可操作系统的骨架。虽然本质上无论是目录结构还是操作系统内核都是存储在磁盘上的，但从逻辑上来说`Linux`的磁盘是挂载在目录上的，每一个目录不仅能使用本地磁盘分区的文件系统，也可以使用网络上的文件系统。

#### FHS标准

在早期的`Unix`系统中，各个厂家各自定义了自己的`Unix`系统的文件系统构成，比较混乱，而`Linux`为了避免这个问题，对文件系统进行了标准化的活动，推出了`FHS`标准，2004年1月19日发行了最新版本[FHS标准2.3](http://refspecs.linuxfoundation.org/FHS_2.3/fhs-2.3.pdf)。

> `FHS`（英文：Filesystem Hierarchy Standard 中文：文件系统层次结构标准），多数`Linux`版本采用这种文件组织形式，`FHS`定义了系统中每个区域的用途、所需要的最小构成的文件和目录同时还给出了例外处理与矛盾处理。

`FHS`定义了两层规范，第一层是，`/`下面的各个目录应该要放什么文件数据，例如`/etc`应该要放置设置文件，`/bin`与`/sbin`则应该要放置可执行文件等等。

第二层则是针对`/usr`及`/var`这两个目录的子目录来定义。例如`/var/log`放置系统登录文件、`/usr/share`放置共享数据等等。

`FHS`依据文件系统使用的频繁与否以及是否允许用户随意改动，将目录定义为四种交互作用的形态:

![](/uploads/in-post/linux_basic/FHS.png)

**`根目录`（/）含义***：

根目录是整个系统最重要的目录，因为不但所有的目录都是由根目录衍生出来的，同时，根目录也与开机、还原、系统修复等操作有关。

`FHS`建议：根目录所在的分区越小，系统性能就越好，根目录所在的文件系统也较不容易发生问题

以下是重要目录放置的文件内容：

|目录|应放置文件内容|
|-|-|
|/bin|放置一些在<span style="COLOR: #ff0000"><strong>单用户维护模式下还能被操作的命令</strong></span>，主要有：cat, chmod, chown, date, mv, mkdir, cp, bash等命令|
|/boot|放置开机会使用到的文件，包括<span style="COLOR: #ff0000"><strong>Linux内核文件以及开机菜单与开机所需配置文件</strong></span>等|
|/dev|以文件形式存放<strong><span style="COLOR: #ff0000">任何设备与接口设备</span></strong>，比较重要的文件：/dev/null, /dev/zero, /dev/tty, /dev/lp\*, /dev/hd\*, /dev/sd\*等|
|/etc|系统主要的配置文件<strong><span style="COLOR: #ff0000">几乎</span></strong>都放置在这个目录内。FHS建议：不要将可执行文件放到这个目录，比较重要的文件：/etc/inittab, /etc/init.d, /etc/modprobe.conf, /etc/X11, /etc/sysconfig等|
|/home|系统默认的用户主文件夹，～代表当前用户主文件夹|
|/lib|放置在开机时会用到的<strong><span style="COLOR: #ff0000">函数库</span></strong>，以及在/bin或/sbin下面的命令会调用的函数库，/lib/modules这个目录放置的驱动程序文件，尤其重要|
|/media|此目录下的文件都是可删除的设备，常见文件名：/media/cdrom|
|/mnt|用来暂时挂载某些额外设备|
|/opt|第三方软件放置的目录|
|/root|系统管理员的主文件夹，/root应该和根目录放在同一个分区中|
|/srv|存放网络服务所需取用的数据，如：www服务需要的网页数据就可以放置在/srv/www里面|
|/tmp|任何人都可以访问这个目录，这是用于暂时放置文件的地方，重要的数据<strong>都不可以</strong>放到这个目录里面，FHS建议：每次开机时都清空一下这个目录|
|/sbin|放置了开机过程所需的命令，包括<strong><span style="COLOR: #ff0000">开机、修复、还原系统所需的命令</span></strong></tbody></table>|

注意：

开机过程中，只有根目录会被挂载，其他分区则是在开机完成后才会持续进行挂载，所以在根目录下与开机相关的目录都`不能`与根目录放到`不同的分区`中。

从上表可以轻易得出，下列五个目录一定不可与根目录分开：

/etc----配置文件

/bin----重要执行文件

/dev----所需要的设备文件

/lib----执行文件所需要的函数库与内核所需的模块

/sbin----重要的系统执行文件

#### 目录路径

`路径`是指某个目录或文件所在的位置，分为`绝对路径`和`相对路径`两种：

* 绝对路径

是以`根"/"`目录为起点的完整路径，以你所要到的目录为终点，表现形式如：`/usr/local`，表示根目录下的`usr`目录中的`local`目录。

* 相对路径

相对路径，是相对于当前目录的路径，相对路径是以当前目录`.`为起点，以所要到的目录为终点，表现形式如：`local/bin `。因为这个目录为 当前目录下的子目录，是可以省略这个`.`的；如果是当前目录的上一级目录，则需要使用`..`，比如你当前目录为`home`目录，根目录就应该表示为`../` ,表示当前目录（`home`目录）的上一级目录（`/`目录）。

使用`cd`命令可以切换目录，在`Linux`中，`.`表示当前目录，`..`表示上一级目录, `-`表示上一次所在目录，`～`通常表示当前用户的`home`目录。使用`pwd`命令可以获取当前所在路径（绝对路径）。

进入上一级目录：

```
cd ..
```

进入本用户`home`目录

```
cd ~
```

使用`pwd`获取当前路径

```
pwd
```

![cd](/uploads/in-post/linux_basic/cd.png)

提示：在进行目录切换的过程中请多使用`Tab`键自动补全，可避免输入错误，连续按两次`Tab`可以显示全部候选结果。

### Linux文件的基本操作

#### 新建

* 新建空白文件

使用`touch`命令创建空白文件，可以创建一个不会覆盖已有同名文件的空白文件。

* 新建有预定内容的文件

使用`echo "content" > filename`命令，可以创建一个拥有`content`内容的名为`filename`的文件。

* 新建目录

使用`mkdir`命令可以创建一个空白目录，使用`-p`参数可以同时创建父目录。

#### 复制

* 复制文件

使用`cp`命令可以复制一个文件到指定目录。

* 复制目录

使用`cp -r`或`cp -R`命令，可以递归复制目录及其中的文件到指定目录。

#### 删除

* 删除文件

使用`rm`命令，可以删除一个文件。使用参数`-f`可以强制删除文件。

* 删除目录

使用`rm -r`命令，可以删除一个目录。

#### 移动文件与文件重命名

* 移动文件

使用`mv`命令可以移动文件，使用方法为`mv 源文件 目的目录`。

* 重命名文件

使用`mv`命令还可以重命名文件，使用方法为`mv 旧文件名 新文件名`。

* 批量重命名

使用`rename`命令可以通过`perl`正则表达式进行批量重命名：

```
# 使用通配符批量创建 5 个文件
touch file{1..5}.txt

# 批量将这 5 个后缀为 .txt 的文本文件重命名为以 .c 为后缀的文件
rename 's/\.txt/\.c/' *.txt

# 批量将这 5 个文件，文件名改为大写
rename 'y/a-z/A-Z/' *.c
```

`rename`是先使用第二个参数的通配符匹配所有后缀为`.txt`的文件，然后使用第一个参数提供的正则表达式将匹配的这些文件的`.txt`后缀替换为`.c`。

#### 查看文件

* 使用`cat`，`tac`和`nl`命令查看文件

这三个命令都是用来打印文件内容到标准输出,其中`cat`为正序显示，`tac`倒序显示，`nl`添加行号并打印。

> 标准输入输出：当我们执行一个`shell`命令行时通常会自动打开三个标准文件，即标准输入文件`stdin`，默认对应终端的键盘；标准输出文件`stdout`和标准错误输出文件`stderr`，这两个文件都对应被重定向到终端的屏幕，以便我们能直接看到输出内容。进程将从标准输入文件中得到输入数据，将正常输出数据输出到标准输出文件，而将错误信息送到标准错误文件中。

比如我们要查看`/local`文件夹下的`test.txt`文件：

```
cat test.txt
```

可以加上参数`-n`显示行号：

```
cat -n test.txt
```

![cat](/uploads/in-post/linux_basic/cat.png)

`nl`命令，添加行号并打印，是比`cat -n`更专业的行号打印命令。他有以下几个常用参数：

```
-b : 指定添加行号的方式，主要有两种：
    -b a:表示无论是否为空行，同样列出行号("cat -n"就是这种方式)
    -b t:只列出非空行的编号并列出（默认为这种方式）
-n : 设置行号的样式，主要有三种：
    -n ln:在行号字段最左端显示
    -n rn:在行号字段最右边显示，且不加 0
    -n rz:在行号字段最右边显示，且加 0
-w : 行号字段占用的位数(默认为6位)
```

![nl](/uploads/in-post/linux_basic/nl.png)

以上三个命令都是在当前窗口显示文本，一屏显示不完文本的内容，需要用鼠标拖动滚动条或者滑动滚轮才能继续往下翻页，如果能够用键盘直接进行翻页操作的话会更加方便，这就需要使用下面的几个命令。

* 使用`more`和`less`命令分页查看文件

这两个命令都能够实现用键盘向下翻页的操作，其中`more`命令翻页到最后一行时会自动退出命令，而`less`的功能更加强大，他是基于`more`和`vi`开发的，会新打开一个页面显示文本内容，只要不按`q`推出，可以随意翻页。

比如我们要使用`more`命令查看一个单页放不下的`test.txt`文件：

```
more test.txt
```

![more](/uploads/in-post/linux_basic/more.png)

打开后默认只显示一屏内容，终端底部显示当前阅读的进度(百分比)，翻到尾行时命令会自动退出。可以使用`Enter`键向下滚动一行，使用`Space`键向下滚动一屏，按下`h`显示帮助，`q`退出。

如果我们使用`less`命令查看单页放不下德 `test.txt`：

```
less test.txt
```

![less](/uploads/in-post/linux_basic/less.png)

可以看到，翻到尾行时命令不会退出，而是显示`End`，表示已经到达了尾行。

* 使用`head`和`tail`命令查看文件

正如命令的名称，`head`命令只查看文件的头几行（默认为10行，不足10行则显示全部），`tail`命令只查看文件的尾几行。

两个命令的输入方式如下：

```
head test.txt
head -n 1 test.txt
tail test.txt
tail -n 1 test.txt
```

![head tail](/uploads/in-post/linux_basic/head_tail.png)

关于`tail`命令，还有一个很实用的参数`-f`，这个参数可以实现不停地读取某个文件的内容并显示。让我们可以动态查看日志，起到实时监视的作用。

#### 查看文件类型

我们可以使用`file`命令查看文件的类型：

```
file test.txt
```

![file](/uploads/in-post/linux_basic/file.png)

这表示`test.txt`是一个由ASCII编码的文本文件。

### 环境变量

#### 变量

要了解`环境变量`，首先要了解`Shell变量`，所谓`变量`就是计算机中用于记录一个值（不一定是数值，也可以是字符或字符串）的符号，而这些符号将用于不同的运算处理中。通常变量与值是一对一的关系，可以通过表达式读取它的值赋值给其它变量，也可以直接指定数值赋值给任意变量。为了便于运算和处理，大部分的编程语言会区分变量的类型，用于分别记录数值、字符或者字符串等等数据类型。`Shell`中的变量也基本如此，有不同类型（但不用专门指定类型名），可以参与运算，有作用域限定。

> 变量的作用域即变量的有效范围（比如一个函数中、一个源文件中或者全局范围），在该范围内只能有一个同名变量。一旦离开则该变量无效，如同不存在这个变量一般。

* 创建变量

使用`declare`命令可以创建一个变量：

```
declare tmp
```

其实也可以不用`declare`预声明一个变量，直接用的时候创建即可。

使用`=`符号（不要加空格）赋值运算符可以为变量`tmp`赋值：

```
tmp=nihao
```

读取变量的值，使用`echo`命令和`$`符号（一定要加`$`符号，不然输出的是变量名而不是他的值）：

```
echo $tmp
```

![declare](/uploads/in-post/linux_basic/declare.png)

注意:关于变量名，并不是任何形式的变量名都是可用的，变量名只能是英文字母,数字或者下划线，且不能以数字作为开头。

#### 环境变量

`环境变量`就是作用域比自定义变量要大，如`Shell`的环境变量作用于自身和它的子进程。在所有的`Unix`和类`Unix`系统中，每个进程都有其各自的环境变量设置，且默认情况下，当一个进程被创建时，处理创建过程中明确指定的话，它将继承其父进程的绝大部分环境设置。`Shell`程序也作为一个进程运行在操作系统之上，而我们在`Shell`中运行的大部分命令都将以`Shell`的子进程的方式运行。

![shell env](/uploads/in-post/linux_basic/shell_env.png)

通常我们会涉及到的环境变量有三种：

* 当前`Shell`进程私有用户自定义变量，如上面我们创建的`tmp`变量，只在当前`Shell`中有效。

* `Shell`本身内建的变量。

* 从自定义变量导出的环境变量。

也有三个与上述三种环境变量相关的命令，`set`，`env`，`export`。这三个命令很相似，都可以用于打印相关环境变量,区别在于涉及的是不同范围的环境变量，详见下表：

|命令|说明|
|--|--|
|`set`|显示当前`Shell`所有环境变量，包括其内建环境变量（与`Shell`外观等相关），用户自定义变量及导出的环境变量|
|`env`|显示与当前用户相关的环境变量，还可以让命令在指定环境中运行|
|`export`|显示从`Shell`中导出成环境变量的变量，也能通过它将自定义变量导出为环境变量|

![set env](/uploads/in-post/linux_basic/set_env.png)

关于环境变量，可以简单的理解成在当前进程的子进程是否有效，有效则为环境变量，否则不是。

注意：为了与普通变量区分，通常我们习惯将环境变量名设为大写。

#### 命令的查找路径与顺序

我们在`Shell`中输入一个命令，他是怎么找到相应的命令并执行的呢？答案是通过环境变量`PATH`来进行搜索的。

查看`PATH`环境变量的内容：

```
echo $PATH
```

![path](/uploads/in-post/linux_basic/path.png)

上面这些目录中放的都是可执行文件，当我们在`Shell`中执行一个命令时，系统就会按照`PATH`中设定的路径按照顺序依次到目录中去查找，如果存在同名的命令，则执行先找到的那个。

#### 添加自定义路径到`PATH`环境变量

`PATH`环境变量中是以`:`作为路径的分隔符，我们可以这样添加自定义路径：

```
PATH = $PATH:/home/wen/bin
```

注意：`PATH`路径一定要使用绝对路径

但是给`PATH`环境变量追加了一个路径，它也只是在当前`Shell`有效，一旦退出终端，再打开就会发现失效了。有没有方法让添加的环境变量全局有效？或者每次启动`Shell`时自动执行上面添加自定义路径到`PATH`的命令？

在每个用户的`home`目录中有一个`Shell`每次启动时会默认执行一个配置脚本，以初始化环境，包括添加一些用户自定义环境变量等等。`zsh`的配置文件是`.zshrc`，相应`Bash`的配置文件为`.bashrc`。它们在`etc`下还都有一个或多个全局的配置文件，不过我们一般只修改用户目录下的配置文件。

我们可以简单的使用下面命令直接添加内容到.zshrc中：

```
echo "PATH=$PATH:/home/wen/bin" >> .zshrc
```

上述命令中`>>`表示将标准输出以追加的方式重定向到一个文件中，注意前面用到的`>`是以覆盖的方式重定向到一个文件中，使用的时候一定要注意分辨。在指定文件不存在的情况下都会创建新的文件。

或者使用`vi`或`vim`或其他文本编辑器打开`.zshrc`文件，找到`PATH`行，将内容添加进`PATH`的配置中。

#### 修改和删除已有变量

* 变量修改

变量的修改有以下几种方式：

|变量设置方式|说明|
|--|--|
|`${变量名#匹配字串}`|从头向后开始匹配，删除符合匹配字串的最短数据|
|`${变量名##匹配字串}`|从头向后开始匹配，删除符合匹配字串的最长数据|
|`${变量名%匹配字串}`|从尾向前开始匹配，删除符合匹配字串的最短数据|
|`${变量名%%匹配字串}`|从尾向前开始匹配，删除符合匹配字串的最长数据|
|`${变量名/旧的字串/新的字串}`|将符合旧字串的第一个字串替换为新的字串|
|`${变量名//旧的字串/新的字串}`|将符合旧字串的全部字串替换为新的字串|

比如要修改我们前面添加到`PATH`的环境变量。为了避免操作失误导致命令找不到，我们先将`PATH`赋值给一个新的自定义变量`path`：

```
$ path=$PATH
$ echo $path
$ path=${path%/home/wen/bin}
# 或使用通配符,*表示任意多个任意字符
$ path=${path%*/bin}
```

* 变量删除

可以使用`unset`命令删除一个环境变量：

```
unset tmp
```

#### 如何让环境变量立即生效

我们在`Shell`中修改了一个配置脚本文件之后（比如`zsh`的配置文件`home`目录下的`.zshrc`），需要退出终端重新打开甚至重启主机之后其才能生效，我们可以使用`source`命令来让其立即生效，如：

```
source .zshrc
```

`source`命令还有一个别名就是`.`，但后面的文件必须指定完整的绝对或相对路径名：

```
. ./.zshrc
```

第一个`.`表示`source`命令，第二个`.`表示当前目录。

### 搜索文件

与搜索相关的命令常用的有如下几个`whereis`，`locate`，`which`，`find`。

#### `whereis`简单快速

```
whereis test
```

![whereis](/uploads/in-post/linux_basic/whereis.png)

`whereis`只能搜索`二进制文件`(-b)，`man帮助文件`(-m)和`源代码文件`(-s)。和`find`相比，`whereis`查找的速度非常快，这是因为`Linux`系统会将 系统内的所有文件都记录在一个数据库文件中，当使用`whereis`和下面即将介绍的`locate`时，会从数据库中查找数据，而不是像`find`命令那样，通过遍历硬盘来查找，效率自然会很高。但是该数据库文件并不是实时更新，默认情况下时一星期更新一次，因此，我们在用`whereis`和`locate`查找文件时，有时会找到已经被删除的数据，或者刚刚建立文件，却无法查找到，原因就是因为数据库文件没有被更新。

#### `locate`快而全

`locate`让使用者可以很快速的搜寻档案系统内是否有指定的档案。其方法是先建立一个包括系统内所有档案名称及路径的数据库，之后当寻找时就只需查询这个数据库，而不必实际深入档案系统之中了。`locate`通过`/var/lib/mlocate/mlocate.db`数据库查找，不过这个数据库也不是实时更新的，系统会使用定时任务每天自动执行`updatedb`命令更新一次，所以有时候你刚添加的文件，它可能会找不到，需要手动执行一次`updatedb`命令。

它可以用来查找指定目录下的不同文件类型，如查找`/usr`下所有以`src`开头的文件：

```
locate /usr/src
```

![locate](/uploads/in-post/linux_basic/locate.png)

注意：它不只是在`usr`目录下查找，还会自动递归子目录进行查找。

查找`/usr/share/`下所有`jpg`文件：

![locate jpg](/uploads/in-post/linux_basic/locate_jpg.png)

注意：`*`号前面要添加反斜杠(`\`)转义，否则会无法找到。

如果想只统计数目可以加上`-c`参数，`-i`参数可以忽略大小写进行查找，`whereis`的`-b`,`-m`，`-s`同样可以使用。

#### `which`小而精

`which`本身是`Shell`内建的一个命令，我们通常使用`which`来确定是否安装了某个指定的软件，因为它只从`PATH`环境变量中执行的路径中去搜索命令。

```
which man
```

![which](/uploads/in-post/linux_basic/which.png)

#### `find`精而细

`Linux`下`find`命令在目录结构中搜索文件，并执行指定的操作。`Linux`下`find`命令提供了相当多的查找条件，功能很强大。由于`find`具有强大的功能，所以它的选项也很多。即使系统中含有网络文件系统(NFS)，`find`命令在该文件系统中同样有效，只要你具有相应的权限。

在指定目录下搜索指定文件名的文件：

```
find / -name 'test.txt'
```

![find](/uploads/in-post/linux_basic/find.png)

`find`命令的路径是作为第一个参数的， 基本命令格式为`find [path] [option] [action]`。

基本命令选项：

* `-name`   按照文件名查找文件。
* `-perm`   按照文件权限来查找文件。
* `-prune`  使用这一选项可以使find命令不在当前指定的目录中查找，如果同时使用-depth选项，那么-prune将被find命令忽略。
* `-user`   按照文件属主来查找文件。
* `-group`  按照文件所属的组来查找文件。
* `-nogroup`    查找无有效所属组的文件，即该文件所属的组在/etc/groups中不存在。
* `-nouser`     查找无有效属主的文件，即该文件的属主在/etc/passwd中不存在。
* `-newer file1 ! file2`    查找更改时间比文件file1新但比文件file2旧的文件。
* `-type`   查找某一类型的文件，诸如：
    + `b` - 块设备文件。
    + `d` - 目录。
    + `c` - 字符设备文件。
    + `p` - 管道文件。
    + `l` - 符号链接文件。
    + `f` - 普通文件。

与时间相关的命令参数：

参数|说明
--|--
`-amin n`|查找系统中最后N分钟访问的文件
`-atime n`|查找系统中最后n*24小时访问的文件
`-cmin n`|查找系统中最后N分钟被改变文件状态的文件
`-ctime n`|查找系统中最后n*24小时被改变文件状态的文件
`-mmin n`|查找系统中最后N分钟被改变文件数据的文件
`-mtime n`|查找系统中最后n*24小时被改变文件数据的文件

下面以`-mtime`参数举例：

* `-mtime n`: n为数字，表示为在n天之前的”一天之内“修改过的文件
* `-mtime +n`: 列出在n天之前（不包含n天本身）被修改过的文件
* `-mtime -n`: 列出在n天之前（包含n天本身）被修改过的文件

![find time](/uploads/in-post/linux_basic/find_time.png)

实例：

* 查找指定时间内修改过的文件

```
find -mtime -2
```

![find mtime](/uploads/in-post/linux_basic/find_mtime.png)

查找`2 * 24`小时之内被修改过的文件。

* 根据关键字查找

```
find . -name "test.txt"
```

![find name](/uploads/in-post/linux_basic/find_name.png)

在当前目录查找文件名为`test.txt`的文件。

* 按照目录或文件的权限查找文件

```
find . -perm 765
```

![find perm](/uploads/in-post/linux_basic/find_perm.png)

查找当前目录下权限为`765`的文件。

* 按照类型查找

```
find . -type f -name "*.xml"
```

![find type](/uploads/in-post/linux_basic/find_type.png)

查找当前目录下以`xml`结尾的普通文件。

* 按照文件内容查找

```
find . -name "*.txt" | xargs grep "test*"
```

![find grep](/uploads/in-post/linux_basic/find_grep.png)

查找当前目录下含有`test`开头的所有`txt`文件。

### 文件打包和解压缩

在`Linux`上常用的是`tar`工具，常用的压缩命令还有`compress`，`gzip`和`bzip2`等。

常用的命令如下：

```
compress filename       将文件压缩成.Z格式

gzip filename           将文件压缩成.gz格式

bzip2 filename          将文件压缩成.bz2格式

以上三个命令 -d           将相应的文件解压缩

tar dest source         打包压缩

    -c                      归档文件

    -x                      压缩文件

    -z                      gzip压缩文件

    -j                      bzip2压缩文件

    -v                      显示压缩或解压缩过程 v(view)

    -f                      使用档名
```

实例：

tar -cvf /local/test.tar /local/test          只打包，不压缩

tar -zcvf /local/test.tar.gz /local/test      打包，并用gzip压缩

tar -jcvf /local/test.tar.bz2 /local/test     打包，并用bzip2压缩

tar -xvf /local/test.tar /local/test          只拆包

tar -zxvf /local/test.tar.gz /local/test      用gzip解压缩，并拆包

tar -jxvf /local/test.tar.bz2 /local/test     用bzip2解压缩，并拆包

### 文件系统操作

#### 查看磁盘和目录的容量

* 使用`df`命令查看磁盘的容量

```
df
```

![df](/uploads/in-post/linux_basic/df.png)

一般使用情况下，我们更多只是关心`/dev/sda1`的内容。

物理主机上的`/dev/sda1`是对应着主机硬盘的分区，后面的数字表示分区号，数字前面的字母`a`表示第几块硬盘（也可能是可移动磁盘），你如果主机上有多块硬盘则可能还会出现`/dev/sdb`，`/dev/sdc`这些磁盘设备都会在`/dev`目录下以文件的存在形式。

我们还可以看到`1k-块`(1k-blocks)这个陌生的名词，它表示以磁盘块大小的方式显示容量，后面为相应的以块大小表示的已用和可用容量。

可以用参数`-h`转化为更为直观的方式：

```
df -h
```

![df h](/uploads/in-post/linux_basic/df_h.png)

* 使用`du`命令查看目录的容量

```
# 默认同样以 blocks 的大小展示
du
# 加上`-h`参数，以更易读的方式展示
du -h
```

`-d`参数指定查看目录的深度

```
# 只查看1级目录的信息
du -h -d 0 ~
# 查看2级
du -h -d 1 ~
```

![du](/uploads/in-post/linux_basic/du.png)

### 命令执行顺序的控制

#### 顺序执行多条命令

通常情况下，我们每次只能在终端输入一条命令，按下回车执行，执行完成后，我们再输入第二条命令，然后再按回车执行……

但是我们可能会遇到如下使用场景：我们需要使用`apt-get`安装一个软件，然后安装完成后立即运行安装的软件（或命令工具），又恰巧你的主机没有更新软件列表,那么你可能会有如下一系列操作：

```
sudo apt-get update
# 等待——————————然后输入下面的命令
sudo apt-get install software
# 等待——————————然后输入下面的命令
software
```

这样的输入方式比较浪费我们的时间，我们可能想要一次性输入完命令，并让系统自动运行。

简单的顺序执行可以使用`;`来完成：

```
sudo apt-get update;sudo apt-get install software;software
# 让它自己运行
```

#### 有选择的执行命令

如果自动顺序执行命令时，前面的命令执行不成功，而后面的命令又依赖于上一条命令的结果，那么就会造成花了时间，最终却得到一个错误的结果，而且有时候无法判断结果是否正确。此时我们需要能够有选择性的执行命令，比如上一条命令执行成功才继续下一条：

```
which cowsay && cowsay -f head-in ohch~
```

如果没有安装`cowsay`，执行一次上述命令，会发现什么也没发生，如果安装了`cowsay`，会出现以下效果：

![cowsay](/uploads/in-post/linux_basic/cowsay.png)

上面的`&&`就是用来实现选择性执行的，它表示如果前面的命令执行结果返回`0`则执行后面的，否则不执行，你可以从`$?`环境变量获取上一次命令的返回结果：

![cowsay echo](/uploads/in-post/linux_basic/cowsay_echo.png)

`&&`表示逻辑与，`||`表示逻辑或，`shell`可以用两个符号实现命令执行顺序的简单控制。`||`在这里就是与`&&`相反的控制效果，即当上一条命令执行结果为`≠0($?≠0)`时则执行它后面的命令：

```
which cowsay || echo "cowsay not found"
```

同时我们可以将`&&`命令和`||`命令综合起来进行使用，比如：

```
which cowsay && echo "exist" || echo "not exist"
```

上面命令运行的流程如下：

![order control](/uploads/in-post/linux_basic/order_control.png)

### 管道

`管道`是一种通信机制，通常用于`进程`间的通信（也可通过socket进行网络通信），它表现出来的形式就是将前面每一个进程的输出(stdout)直接作为下一个进程的输入(stdin)。

`管道`又分为`匿名管道`和`具名管道`。`具名管道`简单的说就是有名字的管道，通常只会在源程序中用到具名管道。我们在使用一些过滤程序时经常会用到的就是`匿名管道`，在命令行中由`|`分隔符表示。

#### 匿名管道

输入命令：

```
ls -al /etc
```

上述命令结果很多，屏幕不能完全显示，可以使用管道命令：

```
ls -al /etc | less
```

会将前一个命令`ls`的输出传递给下一个命令`less`，然后可以进行`less`命令的操作。

#### cut命令

`cut`命令可以将文件进行处理后输出：

```
# 输出每行前五个字符（包含第五个）
cut /etc/passwd -c -5
# 输出每行前五个之后的字符（包含第五个）
cut /etc/passwd -c 5-
# 输出每行第五个字符
cut /etc/passwd -c 5
# 输出每行2到5之间的字符（包含第五个）
cut /etc/passwd -c 2-5
# 将分隔符变为:分割出不同的field，并输出第1个和第2个field
cut /etc/passwd -d ':' -f 1,2
# 将分隔符变为:分割出不同的field，并输出第1个到第4个field
cut /etc/passwd -d ':' -f 1-4
```

#### grep命令

`grep`命令是很强大的，也是相当常用的一个命令，它结合正则表达式可以实现很复杂却很高效的匹配和查找。

`grep`命令的一般形式为：`grep` `[命令选项]` `用于匹配的表达式` `[文件]`

例如，搜索当前目录下所有包含`test`的所有文件，并显示出现在文本中的行号：

```
grep -rnI "test" .
```

![grep](/uploads/in-post/linux_basic/grep.png)

`-r`参数表示递归搜索子目录中的文件,`-n`表示打印匹配项行号，`-I`表示忽略二进制文件。

也可以在匹配字段中使用正则表达式：

```
# 查看环境变量中以"bin"结尾的字符串
$ export | grep ".*bin$"
```

![grep export](/uploads/in-post/linux_basic/grep_export.png)

#### wc命令

`wc`命令用于统计并输出一个文件中行、单词和字节的数目：

```
wc /etc/passwd
# 行数
wc -l /etc/passwd
# 单词数
wc -w /etc/passwd
# 字节数
wc -c /etc/passwd
# 字符数
wc -m /etc/passwd
# 最长行字节数
wc -L /etc/passwd
```

![wc](/uploads/in-post/linux_basic/wc.png)

注意：对于西文字符来说，一个字符就是一个字节，但对于中文字符一个汉字是大于2个字节的，具体数目是由字符编码决定的。

结合管道来操作一下，下面统计`/etc`下面所有目录数：

```
ls -dl /etc/*/ | wc -l
```

![wc ls](/uploads/in-post/linux_basic/wc_ls.png)

#### sort命令

功能是将输入按照一定方式排序，然后再输出,它支持的排序有按字典排序,数字排序，按月份排序，随机排序，反转排序，指定特定字段进行排序等等。

默认为字典排序：

```
cat /etc/passswd | sort
```

反转排序：

```
cat /etc/passwd | sort -r
```

按特定字段排序：

```
cat /etc/passwd | sort -t':' -k 3
```

上面的`-t`参数用于指定字段的分隔符，这里是以`:`作为分隔符；`-k`字段号用于指定对哪一个字段进行排序。这里`/etc/passwd`文件的第三个字段为数字，默认情况下是一字典序排序的，如果要按照数字排序就要加上`-n`参数：

```
$ cat /etc/passwd | sort -t':' -k 3 -n
```

#### uniq命令

`uniq`命令可以用于过滤或者输出重复行。

* 过滤重复行

我们可以使用`history`命令查看最近执行过的命令，不过你可能只想查看使用了那个命令而不需要知道具体干了什么，那么你可能就会要想去掉命令后面的参数然后去掉重复的命令：

```
history | cut -c 8- | cut -d ' ' -f 1 | uniq
```

由于`uniq`命令只能去连续重复的行，不是全文去重，所以要达到全文去重效果，我们需要先排序：

```
history | cut -c 8- | cut -d ' ' -f 1 | sort | uniq
# 或者$ history | cut -c 8- | cut -d ' ' -f 1 | sort -u
```

* 输出重复行

```
# 输出重复过的行（重复的只输出一个）及重复次数
history | cut -c 8- | cut -d ' ' -f 1 | sort | uniq -dc
# 输出所有重复的行
history | cut -c 8- | cut -d ' ' -f 1 | sort | uniq -D
```

### 常用文本处理命令

#### tr命令

`tr`命令可以用来删除一段文本信息中的某些文字。或者将其进行转换。

使用方式：`tr` `[option]`...`SET1` `[SET2]`

常用的选项有：

选项|说明
--|--
-d|删除和set1匹配的字符，注意不是全词匹配也不是按字符顺序匹配
-s|去除set1指定的在输入文本中连续并重复的字符

操作举例：

```
# 删除 "hello world" 中所有的'o','l','h'
echo 'hello world' | tr -d 'olh'
# 将"hello" 中的ll,去重为一个l
echo 'hello' | tr -s 'l'
# 将输入文本，全部转换为大写或小写输出
echo 'hello world' | tr '[a-z]' '[A-Z]'
```

![tr](/uploads/in-post/linux_basic/tr.png)

#### col命令

`col`命令可以将`Tab`换成对等数量的`空格建`，或反转这个操作。

使用方式：

```
col [option]
```

常用的选项有：

选项|说明
--|--
-x|将Tab转换为空格
-h|将空格转换为Tab（默认选项）

操作举例：

```
# 查看 /etc/protocols 中的不可见字符，可以看到很多 ^I ，这其实就是 Tab 转义成可见字符的符号
cat -A /etc/protocols | tail -n 5
# 使用 col -x 将 /etc/protocols 中的 Tab 转换为空格,然后再使用 cat 查看，你发现 ^I 不见了
cat /etc/protocols | col -x | tail -n 5
```

![col](/uploads/in-post/linux_basic/col.png)

#### join命令

`join`命令用于将两个文件中包含相同内容的那一行合并在一起。

使用方式：

```
join [option]... file1 file2
```

常用的选项有：

选项|说明
--|--
-t|指定分隔符，默认为空格
-i|忽略大小写的差异
-1|指明第一个文件要用哪个字段来对比，，默认对比第一个字段
-2|指明第二个文件要用哪个字段来对比，，默认对比第一个字段

操作举例：

```
# 创建两个文件
echo 'haha 1:hello haha' > file1
echo 'haha 1:world hehe' > file2
join file1 file2
# 将file1与file2两个文件合并，指定以':'作为分隔符
sudo join -t':' file1 file2
# 将file1与file2两个文件合并，指定以':'作为分隔符, 分别比对第1和第1个字段
sudo join -t':' -1 1 file1 -2 1 file2
```

![join](/uploads/in-post/linux_basic/join.png)

#### paste命令

`paste`命令与`join`命令类似，它是在不对比数据的情况下，简单地将多个文件合并一起，以`Tab`隔开。

使用方式：
```
paste [option] file...
```

常用的选项有：

选项|说明
--|--
-d|指定合并的分隔符，默认为Tab
-s|不合并到一行，每个文件为一行

操作举例：

```
echo hello > file1
echo world > file2
echo wenzhiquan > file3
paste -d ':' file1 file2 file3
paste -s file1 file2 file3
```

![paste](/uploads/in-post/linux_basic/paste.png)
