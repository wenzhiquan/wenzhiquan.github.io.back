---
title:      "设计模式--简介"
date:       2018-02-25 12:00:00
copyright: true
categories:
    - 设计模式
tags:
    - 设计模式
---


> “设计模式是软件开发人员在开发过程中可以遵循的一般问题的解决方案。”

### 简介

所谓`模式`，就是在特定环境下人们对某类重复出现的问题提出的一套有效的解决方案。

而设计模式(`Design Pattern`)，则是针对软件设计过程中，可能遇到的重复问题的合理解决方案。

设计模式提出的根本目的就是解决现实生活中的问题，每种设计模式都有对应的现实问题及其解决方案，找到对应的问题便能够快速的利用设计模式进行解决。

设计模式一般包含模式名称、解决的问题，解决方案和应对效果等部分。

使用设计模式的目的是为了提高代码的可重用性；按照一定的规则编写代码，能够让自己的代码更加容易被其他编程人员所理解；同时，在一定的规则内编写代码，可以在一定程度上提升代码的可靠性。

<!-- more -->

### 设计模式的类型

根据设计模式的参考书`Design Patterns - Elements of Reusable Object-Oriented Software`中所提到的，总共有 23 种设计模式。


常用设计模式一览：

|类型|模式名称|使用频率|
|--|--|--|
|创建型模式|[工厂方法模式 Factory Method Pattern](/2018/06/15/2018-06-15-design-pattern-factory-method/)|★★★★★|
|创建型模式|[抽象工厂模式 Abstract Factory Pattern](/2018/06/25/2018-06-25-design-pattern-abstract-factory/)|★★★★★|
|创建型模式|[单例模式 Singleton Pattern](/2016/03/28/2016-03-28-singleton-eight-type/)|★★★★☆|
|创建型模式|[简单工厂模式 Simple Factory Pattern](/2018/06/16/2018-06-16-design-pattern-factory-method/)|★★★☆☆|
|创建型模式|原型模式 Prototype Pattern|★★★☆☆|
|创建型模式|建造者模式 Builder Pattern|★★☆☆☆|
|--|--|--|
|结构型模式|外观模式 Façade Pattern|★★★★★|
|结构型模式|代理模式 Proxy Pattern|★★★★☆|
|结构型模式|适配器模式 Adapter Pattern|★★★★☆|
|结构型模式|组合模式 Composite Pattern|★★★★☆|
|结构型模式|桥接模式 Bridge Pattern|★★★☆☆|
|结构型模式|装饰模式 Decorator Pattern|★★★☆☆|
|结构型模式|享元模式 Flyweight Pattern|★☆☆☆☆|
|--|--|--|
|行为型模式|迭代器模式 Iterator Pattern|★★★★★|
|行为型模式|[观察者模式 Observer Pattern](/2018/06/26/2018-06-26-design-pattern-observer/)|★★★★★|
|行为型模式|[策略模式 Strategy Pattern](/2018/06/27/2018-06-27-design-pattern-strategy/)|★★★★☆|
|行为型模式|命令模式 Command Pattern|★★★★☆|
|行为型模式|模板方法模式 Template Method Patter|★★★☆☆|
|行为型模式|状态模式 State Pattern|★★★☆☆|
|行为型模式|中介者模式 Mediator Pattern|★★☆☆☆|
|行为型模式|备忘录模式 Memento Pattern|★★☆☆☆|
|行为型模式|职责链模式 Chain of Responsibility Pattern|★★☆☆☆|
|行为型模式|访问者模式 Visitor Pattern|★☆☆☆☆|
|行为型模式|解释器模式 Interpreter Pattern|★☆☆☆☆|

### 面向对象设计的几大原则

#### 单一职责原则（Single Responsibility Principle）

简单来说就是一个类只负责一个功能，这样一个类的职责就不会出现大量耦合，重用性也会更高。

#### 开闭原则（Open-Closed Principle）

一个软件应当对扩展开放，而对修改关闭。即软件应当尽量在不修改原代码的基础上进行扩展。想要达到这个效果，需要使用接口和抽象类。

#### 里氏代换原则（Liskov Substitution Principle）

任何可以使用基类的地方，其子类一定也能够被使用。按照里氏原则，子类必须实现父类的所有方法，当我们设计父类时，尽量把父类设计为抽象类或接口，这样运行时子类替换父类实例，可以很轻松的扩展系统功能。

#### 依赖倒置原则（Dependency Inversion Principle）

抽象不应该依赖于细节，而细节应该依赖于抽象。即我们应该面向接口编程，而不是针对实现编程。一个具体类应当只实现接口或抽象类中声明过的方法，而不应给出多余的方法。

#### 接口隔离原则（Interface Segregation Principle）

使用多个隔离的接口，而不是使用单一的接口，即当一个接口太大时，我们应当将其分割为隔离的多个接口，可以减小类之间的耦合。

#### 合成复用原则（Composition/Aggregate Reuse Principle）

尽量使用对象组合，而不是继承来达到复用的目的。

#### 迪米特法则（Law of Demeter）

一个软件的实体应当尽可能少的和其他实体发生相互作用，而成为一个独立的模块。
