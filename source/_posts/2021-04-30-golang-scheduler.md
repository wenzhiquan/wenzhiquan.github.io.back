---
layout: post
title: "Golang scheduler 浅析"
date: 2021-04-30 12:00:00
updated: 2021-04-30 12:00:00
copyright: true
categories:
  - Golang
tags:
  - Golang
---
# 说在前面
饶老师从一个故事讲起，引出了调度器的概念和 Golang 的调度器模型，并深入的讲解了 Golang 的循环调度的实现和抢占式调度的实现，不禁令人感叹，Golang 的循环调度为我们的岁月静好负重前行。

# 循环调度的建立
所谓对 goroutine 的调度，实际上就是指 Golang 程序代码按照内置的一些算法，在运行时动态的选择合适的 goroutine 放到 CPU 上去执行的过程， 其本质是通过保存和恢复 CPU 寄存器的值达到切换 goroutine 的目的。

<!-- more -->

![](/uploads/in-post/golang-scheduler/schedule.png)

## GM 模型与 GMP 模型

![](/uploads/in-post/golang-scheduler/gm-model.png)

由于全局只有一个 global 队列，所有新创建的 goroutine 都会存放到这个队列中（即使是 goroutine 创建的子 goroutine），导致 GM 模型存在以下问题：
- 全局互斥锁
- Goroutine 传递问题
- 每个 M 持有内存缓存

为了解决这个问题，引入一个中间层，即引入本队可运行队列 P，成为现在的 GMP 模型：

![](/uploads/in-post/golang-scheduler/gmp-model.png)

G 为执行代码的基本单元，P 为逻辑 Processor，M 代表一个线程，可以理解为“物理 Processor”，新建的 G 都会优先放入到本地 P 队列中，如果满了会放到 Global 队列中，如果执行完了本队列的所有 G，还会从其他的 P 中 steal 一半的 G 到本地队列中运行以提升性能，其执行流程如下：

![](/uploads/in-post/golang-scheduler/gmp-schedule.png)

## 循环调度的建立
循环调度主要由四个主要步骤组成：
1. osinit 计算 CPU 总数，初始化主线程栈
2. schedinit 确定 M 总数，初始化 g0 栈
3. make & queue new g 创建用于执行的 goroutine 栈
4. mstart 开始执行调度

![](/uploads/in-post/golang-scheduler/schedule-loop.png)

# 协作与抢占
Golang 是在 1.14 之后才实现了抢占式调度的，如果调度 goroutine 的时候发生了 gc 会导致整个程序卡死，这个坑我们需要格外注意。

协作式调度和抢占式调度的区别如下：
- 协作式调度依靠被调度方主动弃权
- 抢占式调度依靠调度器强制将被调度方中断

![](/uploads/in-post/golang-scheduler/schedule-type.png)

其中需要注意的一点是主动调度弃权必须要有函数调用且有扩栈指令才有机会执行抢占，如果循环中执行的是类似 `i++` 这类操作是无法抢占的从而会导致死循环，所以在 Golang 1.14 中实现了基于信号的抢占，其主要流程如下：

![](/uploads/in-post/golang-scheduler/signal-schedule.png)

协作式调度与抢占式调度的大致流程为：

![](/uploads/in-post/golang-scheduler/schedule-flow.png)

# 附录
[饶老师的系列博客](https://qcrao.com/2019/09/06/dive-into-go-scheduler-source-code/)

[Go Scheduler 源码阅读 【 Go 夜读 】](https://b23.tv/83xK0P)