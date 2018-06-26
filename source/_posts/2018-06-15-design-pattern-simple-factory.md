---
title:      "设计模式--简单工厂模式"
date:       2018-06-15 12:00:00
updated:    2018-06-15 12:00:00
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

简单工厂模式是最简单的设计模式之一，简单到甚至没有放到23种常用设计模式当中，可以用于设计模式的入门学习。

<!-- more -->

### 目的

定义一个创建对象的接口，在工厂中决定实例化哪个对象的子类，解决了接口选择的问题

### 优缺点

+ 优点
  - 实现了子类对象创建和使用的分离
  - 无需知道子类的类名，通过参数即可创建子类对象
  - 屏蔽了子类的具体实现

+ 缺点
  - 每次增加新产品时，都需要修改工厂类，违反了开闭原则
  - 产品和工厂类之间的依赖较大

### 实现

我们将创建一个`Fruit`接口和实现`Fruit`接口的实体类，以及工厂类`FruitFactory`

```
// 创建接口
interface Fruit {
    void describe();
}

// 创建苹果实体类
class Apple implements Fruit {
    @Override
    public void describe() {
        System.out.println("我是苹果");
    }
}

// 创建梨实体类
class Pear implements Fruit {
    @Override
    public void describe() {
        System.out.println("我是梨");
    }
}

// 创建橙子实体类
class Orange implements Fruit {
    @Override
    public void describe() {
        System.out.println("我是橙子");
    }
}

// 创建工厂类
class FruitFactory {

    // 根据给get方法的不同参数名，返回相应的子类
    public Fruit getFruit(String name) {
        if (name == null) {
            return null;
        }
        if (name.equalsIgnoreCase("apple")) {
            return new Apple();
        } else if (name.equalsIgnoreCase("pear")) {
            return new Pear();
        } else if (name.equalsIgnoreCase("orange")) {
            return new Orange();
        }
        return null;
    }
}

public class SimpleFactoryPattern {

    public static void main(String[] args) {
        FruitFactory fruitFactory = new FruitFactory();
        // 获取苹果对象并调用 describe 方法
        Fruit apple = fruitFactory.getFruit("apple");
        apple.describe();
        // 获取梨对象并调用 describe 方法
        Fruit pear = fruitFactory.getFruit("pear");
        pear.describe();
        // 获取橙子对象并调用 describe 方法
        Fruit orange = fruitFactory.getFruit("orange");
        orange.describe();
    }
}

```

输出为：

```
我是苹果
我是梨
我是橙子
```

### 使用场景

当我们明确知道传入工厂的参数且对如何创建对象不关心时可以使用此方法，尽量在工厂中创建类型较少时采用此方法，以免工厂类过于复杂。
