---
layout:     post
title:      "Mac OS安装jekyll"
date:        2015-03-19 14:00:00
copyright: true
categories:
    - Mac
tags:
    - Jekyll
    - 博客
---

> “jekyll 是一款简单的博客系统，静态网站生成器。”

### 概述

jekyll 是一款简单的博客系统，静态网站生成器。她有一个模版目录，存放整个静态网站的模版文件，可以通过[Liquid](https://github.com/shopify/liquid/wiki "Liquid")处理模版文件，把使用标记语言[Textile](http://en.wikipedia.org/wiki/Textile "Textile")或[Markdown](http://en.wikipedia.org/wiki/Markdown "Markdown")编写的内容文件，按照模版格式，转换成最终的静态网站页面。大名鼎鼎的GitHub Pages就是通过它实现的。搭建好我们的博客系统之后，我们还可以把它放到github的pages上进行展示。

<!-- more -->

### 安装Homebrew

使用Mac的程序员必不可少的一步便是安装Homebrew，他就像是centOS的`yum`命令和ubuntu的`apt-get`命令一样，通过`brew`命令，我们可以快速的安装一些软件包。
使用命令行安装Homebrew的命令如下：

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### 安装最新版ruby

Homebrew安装完成之后，使用它来安装最新版本的ruby，代码如下：

```
brew install ruby
```

安装完成之后，会提示安装好的ruby目录为`/usr/local/Cellar/ruby/2.2.0`,我用的shell为zsh，所以想要最新安装的ruby生效，需要将`~/.zshrc`配置文件中的环境变量`PATH`中添加上新版本ruby的目录，在`PATH`后添加上ruby安装目录的`bin`文件夹，如下：

```
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/Cellar/ruby/2.2.0/bin"
```

然后输入命令`source ~/.zshrc`，再使用ruby就是最新版本了。

输入命令`ruby --version`查看ruby版本：

```
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```
如果，版本不对，就使用命令`echo $PATH`查看最新版本的ruby目录是否在环境变量`PATH`中，如果不对，就按照上述过程修改环境变量`PATH`。

### 安装jkeyll

安装最新版本的jekyll，命令如下：

```
gem install jekyll
```

因为我们将会使用Markdown语言作为标记语言，所以还需要安装kramdown，命令如下：

```
gem install kramdown
```

至此，本机的jekyll运行环境就已经搭建好了

### 运行例子

安装好之后，就可以自己构建一个博客系统，或者也可以到[jekyll模板网站]( http://jekyllthemes.org/ "jekyll 模板网站") 下载自己喜欢的模板进行修改，然后运行并查看效果，要运行jekyll首先要进入博客的根目录，然后运行命令`jekyll server`，最后会显示启动信息：

```
Server address: http://127.0.0.1:4000/
Server running... press ctrl-c to stop.
```

说明程序已经成功启动，在浏览器中输入localhost:4000，就可以查看自己的博客了。
