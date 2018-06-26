---
title:      "设计模式--工厂方法模式"
date:       2018-06-16 12:00:00
updated:    2018-06-16 12:00:00
copyright: true
categories:
    - 设计模式
tags:
    - 设计模式
    - 创建型模式
    - 工厂模式
---

> “设计模式是软件开发人员在开发过程中可以遵循的一般问题的解决方案。”
### 简介

由于简单工厂模式每次增加新的产品时，都需要修改工厂类，违背了开闭原则，可以通过定义工厂类的父类，为每种产品都创建一个工厂，从而动态的获取子类，并且增加产品时增加工厂子类即可，不用修改工厂父类。

<!-- more -->

### 目的

解决简单工厂模式中违背开闭原则的问题

### 优缺点

+ 优点
  - 新增产品时，增加具体产品类和工厂子类即可，不用更改工厂父类
  - 每个具体工厂类只负责一个产品的创建，更符合单一职责原则
  - 更利于形成继承结构

+ 缺点
  - 每次增加新产品时，都需要增加工厂类，导致系统复杂度变高
  - 产品和工厂类之间的依赖较大

### 实现

我们将创建一个`Product`接口和实现`Product`接口的实体类，工厂接口类`Factory`和实现`Factory`接口的实体类

```
interface Factory {
    Product getProduct();
}

interface Product {
    void show();
}

class Prouduct1 implements Product {
    @Override
    public void show() {
        System.out.println("我是产品1");
    }
}

class Prouduct2 implements Product {
    @Override
    public void show() {
        System.out.println("我是产品2");
    }
}

class Factory1 implements Factory {
    @Override
    public Product getProduct() {
        return new Prouduct1();
    }
}

class Factory2 implements Factory {
    @Override
    public Product getProduct() {
        return new Prouduct2();
    }
}

public class FactoryMethodPattern {
        public static void main(String[] args) {
        Factory factory1 = new Factory1();
        factory1.getProduct().show();
        Factory factory2 = new Factory2();
        factory2.getProduct().show();
    }
}
```

输出为：

```
我是产品1
我是产品2
```

### 使用场景

但用户只知道产品对应的工厂，而不知道具体产品的类名时可以使用此模式。
