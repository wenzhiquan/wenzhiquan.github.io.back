---
layout:     post
title:      "单例模式的八种写法"
date:       2016-03-28 12:00:00
copyright: true
categories:
    - 设计模式
tags:
    - 设计模式
    - 创建型模式
    - Singleton
---

> “单例模式是最常用到的设计模式之一，熟悉设计模式的朋友对单例模式都不会陌生。”

### 概述

`单例模式`（singleton）是一种常用的设计模式，其定义是单例对象的类只能允许创建一个实例，而可以被多次调用。

单例模式是设计模式中最简单的形式之一。这一模式的目的是使得类的一个对象成为系统中的唯一实例。要实现这一点，可以从客户端对其进行实例化开始。因此需要用一种只允许生成对象类的唯一实例的机制，“阻止”所有想要生成对象的访问。使用工厂方法来限制实例化过程。这个方法应该是静态方法（类方法），因为让类的实例去生成另一个唯一实例毫无意义。

<!-- more -->

### 基本思路

显然单例模式的要点有三个：

一是某个类只能有一个实例；

二是它必须自行创建这个实例；

三是它必须自行向整个系统提供这个实例。

单例的实现主要是通过以下两个步骤：

1). 将该类的构造方法定义为私有方法，这样其他处的代码就无法通过调用该类的构造方法来实例化该类的对象，只有通过该类提供的静态方法来得到该类的唯一实例；

2). 在该类内提供一个静态方法，当我们调用这个方法时，如果类持有的引用不为空就返回这个引用，如果类保持的引用为空就创建该类的实例并将实例的引用赋予该类保持的引用。

### 注意事项

单例模式在多线程的应用场合下必须小心使用。如果当唯一实例尚未创建时，没有对创建实例的方法进行线程保护，会出现两个线程同时调用创建方法的情况，由于它们没有检测到实例的存在，从而同时各自创建了一个实例，这样就会构造出两个不同的实例，从而违反了单例模式中实例唯一的原则。所以需要对多线程状态下的单例模式进行线程保护。

### 八种写法

#### 懒汉式（线程不安全）[不可用]

```
public class Singleton {

    private static Singleton singleton;

    private Singleton() {}

    public static Singleton getInstance() {
        if (singleton == null) {
            singleton = new Singleton();
        }
        return singleton;
    }
}
```

这种写法起到了`Lazy Loading`的效果，即只有在需要调用类时才生成相应的实例。

这种写法只能在单线程下使用。如果在多线程下，一个线程进入了`if(singleton == null)`判断语句块，还未往下执行，另一个线程也通过了这个判断语句，这时便会产生多个实例。所以在多线程环境下不可使用这种方式。

#### 懒汉式（线程安全，同步方法）[不推荐用]

```
public class Singleton {

    private static Singleton singleton;

    private Singleton() {}

    public static synchronized Singleton getInstance() {
        if (singleton == null) {
            singleton = new Singleton();
        }
        return singleton;
    }
}
```

解决了4.1的线程不安全问题，保证了同时只能有一个对`getInstance()`方法的调用。

缺点：效率低下，每个线程在执行`getInstance()`方法时都要进行同步。而事实上只要保证第一次建立实例时同步即可。

#### 懒汉式(线程安全，同步代码块)[不可用]

```
public class Singleton {

    private static Singleton singleton;

    private Singleton() {}

    public static Singleton getInstance() {
        if (singleton == null) {
            synchronized (Singleton.class) {
                singleton = new Singleton();
            }
        }
        return singleton;
    }
}
```

由于4.2实现方式同步效率太低，所以摒弃同步方法，改为同步产生实例化的的代码块。

但是这种同步并不能起到线程同步的作用。会遇到与4.1中的实现方式相同的问题，假如一个线程进入了`if (singleton == null)`判断语句块，还未往下执行，另一个线程也通过了这个判断语句，这时便会产生多个实例。

#### 双重校验锁[可用]

```
public class Singleton {

    private static volatile Singleton singleton;

    private Singleton() {}

    public static Singleton getInstance() {
        if (singleton == null) {
            synchronized (Singleton.class) {
                if (singleton == null) {
                    singleton = new Singleton();
                }
            }
        }
        return singleton;
    }
}
```

这种方法是针对4.2实现方式进行的改进，同时又避免了4.3中不能起到线程同步作用的问题。因为在同步代码块中再次进行了`if (singleton == null)`判断，保证了只会新建一个实例。

注意：因为使用了`volatile`关键字，所以在JDK1.5之后，双重检查锁定才能够正常达到单例效果。

#### 饿汉式（静态常量）[可用]

```
public class Singleton {

    private final static Singleton INSTANCE = new Singleton();

    private Singleton(){}

    public static Singleton getInstance(){
        return INSTANCE;
    }
}
```

优点：写法简单，在类装载时完成实例化。避免了线程同步问题。

缺点：一定会实例化类，没有达到`Lazy Loading`的效果。如果从未使用过这个实例，会造成内存的浪费。

#### 饿汉式（静态代码块）[可用]

```
public class Singleton {

    private static Singleton instance;

    static {
        instance = new Singleton();
    }

    private Singleton() {}

    public Singleton getInstance() {
        return instance;
    }
}
```

和4.5方法起到相同的作用，优缺点也相同。

#### 静态内部类[推荐用]

```
public class Singleton {

    private Singleton() {}

    private static class SingletonInstance {
        private static final Singleton INSTANCE = new Singleton();
    }

    public static Singleton getInstance() {
        return SingletonInstance.INSTANCE;
    }
}
```

这种方式与4.5和4.6的饿汉式写法采用的机制类似，但又不相同。两者都是采用了类装载的机制来保证初始化实例时只有一个线程。不同的地方在饿汉式方式是只要`Singleton`类被装载就会实例化，没有起到`Lazy Loading`的作用，而静态内部类方式在`Singleton`类被装载时并不会立即实例化，而是在调用`getInstance()`方法时，才会装载`SingletonInstance`类，进而完成`Singleton`的实例化。

类的静态属性只会在第一次加载类的时候初始化，所以在这里，JVM帮助我们保证了线程的安全性，在类进行初始化时，别的线程是无法进入的。

优点：线程安全，延迟加载，效率高。

#### 枚举[推荐用]

```
public enum Singleton {
    INSTANCE;
    public void whateverMethod() {
    }
}
```

 这种方式是`Effective Java`作者`Josh Bloch`提倡的方式，借助JDK1.5中添加的枚举来实现单例模式，不仅能避免多线程同步问题，还能防止反序列化重新创建新的对象，可谓是很坚强的壁垒。

### 适用场合

* 需要频繁的进行创建和销毁的对象；
* 创建对象时耗时过多或耗费资源过多，但又经常用到的对象；
* 工具类对象；
* 频繁访问数据库或文件的对象。
