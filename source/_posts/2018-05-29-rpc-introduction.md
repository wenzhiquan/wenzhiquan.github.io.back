---
title:      "RPC 简析"
date:       2018-05-29 12:00:00
updated:    2018-05-29 12:00:00
copyright: true
categories:
    - RPC
tags:
    - RPC
---

> RPC 的主要功能目标是让构建分布式计算（应用）更容易，在提供强大的远程调用能力时不损失本地调用的语义简洁性。

### 概述

#### 什么是 `RPC`

`RPC`，全称为 `Remote Procedure Call`，即远程过程调用，是一种进程间的通信方式。它能够实现从主机 A 调用可达地址空间中另一台主机 B 上的过程或函数，而程序员并不需要显示的编码其调用过程。也即是说对于程序员来说，这个调用过程是透明的，本地调用和远程调用所用代码基本是相同的。

<!-- more -->

RPC 的调用过程如下图：

![RPC 调用过程](/uploads/in-post/rpc-introduction/RPC.png)

1. `client` 以本地调用的方式发起一个远程调用

2. 本地的 `client stub ` 接收到调用请求后，将调用的接口、方法和参数通过约定的协议规范进行序列化（* 网络协议基于二进制，需要将内存中的值序列化成为二进制的形式 *）

3. 本地的 `RPC` 实例将编码结果传输到远端（被调用端）的 `RPC` 实例

4. 远端 `RPC` 实例收到请求后交给 `server stub` 进行反序列化

5. `server stub` 调用 `server` 端本地服务

6. `server stub` 获取到本地服务的的返回结果后进行序列化

7. `server` 端的 `RPC` 实例将结果返回给 `client` 端

8. `client` 端接收到返回值后进行反序列化，并将最终的结果返回给发起调用的函数

可以看出 `RPC` 调用采用的是 `C/S` 模式。

#### `RPC` 需要解决的问题

+ 通讯的问题

  - 主要是通过在客户端和服务器之间建立 TCP 连接，并通过 TCP 连接进行数据交换

+ 寻址的问题

  - 即 A 服务器上的应用如何告诉底层的 `RPC` 框架，如何连接到 B 服务器的特定端口并调用其特定的方法，比如基于 `Web` 服务协议栈的 `RPC，需要提供一个 ` `endpoint URI ` 或是从 `UDDI` 服务上查找

+ 参数的序列化和反序列化

  - 由于方法的参数需要通过底层的网络协议进行传递，而网络协议是基于二进制的，所以需要将内存中参数的值序列化为二进制的形式，并且需要将接收到的二进制数据反序列化恢复为原来内存中的表达方式。

### RPC 调用分类

根据 `Client` 端发起调用后是否等待服务端的返回结果，可以将 `RPC` 调用分为以下两种：

#### 同步调用

`Client` 端发起请求后，挂起本地进程，直到 `Server` 端运行完毕并返回结果后，唤醒进程继续执行。

#### 异步调用

`Client` 端发起请求后，不等待 `Server` 端的执行结果，继续运行进程。

若 `Client` 端需要获取结果，可以通过回调通知等方法获取执行结果。

若 `Client` 端不需要获取结果，则为单向异步调用，只触发 `Server` 端的函数执行。

### Python 2 简单示例

Server 端：

```
# -*- coding: utf-8 -*-

from SimpleXMLRPCServer import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler

# 自定义 RPC 调用地址
class RequestHandler(SimpleXMLRPCRequestHandler):
    rpc_paths = ('/RPC2',)

port = 8080

# 绑定本地端口 8080 初始化 server
server = SimpleXMLRPCServer(('localhost', port), requestHandler=RequestHandler)
# 注册一个自省的 XML-RPC 函数
server.register_introspection_functions()
# 注册一个多调用组合
server.register_multicall_functions()

def add(x, y):
    return x + y

# 注册调用函数, 可以创建别名
server.register_function(add, 'addAlias')

class MyFuncs:

    def __init__(self):
        return

    def div(self, x, y):
        return x // y

# 注册调用实例, 所有方法将以 XML-RPC 的方式进行发布
server.register_instance(MyFuncs())

print "Listening on port" + str(port)

# 开启 server
server.serve_forever()
```

Client 端：

```
import xmlrpclib

port = 8080

server = xmlrpclib.ServerProxy("http://localhost:" + str(port))

print server
multi = xmlrpclib.MultiCall(server)
multi.addAlias(5, 1)
multi.div(24, 11)
try:
    for response in multi():
        print "Result is :" + str(response)
except xmlrpclib.Error, e:
    print "ERROR", e
```

输出结果为：

```
# Server:
127.0.0.1 - - [30/May/2018 10:36:19] "POST /RPC2 HTTP/1.1" 200 -

# Client
<ServerProxy for localhost:8080/RPC2>
Result is : 6
Result is : 2
```

### 参考

1、Mindwind，[深入浅出 RPC - 浅出篇](https://blog.csdn.net/mindfloating/article/details/39473807)

2、Mindwind，[深入浅出 RPC - 深入篇](https://blog.csdn.net/mindfloating/article/details/39474123)

3、Way Lau，[远程过程调用 (RPC) 详解](https://waylau.com/remote-procedure-calls/)

4、zhanlijun，[你应该知道的RPC原理](https://www.cnblogs.com/LBSer/p/4853234.html)
