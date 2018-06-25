---
title:      "Thrift 简析"
date:       2018-05-30 12:00:00
updated:    2018-06-21 12:00:00
copyright: true
categories:
    - Thrift
tags:
    - RPC
    - Thrift
---

> Thrift 是一种可扩展、跨语言的服务开发框架，用于各个服务之间的 RPC 通信。

### 概述

`Thrift` 最初由 `Facebook` 于 2007 年开发，2008 年进入 `Apache` 开源项目。Thrift 主要用于各个服务之间的 RPC 通信，是一种可扩展、跨语言的 `RPC` 服务开发框架，其服务端和客户端可以用不同的语言来开发。只需要依照 IDL（Interface Description Language）定义一次接口，Thrift 工具就能编译生成 C++, Java, Python, PHP, Ruby, JavaScript, Node.js 等语言的代码。

<!-- more -->

### Thrift 类型

`Thrift` 的类型包括了基本类型，如 `bool`，`byte`，`double`，`string` 和不同长度的 ` 有符号整数 ` 类型；也提供了特殊类型如 `binary`，`enum`，`structs`，容器类型（`list`，`set`，`map`），`exception`，`service`，`const` 等，也支持类型定义。

#### 基本类型

```
bool: 布尔变量
byte: 8 位有符号整数
i16: 16 位有符号整数
i32: 32 位有符号整数
i64: 64 位有符号整数
double: 64 位浮点数
string: 字符串
```

其中 `i16` 类型相当于 `short` 类型，`i32` 类型相当于 `int` 类型，`i64` 类型相当于 `long` 类型。

** 注：Thrift 不支持无符号整数类型，因为很多编程语言不存在无符号类型，比如 Java**

#### 特殊类型

```
binary: 未编码的字节序列
```

#### 枚举类型

```
enum Sex {
    MALE,
    FEMALE
}
```

#### 结构体

结构体中包含一系列的 ` 强类型 ` 域，目的是聚集一系列数据，类似于无继承的类。

```
struct People {
     1: string name,
     2: byte age,
     3: string gender
}
```

#### 容器类型

集合中的类型可以是除了 `service` 之外的任何类型，包括 `exception`。

```
list: 由 T 类型的数据组成的有序列表，元素可以重复
set:  由 T 类型的数据组成的无序集合，元素不可重复
map:  字典结构，key 为 K 类型，value 为 V 类型，键不可重复
```

#### 异常

Thrift 支持自定义 `exception`，规则和 `struct` 类似：

```
exception RequestException {
    1: i32 code,
    2: string reason
}
```

#### 服务

thrift 定义服务相当于 Java 中创建 `Interface`，创建的 `service` 经过代码生成命令之后就会生成客户端和服务端的框架代码。定义形式如下：

```
service HelloWordService {
     // service 中定义的函数，相当于 Java interface 中定义的函数
     string doAction(1: string name, 2: i32 age);
}
```

#### 常量 (const)

thrift 也支持常量定义，使用 `const` 关键字，例如：

```
const i32 MAX_RETRIES_TIME = 10
const string MY_WEBSITE = "http://qifuguang.me"
```

#### 类型定义

thrift 支持类似 C++ 一样的 `typedef` 定义，比如：

```
typedef i32 Integer
typedef i64 Long
```

### Thrift 语法

#### 命名空间

thrift 的命名空间相当于 Java 中的 `package`，主要目的是组织代码。thrift 使用关键字 `namespace` 定义命名空间，例如：

```
namespace java com.winwill.thrift
```

#### 文件包含

thrift 也支持文件包含，相当于 C/C++ 中的 `include`，Java 中的 `import`。使用关键字 `include` 定义，例 如：

```
include "global.thrift"
```

#### 可选与必选

thrift 提供两个关键字 `required`，`optional`，分别用于表示对应的字段时必填的还是可选的。例如：

```
struct People {
    1: required string name;
    2: optional i32 age;
}
```

表示 name 是必需的，age 是可选的。

#### 联合

当一个结构体中，`field` 之间的关系是互斥的，即只能有一个 `field` 可生效被赋值。我们可以用 `union` 来声明这个结构体，而不是一堆堆 `optional` 的 `field`，语意上也更明确了。例如：

```
union JavaObjectArg {
  1: i32 int_arg;
  2: i64 long_arg;
  3: string string_arg;
  4: bool bool_arg;
  5: binary binary_arg;
  6: double double_arg;
}
```

#### 注释

thrift 注释方式支持 shell 风格的注释，支持 C/C++ 风格的注释，即 `#` 和 `//` 开头的语句都单当做注释，`/**/` 包裹的语句也是注释。

```
# 这是一个注释
// 这也是一个注释
/*
 * 这是一个多行注释
 */
struct People {
    1: required string name;
    2: optional i32 age;
}
```

### python2 示例

#### 定义idl

首先我们需要定义一个 `idl` —— `hello.thrift`:

```
/*
thrift接口定义文件
*/
service HelloService {
    string say(1:string msg)
}
```

#### 生成代码

运行命令：

```
thrift -r -gen py hello.thrift
```

会生成一个 `gen-py` 文件夹，里面的 `hello` 文件夹即为生成的服务

#### server端代码

在 `gen-py` 目录中新建 `server.py`

```
# coding: utf-8
"""
thrift_client.py
"""
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer
from thrift.transport import TSocket
from thrift.transport import TTransport

from hello import HelloService


class HelloServiceHandler:
    def say(self, msg):
        ret = "Received: " + msg
        print ret
        return ret


handler = HelloServiceHandler()
processor = HelloService.Processor(handler)
transport = TSocket.TServerSocket("localhost", 9090)
tfactory = TTransport.TBufferedTransportFactory()
pfactory = TBinaryProtocol.TBinaryProtocolFactory()

server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)

print "Starting thrift server in python..."
server.serve()
print "done!"
```

#### client端代码

在 `gen-py` 目录中新建 `client.py`

```
# coding: utf-8
"""
thrift_client.py
"""

from thrift import Thrift
from thrift.protocol import TBinaryProtocol
from thrift.transport import TSocket
from thrift.transport import TTransport

from hello import HelloService

try:
    transport = TSocket.TSocket('localhost', 9090)
    transport = TTransport.TBufferedTransport(transport)
    protocol = TBinaryProtocol.TBinaryProtocol(transport)
    client = HelloService.Client(protocol)
    transport.open()

    print "client - say"
    msg = client.say("Hello!")
    print "server - " + msg

    transport.close()

except Thrift.TException, ex:
    print "%s" % (ex.message)
```

#### 运行结果

```
$ python server.py
Starting thrift server in python...
Received: Hello!

$ ptyhon client.py
client - say
server - Received: Hello!
```

### 参考

1、winwill2010，[Thrift 入门教程](https://blog.csdn.net/winwill2012/article/details/71627886)
2、王博文，[Python Thrift示例](https://blog.csdn.net/dutsoft/article/details/71178655)
