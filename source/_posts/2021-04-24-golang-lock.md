---
layout: post
title: "Golang 的强人锁难"
date: 2021-04-24 12:00:00
updated: 2021-04-24 12:00:00
copyright: true
categories:
  - Golang
tags:
  - Golang
---
# 说在前面
冯敏老师从一个不加锁并发修改导致出现问题的例子讲起，用最佳实践匹配我们工作中的实际场景，提出一些避免踩坑的建议，从而引出锁的进化和原理。

# 最佳实践
## 减少持有时间
### 缩小临界区，注意 defer 的使用
通过缩小临界区的方式，可以避免在加锁和解锁之间，由于有较为耗时的代码，导致锁持有时间过长，从而造成性能问题，例子如下：

```
var Users = map[string]string {
    "user": "password",
}
var mu sync.Mutex
func CheckUser(name, password string) bool {
    mu.Lock()
    defer mu.Unlock()
    realPwd, exist: = Users[name]
    return exist & realPwd == password
}
```

乍看之下这段代码是没有什么问题的，但是如果代码像下面这样

```
Func SomeFunc() {
    // do sth
    mu.Lock()
    defer mu.Unlock()
    ...
    ...// long code
    ...
}
```
如果 defer 之后的代码特别耗时，那这个 mu 锁的时间就会非常长了，会拖慢整个程序的速度。
<!-- more -->

有人可能会问了，那我显示调用 mu.Lock() 和 mu.Unlock() 不就好了，像下面这样

```
func SomeFunc() {
    mu.Lock()
    ... // do sth
    mu.Unlock()
    ... // long code
}
```

答案是不太行，除非 do sth 的时候绝对不会出错，否则 mu 将无法得到释放，如果有令一个线程再次对 mu 加锁将产生死锁，而用 `defer mu.Unlock()` 的话，能够保证就算出错了 mu 也可以正确释放，这点比提升性能更加重要。

所以我们应该怎么解决这个问题呢？答案是使用临界区减少锁的持有时间：

```
func CheckUser(name, password string) bool {
    var realPwd string
    var exist bool
    func () {
        mu.Lock()
        defer mu.Unlock()
        realPwd, exist: = Users[name]
    }
    return exist & realPwd == password
}
```

使用匿名函数的方式把需要加锁的代码包一层进行调用，可以避免上述提到的影响

## 优化锁的粒度
最常用的方式就是使用分段锁：

![](/uploads/in-post/golang-lock/segment-lock.png)

举一个 Golang 的 rand 的例子：

```
var globalRand = New(&lockedSource{
    src: NewSource(1).(Source64),
})

type lockedSource struct {
    lk sync.Mutex
    src Source64
}
```

可以看出 Golang 的 rand 是全局持有一个锁，这样就会导致所有执行 rand 函数的地方会去竞争同一个锁，可能会导致性能降低，提升性能的方式是可以使用分段锁的方式：

```
type SafeRander struct {
    pos     uint32
    randers [128]*rand.Rand
    locks   [128]*sync.Mutex
}

func (sr *SafeRander) Intn(n int) int {
    x := atomic.AddUint32(&sr.pos, 1)
    x %= 128
    sr.locks[x].Lock()
    n = sr.randers[x].Intn(n)
    sr.locks[x].Unlock()
    return n
}
```

## 读写分离
使用读写锁可以大大降低整个锁的持有时间：

```
type Counter struct {
    count int
    mutex sync.Mutex
}

func (w *Counter) Count() {
    w.mutex.Lock()
    defer w.mutex.Unlock()
    w.count++
    time.Sleep(time.Microsecond)
}

func (w *Counter) Read() {
    w.mutex.Lock()
    defer w.mutex.Unlock()
    _ = w.count
    time.Sleep(time.Microsecond)
}

type RWCounter struct {
    count int
    mutex sync.RWMutex
}

func (w *RWCounter) Count() {
    w.mutex.Lock()
    defer w.mutex.Unlock()
    w.count++
    time.Sleep(time.Microsecond)
}

func (w *RWCounter) Read() {
    w.mutex.RLock()
    defer w.mutex.RUnlock()
    _ = w.count
    time.Sleep(time.Microsecond)
}
```

![](/uploads/in-post/golang-lock/counter-rwcounter.png)

通过 Benchmark 可以看出使用读写锁比单纯使用普通锁的性能更好，效率更高

## 使用原子操作
相比读写锁，使用原子操作具有更高的性能，因为原子操作不会触发 Go 的调度，也不会阻塞执行流，可以使用 Golang 的 sync/atomic 包中的提供的方法

