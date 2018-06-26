---
title:      "设计模式--抽象工厂模式"
date:       2018-06-25 12:00:00
updated:    2018-06-25 12:00:00
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

在`工厂方法模式`中具体工厂负责生产具体的产品，每一个具体工厂对应一种具体产品，工厂方法也具有唯一性，一般情况下，一个具体工厂中只有一个工厂方法或者一组重载的工厂方法。但是有时候我们需要一个工厂可以提供多个产品对象，而不是单一的产品对象。此时工厂方法模式就无法完成需求，而抽象工厂模式可以解决这个问题。

<!-- more -->

### 模式意图

当系统所提供的工厂所需生产的具体产品并不是一个简单的对象，而是多个位于不同产品等级结构中属于不同类型的具体产品时需要使用`抽象工厂模式`。

`抽象工厂模式`与`工厂方法模式`最大的区别在于:

+ 工厂方法模式针对的是一个产品等级结构
+ 抽象工厂模式需要面对多个产品等级结构，一个工厂等级结构可以负责多个不同产品等级结构中的产品对象的创建。

当一个工厂等级结构可以创建出分属于不同产品等级结构的一个产品族中的所有对象时，抽象工厂模式比工厂方法模式更为简单、有效率。

### 优缺点

+ 优点
  - 抽象工厂模式隔离了具体类的生成，使得客户并不需要知道什么被创建。由于这种隔离，更换一个具体工厂就变得相对容易。所有的具体工厂都实现了抽象工厂中定义的那些公共接口，因此只需改变具体工厂的实例，就可以在某种程度上改变整个软件系统的行为。另外，应用抽象工厂模式可以实现高内聚低耦合的设计目的，因此抽象工厂模式得到了广泛的应用。
  - 当一个产品族中的多个对象被设计成一起工作时，它能够保证客户端始终只使用同一个产品族中的对象。这对一些需要根据当前环境来决定其行为的软件系统来说，是一种非常实用的设计模式。
  - 增加新的具体工厂和产品族很方便，无须修改已有系统，符合“开闭原则”。

+ 缺点
  - 在添加新的产品对象时，难以扩展抽象工厂来生产新种类的产品，这是因为在抽象工厂角色中规定了所有可能被创建的产品集合，要支持新种类的产品就意味着要对该接口进行扩展，而这将涉及到对抽象工厂角色及其所有子类的修改，显然会带来较大的不便。
  - 开闭原则的倾斜性（增加新的工厂和产品族容易，增加新的产品等级结构麻烦）。

### 模式结构

抽象工厂模式包含如下角色：

+ AbstractFactory：抽象工厂
+ ConcreteFactory：具体工厂
+ AbstractProduct：抽象产品
+ Product：具体产品

![](/uploads/in-post/design_patterns/abstract_factory_struc.jpg)

**时序图**

![](/uploads/in-post/design_patterns/abstract_factory_seq.jpg)

### 实现

AbstractProductA:

```
public interface AbstractProductA {
    void display();
}
```

AbstractProductB:

```
public interface AbstractProductB {
    void draw();
}
```

ProductA1:

```
public class ProductA1 implements AbstractProductA {
    @Override
    public void display() {
        System.out.println("This is product A1");
    }
}
```

ProductA2:

```
public class ProductA2 implements AbstractProductA {
    @Override
    public void display() {
        System.out.println("This is product A2");
    }
}
```

ProductB1:

```
public class ProductB1 implements AbstractProductB {
    @Override
    public void display() {
        System.out.println("This is product B1");
    }
}
```

ProductB2:

```
public class ProductB2 implements AbstractProductB {
    @Override
    public void display() {
        System.out.println("This is product B2");
    }
}
```

AbstractFactory:

```
public abstract class AbstractFactory {
    public abstract AbstractProductA createProductA();
    public abstract AbstractProductB createProductB();
}
```

ConcreteFactory1:

```
public class ConcreateFactory1 extends AbstractFactory{
    @Override
    public ProductA1 createProductA() {
        return new ProductA1();
    }

    @Override
    public ProductB1 createProductB() {
        return new ProductB1();
    }
}
```

ConcreteFactory1:

```
public class ConcreateFactory2 extends AbstractFactory{
    @Override
    public ProductA2 createProductA() {
        return new ProductA2();
    }

    @Override
    public ProductB2 createProductB() {
        return new ProductB2();
    }
}
```

Main:

```
public class Main {
    public static void main(String[] args) {
        AbstractFactory productFactory1 = new ConcreateFactory1();

        AbstractProductA a1 =  productFactory1.createProductA();

        a1.display();

        AbstractProductB b1 = productFactory1.createProductB();

        b1.draw();

        AbstractFactory productFactory2 = new ConcreateFactory2();

        AbstractProductA a2 = productFactory2.createProductA();

        a2.display();

        AbstractProductB b2 = productFactory2.createProductB();

        b2.draw();
    }
}
```

输出结果：

```
This is product A1
This is product B1
This is product A2
This is product B2
```

### 使用场景

在以下情况下可以使用抽象工厂模式：

+ 一个系统不应当依赖于产品类实例如何被创建、组合和表达的细节，这对于所有类型的工厂模式都是重要的。
系统中有多于一个的产品族，而每次只使用其中某一产品族。
+ 属于同一个产品族的产品将在一起使用，这一约束必须在系统的设计中体现出来。
+ 系统提供一个产品类的库，所有的产品以同样的接口出现，从而使客户端不依赖于具体实现。
