---
layout:     post
title:      "Linux系统常用命令"
date:       2016-06-05 12:00:00
copyright: true
categories:
    - Linux
tags:
    - Linux
---

> “Linux是一套免费使用和自由传播的类Unix操作系统，是一个基于POSIX和UNIX的多用户、多任务、支持多线程和多CPU的操作系统。”

### 概述

`UNIX`的两个重要分支：`System V`和`BSD UNIX`，`Linux`属于`BSD`分支。

`Linux`版本号的命名规则：`Linux`的内核版本由3部分组成。版本号的第二位数字，可以确定Linux内核版本的类型，第二位数字是偶数的为稳定版本。

`Linux`里一切皆文件。

<!-- more -->

### 档案与目录管理

```
ls　　                   显示文件或目录

    -l                      列出文件详细信息l(list)

    -a                      列出当前目录下所有文件及目录，包括隐藏的a(all)

mkdir                   创建目录

    -p                      创建目录，若无父目录，则创建p(parent)

cd dir                  切换目录，如果不加dir会切换到用户根目录

touch filename          创建空文件

echo content > filename 创建带有内容的文件，如果文件存在，会发生覆盖

cat filename            查看文件内容

cp source dest          拷贝

mv source dest          移动或重命名

rm                      删除文件

    -i                     删除前进行确认

    -r                     递归删除，可删除子目录及文件

    -f                     强制删除

find dir -name exp      在文件系统中搜索某文件，content可以是正则表达式

    | xargs grep content   查找内容为content的文件

wc                      统计文本中行数、字数、字符数

    -c                      统计文本中byte数量

    -l                      统计文本中字符行数

    -m                      统计文本中字符数

    -w                      统计文本中单词个数

grep exp filename       在文本文件中查找某个字符串

rmdir dir               删除空目录

tree dir                树形结构显示目录，需要安装tree包

pwd                     显示当前目录

ln source dest          创建链接文件

more, less              分页显示文本文件内容，more在当前页面显示，less会跳转到另一个页面进行显示

head, tail              显示文件头、尾内容

    -n count                显示指定行数

chmod perm file         更改文件访问权限

chown username[:groupname] file 更改文件所有者

chgrp groupname file    更改文件所在组

du                      查看目录或文件大小

    -h                      带有单位显示目录信息

df                      查看磁盘使用情况

    -h                      带有单位显示磁盘信息
```

### 系统常用命令

```
man order               查看某个命令的帮助文档

stat                    显示指定文件的详细信息，比ls更详细

who                     显示在线登陆用户

whoami                  显示当前操作用户

hostname                显示主机名

uname                   显示系统信息

top                     动态显示当前耗费资源最多进程信息

ps                      显示瞬间进程状态 ps -aux

ifconfig                查看网络情况

ping                    测试网络连通

netstat                 显示网络状态信息

clear                   清屏

alias                   对命令重命名

unalias                 删除重命名命令

kill -sig PID           杀死进程，可以先用ps 或 top命令查看进程的id，然后再用kill命令杀死进程。

    -1                      HUP (hang up)

    -2                      INT (interrupt)

    -3                      QUIT (quit)

    -6                      ABRT (abort)

    -9                      KILL (non-catchable, non-ignorable kill)

    -14                     ALRM (alarm clock)

    -15                     TERM (software termination signal)
```

### 登入与登出（开关机）

```
telnet ip               远程登录

login                   本机登录

exit                    退出登录

shutdown                关闭计算机

    -r time                 在某时间关机重启

    -h time                 在某时间关闭电源

    now                     立刻关机

reboot                  重启
```

### 打包压缩相关命令

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
例：

tar -cvf /local/test.tar /local/test          只打包，不压缩

tar -zcvf /local/test.tar.gz /local/test      打包，并用gzip压缩

tar -jcvf /local/test.tar.bz2 /local/test     打包，并用bzip2压缩

tar -xvf /local/test.tar /local/test          只拆包

tar -zxvf /local/test.tar.gz /local/test      用gzip解压缩，并拆包

tar -jxvf /local/test.tar.bz2 /local/test     用bzip2解压缩，并拆包

### 后台运行与恢复，时间相关

```
& or [Ctrl]+[z]         将命令置于后台运行

fg                      将后台执行的命令置于前台

date                    获取当前系统时间

cal [month] year        获取某年（某月）日历
```

### 用户及用户组管理

```
/etc/passwd             存储用户账号的文件

/etc/group              存储组账号的文件

useradd username        增加用户，只创建用户名，不创建相应目录

adduser username        增加用户，并创建相应目录

userdel username        删除用户

    -r                  删除用户目录

groupadd groupname      增加组

groupdel groupname      删除组

usermod -g 组名 用户名    修改用户所在组，会覆盖当前组

usermod -G 组名,组名... 用户名 将用户加入多个组

passwd username         给user设置密码

/etc/profile            系统环境变量

.bashrc or .zshrc       用户环境变量
```

以上即为日常生活工作中常用到的Linux命令，更加高深的运维命令还需大家自己进行更加深入的了解和学习。
