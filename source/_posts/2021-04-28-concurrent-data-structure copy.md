---
layout: post
title: "Golang 并发数据结构和算法实践"
date: 2021-04-28 12:00:00
updated: 2021-04-28 12:00:00
copyright: true
categories:
  - Golang
tags:
  - Golang
---
# 说在前面
云浩老师这门课程中，从引入 Golang 本身数据结构对多核性能使用不足的场景讲起，然后由并发安全问题讲起，阐述了解决并发问题的通用方案，并基于此，提出了有序链表的并行化方案，由猜想到验证一步一步引导我们实现一个在多核场景下 scalable 的数据结构，由浅入深，令人印象深刻。

# 并发安全问题
并发安全问题，表现为对一个变量发生更改的同时有另一个线程对同一个变量进行了读写，导致产生了不可预知的行为，也叫 data race

<!-- more -->

认定可能发生 data race 的条件是：有两个或以上 goroutine 同时接触一个变量，其中至少有一个 goroutine 为写操作

Golang 为我们提供了检查 data race 的方式，就是 `-race` 参数，我们可以使用
`go run -race` 或者 `go test -race` 来检测我们的代码中是否存在 data race

解决方案：
1. 单个变量一写多读 -> atomic
2. 单个变量多写多读 -> sync.Mutex
3. 多个变量多写多读 -> sync.Mutex

# 有序链表并行化

插入：
![](/uploads/in-post/concurrent-data-structure/insert.png)
第二步的时候还需要检查 A.marked 是否为 true，如果是的话说明 A 已经被别的节点删除了，此时也需要解锁 Aing 返回 step 1

删除：
![](/uploads/in-post/concurrent-data-structure/delete.png)

读取：
![](/uploads/in-post/concurrent-data-structure/read.png)

到此并发有序链表就实现完成了，其优缺点如下：
1. 优点
- 将写操作限制在某个区域，区域内⼀一写多读，全局并发读写
- 读操作完全⽆无锁，使⽤用 atomic 可以⽆无限制访问节点
2. 缺点
- 查询过程只能遍历链表，成本较⾼

# skiplist 并行化
针对上述并发有序链表的缺点，可以使用跳表来提升查询性能：

![](/uploads/in-post/concurrent-data-structure/skiplist.png)

# 总结
上述数据结构的适用场景如下：
- 实例核数较多
- 并发读写中，读操作占比更大
- 需要元素始终有序
- 内存敏感（占用内存只有 sync.Map 的一般）

## 开源实现
[我的实现（非跳表）](/uploads/in-post/concurrent-data-structure/concurrentOrderedLinkList.zip)
skipset: <https://github.com/zhangyunhao116/skipset>
skipmap: <https://github.com/zhangyunhao116/skipmap>
fastrand: <https://github.com/zhangyunhao116/fastrand>