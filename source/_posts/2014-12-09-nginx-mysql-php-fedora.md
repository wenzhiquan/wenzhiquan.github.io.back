---
layout:     post
title:      "fedora22 配置Nginx,Mysql,PHP"
date:       2014-12-09 14:00:00
copyright: true
categories:
    - PHP
tags:
    - PHP
    - Fedora
    - Nginx
    - Mysql
---

> “LNMP开发环境是PHP语言开发网站的主流环境。”

### 安装nginx

nginx在fedora当中是一个默认包，所以直接使用命令行进行安装即可：

```
sudo dnf install nginx -y
```

<!-- more -->

然后启动nginx服务：

```
sudo service nginx start
```

当然，也可以设置他为开机启动：

```
sudo systemctl enable nginx.service
```

然后在你的浏览器当中输入localhost，如果看到以下界面即为安装成功：

![nginx success](/uploads/in-post/nginx_sccess.png  "nginx success")

### 安装MySQL

mysql在fedora当中叫做MariaDB，但是也可以用安装mysql的命令直接进行安装：

```
sudo dnf install mysql mysql-server -y
```

然后启动mysql服务：

```
sudo service mariadb start
```

当然，也可以设置他为开机启动：

```
sudo systemctl enable mariadb.service
```

然后输入命令：

```
sudo netstat -tap | grep mysql
```

如果出现以下代码，说明启动成功：

```
tcp        0      0 0.0.0.0:mysql           0.0.0.0:*               LISTEN
 5464/mysqld
```

启动成功后，我们需要给root用户设置一个密码，以防止任何人都可以访问我们的数据库：

```
mysqladmin -u root password "root"
```

### 安装PHP

我们可以让PHP5在nginx中以FastCGI的模式工作。

```
sudo dnf install php lighttpd-fastcgi php-devel php-fpm php-mysql -y
```

然后启动php-fpm服务：

```
sudo service php-fpm start
```

当然，也可以设置他为开机启动：

```
sudo systemctl enable php-fpm.service
```

启动之后，还需要配置nginx使之支持php

### 配置nginx支持php

首先备份原先的conf文件

```
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
```

然后复制一份配置文件

```
cp /etc/nginx/nginx.conf.default /etc/nginx/nginx.conf
```

新建两个目录用于分别存放可用和生效的配置文件

```
mkdir -p /etc/nginx/sites-avaliable
mkdir -p /etc/nginx/sites-enabled
```
这两个目录是模仿Ubuntu的nginx目录进行创建的，其中sites-analiable文件夹用于存放所有可用的server配置，sites-enabled文件夹用于存放生效的server配置

修改nginx配置文件，添加fastcgi支持

```
 vim /etc/nginx/nginx.conf
```

将文件修改为以下内容：

```
# For more information on configuration, see:
#   * Official English Documentation: http://nginx.org/en/docs/
#   * Official Russian Documentation: http://nginx.org/ru/docs/

user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log;
#error_log  /var/log/nginx/error.log  notice;
#error_log  /var/log/nginx/error.log  info;

pid        /run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  65;

    #gzip  on;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}
```

文件将从conf.d和sites-enabled文件夹中读取所有的server配置，首先需要在sites-avaliable文件夹中建立可用的server配置，然后软链接到sites-enabled文件夹中，这样就可以修改可用配置时，生效配置也会修改，但是删除生效配置时不会对可用配置造成影响：

```
vim /etc/nginx/sites-avaliable/default
```

将其修改为以下内容：

```
#
# The default server
#
server {
    listen       80;
    server_name  localhost; # or other domain name you like.
    #include /data/www/.htaccess;
    charset utf-8;

    #access_log  logs/host.access.log  main;

	root /usr/share/nginx/html;//这里是web项目文件夹的根目录

	include /etc/nginx/default.d/*.conf;//这个配置文件是安装php和php-fpm时自动生成的，是对nginx针对php的配置

   location / {
        #try_files $uri $uri/ /index.php?$args;
    }

    error_page  404              /404.html;
    location = /404.html {
    }

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
    }
}

```

然后在sites-enabled文件夹中建立可用配置的软链接即可
```
ln -s /etc/nginx/sites-avaliable/default /etc/nginx/sites-enabled/
```

具体的其他nginx相关配置可以详见[nginx官方网站](http://nginx.org/en/docs/)


另外，如果php报与时区相关的错误，则需要修改/etc/php.ini文件，在其中`[Date]`标签下加入一行`date.timezone = 'Asia/Shanghai'`即可

### 测试

每次配置nginx文件后，都需要将其进行重启：

```
sudo service nginx restart
```

每次配置php.ini文件后，也需要将其进行重启：

```
sudo service php-fpm restart
```

然后建立index.php文件进行测试：

```
vim /usr/share/nginx/html/info.php

<?php
   phpinfo();
?>
```

然后在浏览器中输入servername进行测试：

```
输入：localhost/info.php
显示phpinfo界面说明解析成功
```
