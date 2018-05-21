---
layout:     post
title:      "Fedora 20 安装gitolite"
date:       2014-10-14 13:00:00
copyright: true
categories:
    - Git
tags:
    - Fedora
---

> “git本地化之后，可能会用到权限管理，gitolite就是一个强大的权限管理工具”

### gitolite安装先决条件

关于`git`和`ssh`登录的基础知识，网上已经有很多很好的文章，在这里就不再加以赘述了。

#### 安装git

要安装`gitolite`，首先要安装`git`:

```
sudo yum install git
```

<!-- more -->

#### 创建git用户组和git用户

然后，需要新建用户和用户组`git`，以方便所有用户使用`git`账户进行登录：

```
# 添加git用户组
sudo groupadd git

# 创建新用户git并将其添加到用户组git之中
sudo adduser -g git git

# 修改用户git的密码
sudo passwd git
```

#### 创建管理员密钥

由于初始化`gitolite`需要一个管理员的公钥，所以需要创建一个`key`:

```
# 为名为“yourname”的账户生成相应的key
ssh-keygen -t rsa -C "yourname"

# 选择存储key的位置及key文件名称
Enter file in which to save the key (/home/user/.ssh/id_rsa): /home/user/.ssh/yourname
Enter passphrase (empty for no passphrase): #为你的key创建密码，一般不需要，回车即可
Enter same passphrase again: #回车即可

# 最后输出类似的结果表示key生成成功
...
The key's randomart image is:
+--[ RSA 2048]----+
|    . .          |
|     = .         |
|  . o E          |
| o o = o         |
|  o o = S        |
|   . + B.        |
|    . =o.        |
|     .o.         |
|     .oo.        |
+-----------------+
```

#### 将公钥上传到git用户中

生成`key`之后，需要将其上传到`git`用户之中：

```
# 将公钥上传到git用户中
scp /home/user/.ssh/yourname.pub git@localhost:/tmp

ECDSA key fingerprint is 77:ad:e9:c2:e3:9f:bc:eb:38:42:e8:24:4f:b4:4a:a9.
Are you sure you want to continue connecting (yes/no)? yes
```

若此时出现错误：

```
ssh: connect to host 127.0.0.1 port 22: Connection refused
lost connection
```

则说明`ssh`服务没有打开，需要开启`ssh`服务：

```
# 开启ssh服务
sudo service sshd start

# 开机启动ssh服务
sudo systemctl enable sshd.service
```

除此之外，要让局域网内的用户能够访问`git`服务器，需要关闭防火墙：

```
sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service
```

### 安装gitolite

#### 进入git用户并创建bin目录

安装`gitolite`的操作需要在`git`用户下进行，首先需要切换到`git`用户：

```
su git
```

输入密码后，需要切换到`git`用户的用户根目录下创建`bin`文件夹：

```
cd ~

# 创建bin文件夹是为了将gitolite安装到其中便于认知和管理
mkdir bin
```

#### 克隆gitolite并安装

我们需要从`github`中克隆`gitolite`的官方仓库进行安装：

```
# 克隆gitolite仓库
git clone git://github.com/sitaramc/gitolite

#将gitolite安装到bin目录下
./gitolite/install -to ~/bin/
```

安装`gitolite`的时候，可能会出现错误：

```
Can't locate Data/Dumper.pm in @INC
```

这是由于没有安装相应的`perl`包所导致的，需要切换回非`git`用户进行安装，使用命令：

```
# 使用CPAN安装perl包
sudo perl -MCPAN -e shell

cpan[1]> install Data::Dumper
```

如果是首次使用`CPAN`会进行一定的配置，在询问是否自动配置处输入`yes`即可。

使用`CPAN`时可能出现错误：

```
Can't locate CPAN.pm in @INC
```

这是由于没有安装`CPAN`出现的错误，使用命令：

```
sudo yum install perl-CPAN
```

安装完成后，应该会自动集成`Data::Dumper`包。

回到`git`用户，安装`gitolite`后，`bin`文件夹中会出现相应的文件，到此，`gitolite`就安装成功了。

#### 使用公钥初始化gitolite

完成安装`gitolite`后，需要使用刚才上传的公钥将`gitolite`进行初始化，这个公钥的所有者将成为`gitolite`的第一个管理员, 在`git`用户根目录下，使用命令：

```
# 使用yourname.pub对gitolite进行初始化
./bin/gitolite setup -pk yourname.pub

初始化空的 Git 版本库于 /home/git/repositories/gitolite-admin.git/
初始化空的 Git 版本库于 /home/git/repositories/testing.git/
WARNING: /home/git/.ssh missing; creating a new one
    (this is normal on a brand new install)
WARNING: /home/git/.ssh/authorized_keys missing; creating a new one
    (this is normal on a brand new install)
```

到此为止，`gitolite`的初始化已经完成。

### 添加gitolite的用户和仓库

不要手动在`git`服务器中添加新用户或者新仓库。因为`gitolite`的用户，仓库和权限规则都是使用一个名为`gitolite-admin`的特殊仓库进行维护的，想要进行修改，就需要通过修改该仓库的文件并`push`到服务器当中。

要添加用户和仓库，首先需要退出`git`用户后，将`gitolite-admin`克隆到本地:

```
# 退出git用户
exit

# 将gitolite-admin仓库克隆到本地
git clone git@localhost:gitolite-admin
```

进入`gtiolite`目录后，可以看到两个子目录`conf`和`keydir`，`conf/gitolite.conf`用于修改仓库，用户及其权限，`keydir`用于存放用户的公钥。

为了增加新用户`alice`，`bob`和`carol`， 首先需要获取他们的公钥（alice.pub，bob.pub和carol.pub），并添加到`keydir`文件夹当中。

为了增加新仓库`foo`，并赋予这些用户不同的权限，修改`conf/gitolite.conf`文件：

```
repo foo
    RW+         =   alice
    RW          =   bob
    R           =   carol
```

进行修改之后，需要将改动上传到服务器使其生效：

```
git add conf
git add keydir
git commit -m "added foo, gave access to alice, bob, carol"
git push
```

当`git`的`push`操作成功后，`gitolite`将会把新用户添加到服务器的`~/.ssh/authorized_keys`文件中，然后会新建一个名为`foo`的空仓库。

### 进阶操作

#### 权限管理

`gitolite`的权限管理非常强大，之前展示的只是最简单的权限管理，下面是更加深入一些的管理：

```
repo foo
    RW+                     =   alice
    -   master              =   bob
    -   refs/tags/v[0-9]    =   bob
    RW                      =   bob
    RW  refs/tags/v[0-9]    =   carol
    R                       =   dave
```

下面对上述规则进行阐述：

* `alice`能够对仓库进行所有的操作。

* `bob`能够创建和推送任何名字不为`master`的分支，并能够添加任何不以`v+数字`开头的`tag`。

* `carol`能够添加任何以`v+数字`开头的`tag`。

* `dave`能够进行`clone`和`fetch`操作。

更加详细的权限管理请看[官方文档](http://gitolite.com/gitolite/gitolite.html"gitolite官方文档")。

#### 组

`gitolite`允许创建用户组：

```
@staff      =   alice bob carol
@interns    =   ashok

repo secret
    RW      =   @staff

repo foss
    RW+     =   @staff
    RW      =   @interns
```

用户组是可以堆叠的，下面的写法和上方的`@staff`是相同的：

```
@staff      =   alice bob
@staff      =   carol
```

同样的，也可以将用户组添加到另一个用户组当中：

```
@all-devs   =   @staff @interns
```

此外，`gitolite`有一个特殊的用户组，名为`@all`，他表示所有的用户。
