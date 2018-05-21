---
layout:     post
title:      "Mac OS上搭建Nginx,Mysql,PHP开发环境"
date:       2015-05-29 14:00:00
copyright: true
categories:
    - PHP
tags:
    - PHP
    - Mac
    - Nginx
    - Mysql
---

> “LNMP开发环境是PHP语言开发网站的主流环境。”

### 概述

LNMP代表的就是：Linux系统下Nginx+MySQL+PHP这种网站服务器架构。Linux是一类Unix计算机操作系统的统称，是目前最流行的免费操作系统。代表版本有：debian、centos、ubuntu、fedora、gentoo等。[Nginx](http://nginx.org/)是一个高性能的HTTP和反向代理服务器，也是一个IMAP/POP3/SMTP代理服务器。[Mysql](http://www.mysql.com/)是一个小型关系型数据库管理系统。[PHP](http://php.net/)是一种在服务器端执行的嵌入HTML文档的脚本语言。这四种软件均为免费开源软件，组合到一起，成为一个免费、高效、扩展性强的网站服务系统。

<!-- more -->

### 安装Homebrew

使用Mac的程序员必不可少的一步便是安装Homebrew，他就像是centOS的`yum`命令和ubuntu的`apt-get`命令一样，通过`brew`命令，我们可以快速的安装一些软件包。
使用命令行安装Homebrew的命令如下：

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

使用`brew doctor`检查是否存在冲突，然后使用`brew update && brew upgrade`对brew进行升级。

### 安装nginx

nginx在Mac OS中可以直接使用brew命令进行安装：

```
brew install nginx
```

如果需要使用80端口的话，需要将nginx加入root组当中：

```
sudo cp -v /usr/local/opt/nginx/*.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
```

然后使用命令启动nginx服务：

```
sudo nginx
```

测试nginx是否安装成功，因为默认配置文件监听的是`8080`端口，所以先对`8080`端口发起请求：

```
curl -IL http://127.0.0.1:8080
```

结果应该类似于下：

```
HTTP/1.1 200 OK
Server: nginx/1.9.1
Date: Fri, 29 May 2015 14:50:47 GMT
Content-Type: text/html
Content-Length: 612
Last-Modified: Fri, 29 May 2015 14:40:47 GMT
Connection: keep-alive
ETag: "5444dea7-264"
Accept-Ranges: bytes
```

nginx的相关操作如下：

```
sudo nginx //启动nginx
sudo nginx -s reload|reopen|quit //重新加载|重启|退出
```

### 安装php-fpm

因为brew并没有php-fpm的源，所以首先要添加源：

```
brew tap homebrew/dupes
brew tap homebrew/php
```

然后安装php-fpm，输入命令:

```
brew install php56 --whitout-apache --with-imap --with-tidy --with-debug --with-pgsql --with-mysql --with-fpm
```

程序会自动安装，等待几分钟后完成安装。

安装完成后，还需要将php加入`$PATH`当中：

```
# 如果使用bash的话
vim ~/.bash_profile
export PATH="/usr/local/sbin:$PATH"
source ~/.bash_profile

# 如果使用ZSH的话
vim ~/.zshrc
export PATH="/usr/local/sbin:$PATH"
source ~/.zshrc
```

然后可以设置php-fpm的开机自启动：

```
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/php56/homebrew.mxcl.php56.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist
```

使用以下命令监测php-fpm是否启动成功：

```
lsof -Pni4 | grep LISTEN | grep php
```

如果启动成功应当有以下类似输出：

```
php-fpm   27578 wenzhiquan    9u  IPv4 0xf29f8b26c08fc27      0t0  TCP 127.0.0.1:9000 (LISTEN)
php-fpm   27628 wenzhiquan    0u  IPv4 0xf29f8b26c08fc27      0t0  TCP 127.0.0.1:9000 (LISTEN)
php-fpm   27629 wenzhiquan    0u  IPv4 0xf29f8b26c08fc27      0t0  TCP 127.0.0.1:9000 (LISTEN)
php-fpm   27630 wenzhiquan    0u  IPv4 0xf29f8b26c08fc27      0t0  TCP 127.0.0.1:9000 (LISTEN)
```

### 安装MySQL

MySQL也可以使用brew命令直接进行安装：

```
brew install mysql
```

同样，可以设置MySQL的开机自启动：

```
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
```

然后进行MySQL的安全安装，使用以下命令，可以更改root密码、删除匿名用户、关闭远程连接等：

```
mysql_secure_installation
```

然后会输出以下内容：

```
> Enter current password for root (enter for none):		//默认没有密码，直接回车即可
> Change the root password? [Y/n]						//是否更改root密码，选择是，然后输入并确认密码
> Remove anonymous users? [Y/n]							//是否删除匿名用户，选择是
> Disallow root login remotely? [Y/n]					//是否禁止远程登录，选择是
> Remove test database and access to it? [Y/n]			//是否删除test数据库，选择是
> Reload privilege tables now? [Y/n]					//是否重载表格数据，选择是

```

测试数据库是否安装成功：

```
mysql -u root -p
```

然后输入刚才设置的root密码，将会输出以下内容：

```
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> exit			//输入exit退出数据库
```

### 配置nginx

首先，为我们的配置文件创建一些文件夹，这些是仿照ubuntu的nginx结构进行建立的目录：

```
mkdir -p /usr/local/etc/nginx/logs
mkdir -p /usr/local/etc/nginx/sites-available
mkdir -p /usr/local/etc/nginx/sites-enabled
mkdir -p /usr/local/etc/nginx/conf.d
mkdir -p /usr/local/etc/nginx/ssl

sudo mkdir -p /var/www
sudo chown :staff /var/www
sudo chmod 775 /var/www
```

然后修改nginx配置文件：

```
vim /usr/local/etc/nginx/nginx.conf
```

将内容替换为：

```
worker_processes  1;

error_log  /usr/local/etc/nginx/logs/error.log debug;

events {
    worker_connections  1024;
}

http {
    include             mime.types;
    default_type        application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /usr/local/etc/nginx/logs/access.log  main;

    sendfile            on;

    keepalive_timeout   65;

    index index.html index.php;

    include /usr/local/etc/nginx/sites-enabled/*;
}
```

然后创建php-fpm配置文件：

```
vim /usr/local/ect/nginx/conf.d/php-fpm
```

输入以下内容：

```
location ~ \.php$ {
    try_files      $uri = 404;
    fastcgi_pass   127.0.0.1:9000;
    fastcgi_index  index.php;
    fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
    include        fastcgi_params;
}
```

然后加入站点配置文件：

```
vim /usr/local/ect/nginx/sites-enabled/default
```

输入以下内容：

```
server {
    listen       80;
    server_name  localhost;
    root       /var/www/;

    access_log  /usr/local/etc/nginx/logs/default.access.log  main;

    location / {
        include   /usr/local/etc/nginx/conf.d/php-fpm;
    }

    location = /info {
        allow   127.0.0.1;
        deny    all;
        rewrite (.*) /.info.php;
    }

    error_page  404     /404.html;
    error_page  403     /403.html;
}
```

重启nginx，至此，配置完成，在www下写一个测试文件，进行测试即可

**尽情的享受在Mac OS开发PHP的快感吧！**