```
sync/atomic
.AddInt32 (or int64, uint*)
.CompareAndSwapInt32
.(Load|Store|Swap)Int32
.(Load|Store|Swap)Pointer
.Value
```
例如：

```
var v atomic.Value
v.Store("hello")
s, ok := v.Load().(string)
```

使用原子操作的 AtomicCounter 的 Benchmark，证明原子操作的性能是更高的

```
type AtomicCounter struct {
    count int32
}

func (c *AtomicCounter) Count() {
    atomic.AddInt32(&c.count, 1)
}

func (c *AtomicCounter) Read() {
    _ = atomic.LoadInt32(&c.count)
}
```

![](/uploads/in-post/golang-lock/rwcounter-atomiccounter.png)

## 小结
本节主要讲解了使用锁的最佳实践，可以使用以下四种方式：
1. 减少持有时间
2. 优化锁的粒度
3. 读写分离
4. 使用原子操作

# 避免踩坑
## 不要拷贝 Mutex
如果在我们使用过程中直接传入 mutex 对象作为参数的话，会由于传值而发生拷贝，所以会生成新的 Mutex，导致无法正确的加锁，Goland 会对这种不正确的用法进行提示，非常的人性化

![](/uploads/in-post/golang-lock/mutex.png)

所以如果要使用同一个锁进行加锁可以使用传递指针的形式

```
func Worker(m *sync.Mutex) {
    m.Lock()
    defer m.Unlock()
    // do sth, like counting
}

func main() {
    var mu sync.Mutex
    go Worker(&mu)
    go Worker(&mu)
    time.Sleep(time.Second)
}
```

## Mutex 不可重入
下面这段代码会发生死锁，原因是 Golang 中 Mutex 是不可重入的，两次加锁会导致自己等待加锁的自己解锁，形成死锁

```
func example() {
    var m sync.Mutex

    m.Lock()
    defer m.Unlock()

    m.Lock()
    defer m.Unlock()
}
```

## atomic.Value 误用
下面这段代码对 p 这个 map 可能会进行并发读写，从而产生 fatal 错误，使用 atomic 的做法原则上存入的对象都应该是只读的

```
func ProcessRequest() {
    p := pacing.Load().(map[string]int)
    value = p[x]
    ...
    p[x] = adjust(value)
    pacing.Store(p)
}
```

## race detector
Golang 集成了 race detector，可以使用命令 -race 开启

```
$ go test -race mypkg
$ go run -race mysrc.go
$ go build -race mycmd
$ go install -race mypkg
```

race detector 可以帮我们检测出来我们的代码中可能存在的并发写问题，我们可以在测试环境找出这类问题进行相应的修正

![](/uploads/in-post/golang-lock/race.png)

## 小结
本节主要展示了一些工作中可能遇到的锁的错误使用方式，我们应当避免踩坑
1. 不要拷贝 Mutex
2. Mutex 不可重入
3. atomic.Value 应当只存入只读对象
4. 可以使用 race detector 帮助我们检测出代码中的问题
# 锁的进化
## 锁的历史
单核时期：屏蔽 CPU 中断 -> CAS 指令

多核时期：Lock 内存总线 -> MESI协议（Modified Exclusive Shared Invalid）

## 自旋锁
自旋锁：多个 goroutine 可能被同时唤醒，浪费 CPU，并且可能抢不到锁，导致 p99 耗时毛刺

并且由于 Golang 1.14 之前没有实现非抢占式调度，可能会由于 GC 导致锁没有正常释放而造成死锁

![](/uploads/in-post/golang-lock/goroutine-schedule.png)

## Mutex
为了解决上述的问题，Golang 实现了一套「效率优先，兼顾公平」的锁

![](/uploads/in-post/golang-lock/efficient-fair.png)

整体的流程如下：

![](/uploads/in-post/golang-lock/lock-flow.png)

大致分为三个步骤：原子操作直接获取锁，如果失败进入自旋，如果自旋获取锁失败四次则进入等待队列

这个部分是全篇的难点，在这里用文字难以描述，建议大家直接看代码对照着这个流程图来理解，源码位于`sync/mutex.go`这个文件

## 小结
本节主要是讲了锁的历史和 Golang 的实现（虽然没有详细讲），希望大家可以对照着流程图详细理解一下这个过程

# 总结
这篇文章主要从最佳实践，避免踩坑和锁的历史及 Golang 的实现几个方面为我们拉开了 Golang 锁的序幕，帮助我们更加直观的去学习和理解锁，提升我们代码的正确性^_^