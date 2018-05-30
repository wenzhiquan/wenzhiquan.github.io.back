---
title:      "迁移至 Hexo 博客"
date:       2018-05-04 12:00:00
updated:    2018-05-29 12:00:00
copyright: true
categories:
    - 博客
tags:
    - Hexo
    - NexT
    - 博客
---

> Hexo 是一个快速、简洁且高效的博客框架。Hexo 使用 Markdown（或其他渲染引擎）解析文章，在几秒内，即可利用靓丽的主题生成静态网页。

之前一直使用的是基于 `jekyll` 的博客系统，但是功能不是十分的强大，最近老铁安利了 `Hexo` 这个博客系统，同时也想对自己以前的博文进行整理，所以开始准备将以前基于 `jekyll` 的博文迁移至 `Hexo`。

<!-- more -->

### 前期准备

#### 安装 `git` 和 `node.js`

**安装 Git**:
Windows：下载并安装 [git](https://git-scm.com/download/win)
Mac：`brew install git`
Linux (Ubuntu, Debian)：`sudo apt-get install git-core`
Linux (Fedora, Red Hat, CentOS)：`sudo yum install git-core`

_验证安装_：

```
git version
# 输出：
# git version 2.7.4
```

**安装 node.js**
安装 Node.js 的最佳方式是使用 [nvm](https://github.com/creationix/nvm)。
cURL:

```
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
```

Wget:

```
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
```

安装完成后，重启终端并执行下列命令即可安装 node.js：

```
nvm install stable
```

当然，也可以根据 [官网](https://nodejs.org/en/) 教程进行安装。

_验证安装_：

```
node --version
# 输出：
# v8.11.1
```

#### 安装 `hexo-cli`

```
npm install -g hexo-cli
```

_验证安装_：

```
hexo version
# 输出：
# hexo-cli: 1.1.0
# os: Linux 4.4.0-122-generic linux x64
# http_parser: 2.8.0
# node: 8.11.1
# v8: 6.2.414.50
# uv: 1.19.1
# zlib: 1.2.11
# ares: 1.10.1-DEV
# modules: 57
# nghttp2: 1.25.0
# openssl: 1.0.2o
# icu: 60.1
# unicode: 10.0
# cldr: 32.0
# tz: 2017c
```

恭喜恭喜，至此，`Hexo` 就安装成功啦！

### 备份原博客仓库

因为我是迁移博客，所以要备份一下原来的博客，如果你是新建博客的话，可以跳过这一步。

#### 备份原仓库

```
在 github 中直接将原仓库重命名即可：
blogName.github.io -> blogName.github.io.backup
```

#### 新建空仓库

```
在 github 中创建一个新的仓库：
name: blogName.github.io
```

### 初始化并上传博客

#### 创建本地 `Hexo` 项目

```
# 在用户根目录创建 Hexo 项目
cd ~
hexo init blogName.github.io
cd blogName.github.io
```

#### 关联本地 `Hexo` 项目与 `github`

```
# 将新建的 Hexo 项目进行 git 初始化
git init
git add .
git commit -m "Hexo 博客，第一次提交"

# 将 git 项目与 github 进行关联
git remote add origin git@github.com:yourName/blogName.github.io.git
git push origin master

# 使用 gh-pages 分支开发原代码，master 分支用于放置编译后的站点文件
git checkout -b gh-pages
git push --set-upstream origin gh-pages
```

#### 本地编译并远端部署

```
# 在 blogName.github.io 目录下安装已有插件
npm install

# 安装 Hexo 与 github 的关联插件
npm install hexo-deployer-git --save
```
```yml
# 修改站点配置文件_config
deploy:
  type: git
  repo: git@github.com:yourName/blogName.github.io.git
  branch: master
```
```
# 本地调试
hexo s --debug

# 部署文件到 master 分支，每次更新博文到 github 都要运行这三个命令，建议写成一个脚本
hexo clean
hexo generate
hexo deploy
```

### 安装 NexT 主题

```
# 进入博客项目根目录，创建 next 目录
cd ~/blogName.github.io
mkdir themes/next

# 下载 NexT 主题
curl -s https://api.github.com/repos/theme-next/hexo-theme-next/releases/latest | grep tarball_url | cut -d '"' -f 4 | wget -i - -O- | tar -zx -C themes/next --strip-components=1
```

#### 配置 NexT 主题

请参照 [Hexo 的文档](http://theme-next.iissnan.com/getting-started.html#install-next-theme)

### 增加站内搜索和阅读量统计功能

#### 增加站内搜索功能

```
# 安装相关插件
npm install hexo-generator-searchdb --save
```

```
# 配置站点_config.xml 文件
search:
  path: search.xml
  field: post
  format: html
  limit: 10000

# 配置主题_config.xml 文件
# Local search
local_search:
  enable: true
```

#### 增加阅读量统计功能

请参照 [为 NexT 主题添加文章阅读量统计功能](https://github.com/theme-next/hexo-theme-next/blob/master/docs/zh-CN/LEANCLOUD-COUNTER-SECURITY.md) 一文

### 其他设置

#### 设置 RSS

安装插件：

```
npm install hexo-generator-feed
```

在站点配置文件中进行配置：

```yml
plugin:
- hexo-generator-feed
# Feed configuration.
feed:
  type: atom
  path: atom.xml
  limit: 20
  hub:
  content:
  content_limit: 140
  content_limit_delim: ' '
```

参数的含义：

* `type`: RSS 的类型 (atom/rss2)
* `path`: 文件路径, 默认是 atom.xml/rss2.xml
* `limit`: 展示文章的数量, 使用 0 或则 false 代表展示全部
* `hub`: PubSubHubbub hubs 的 URL，如果不用的话请置为空
* `content`: 在 RSS 文件中是否包含内容 , 有 3 个值 true/false 默认不填为 false
* `content_limit`: 指定内容的长度作为摘要, 仅仅在上面 content 设置为 false 和没有自定义的描述出现
* `content_limit_delim`: 上面截取描述的分隔符, 截取内容是以指定的这个分隔符作为截取结束的标志。在达到规定的内容长度之前最后出现的这个分隔符之前的内容，防止从中间截断.

配置完成后运行 `hexo g`，如果在 `public` 文件夹生成了 `atom.xml` 文件说明添加成功。

#### 设置阅读全文

1. 在文章中使用 `<!-- more -->` 关键字进行手动截断 2. 在主题配置文件中添加

```yml
auto_excerpt:
  enable: true
  length: 150
```

#### 设置阅读百分比

```yml
# 在主题配置文件中进行设置
scrollpercent: true
```

#### 添加打赏功能

```yml
# 在主题配置文件中进行设置
reward_comment: 坚持原创技术分享，您的支持将鼓励我继续创作！
wechatpay: /images/wechatpay.jpg
alipay: /images/alipay.jpg
```

#### 添加菜单选项

##### 生成页面

在 `blogName.github.io` 目录下调用命令：

```
# 添加分类页面
hexo new page "categories"
# 添加标签页面
hexo new page “tags”
# 添加关于页面
hexo new page "about"
```

执行完指令后，在 `/source/` 文件夹下创建三个文件夹，命名分别为：`categories`、`tags`、`about` 文件夹

##### 修改页面

```
---
title: 分类
date: 2018-05-04 12:06:24
type: "categories"
---
```

```
---
title: 标签
date: 2018-05-04 12:07:36
type: "tags"
---
```

```
---
title: 关于我
date: 2018-05-04 12:08:27
type: "about"
---
```

在文章开头添加关键字即可生成相应的 ` 分类 ` 和 ` 标签 `：

```
---
title:      "迁移至 Hexo 博客"
date:       2018-05-04 12:00:00
categories:
    - 博客
tags:
    - Hexo
    - NexT
---
```

#### 添加社交链接

在主题配置文件中修改 `social` 属性：

```yml
social:
  GitHub: https://github.com/yourname || github
  知乎: https://www.zhihu.com/people/wenzhiquan/activities
  E-Mail: mailto:wenzhiquanr@163.com || envelope
  FB Page: https://www.facebook.com/profile.php?id=100006943363300 || facebook
```

#### 添加友情链接

在主题配置文件中修改 `links` 属性

```yml
# Blog rolls
links_icon: link
links_title: 友情链接
links_layout: block
#links_layout: inline
links:
  肖楚天的博客: https://xiaochutian.github.io/
```

#### 添加近期文章

在 `theme/next/layout/_macro/sidebar.swig` 中的 `if theme.links` 前面添加：

```
{% if theme.recent_posts %}
    <div class="links-of-blogroll motion-element {{"links-of-blogroll-"+ theme.recent_posts_layout}}">
      <div class="links-of-blogroll-title">
        <!-- modify icon to fire by szw -->
        <i class="fa fa-history fa-{{ theme.recent_posts_icon | lower}}" aria-hidden="true"></i>
        {{theme.recent_posts_title}}
      </div>
      <ul class="links-of-blogroll-list">
        {% set posts = site.posts.sort('-date') %}
        {% for post in posts.slice('0', '5') %}
          <li>
            <a href="{{ url_for(post.path) }}" title="{{ post.title }}">{{ post.title }}</a>
          </li>
        {% endfor %}
      </ul>
    </div>
{% endif %}
```

并在主题配置文件中添加：

```yml
recent_posts_title: 近期文章
recent_posts_layout: block
recent_posts: true
```

使用 `hexo g` 命令重新生成后即可显示

#### 添加字数统计

安装插件：

```
npm install hexo-symbols-count-time --save
```

然后在`站点配置文件`加入：

```yml
symbols_count_time:
  total_symbols: true
  total_time: true
```

并在`主题配置文件配置`：

```yml
symbols_count_time:
  separated_meta: true
  item_text_post: true
  item_text_total: true
  awl: 2
  wpm: 275
```

#### 打赏字体不闪动

修改文件 `next/source/css/_common/components/post/post-reward.styl`，然后注释其中的函数 `wechat:hover` 和 `alipay:hover`，如下：

```
//#wechat:hover p{
//    animation: roll 0.1s infinite linear;
//    -webkit-animation: roll 0.1s infinite linear;
//    -moz-animation: roll 0.1s infinite linear;
//}
//#alipay:hover p{
//    animation: roll 0.1s infinite linear;
//    -webkit-animation: roll 0.1s infinite linear;
//    -moz-animation: roll 0.1s infinite linear;
//}
```

#### 进度条

```yml
# 在主题配置文件中配置
pace: true
```

如果还想继续对博客主题进行配置，请访问我的参考网站。

### 参考

1、Moorez，[hexo 的 next 主题个性化教程: 打造炫酷网站](https://www.jianshu.com/p/f054333ac9e6)

2、[hexo 的 next 主题个性化配置教程](https://segmentfault.com/a/1190000009544924)

3、sunshine 小小倩，[hexo 高阶教程](https://juejin.im/post/58eb2fd2a0bb9f006928f8c7#heading-16)

4、[打造个性超赞博客 Hexo+NexT+GithubPages 的超深度优化](https://reuixiy.github.io/technology/computer/computer-aided-art/2017/06/09/hexo-next-optimization.html)
