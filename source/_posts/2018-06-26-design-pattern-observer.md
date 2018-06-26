---
title:      "设计模式--观察者模式"
date:       2018-06-26 12:00:00
updated:    2018-06-26 12:00:00
copyright: true
categories:
    - 设计模式
tags:
    - 设计模式
    - 行为型模式
    - 观察者模式
---

> “设计模式是软件开发人员在开发过程中可以遵循的一般问题的解决方案。”

### 简介

当对象间存在一对多关系，且当一个对象被修改时，会自动通知它的依赖对象，则使用观察者模式（Observer Pattern）。观察者模式属于行为型模式。

<!-- more -->

### 模式意图

可以建立一种对象与对象之间的依赖关系，一个对象发生改变时将自动通知其他对象，其他对象将相应做出反应。在此，发生改变的对象称为被观察者，而被通知的对象称为观察者，一个被观察者可以对应多个观察者，而且这些观察者之间没有相互联系，可以根据需要增加和删除观察者，使得系统更易于扩展，这就是观察者模式的模式意图。

### 优缺点

+ 优点
  - 观察者模式可以实现表示层和数据逻辑层的分离，并定义了稳定的消息更新传递机制，抽象了更新接口，使得可以有不同的表示层作为具体观察者角色。
  - 观察者模式在被观察者和观察者之间建立一个抽象的耦合。
  - 观察者模式支持广播通信。
  - 观察者模式符合“开闭原则”的要求。

+ 缺点
  - 如果一个被观察者对象有很多直接和间接的观察者的话，将所有的观察者都通知到会花费很多时间。
  - 如果在观察者和被观察者之间有循环依赖的话，被观察者会触发它们之间进行循环调用，可能导致系统崩溃。
  - 观察者模式没有相应的机制让观察者知道所观察的目标对象是怎么发生变化的，而仅仅只是知道被观察者发生了变化。

### 模式结构

抽象工厂模式包含如下角色：

+ Subject：目标
+ ConcreteSubject：具体目标
+ Observer：观察者
+ ConcreteObserver：具体观察者

![](/uploads/in-post/design_patterns/observer_struc.png)

### 实现

Subject:

```
public interface Subject {
    public void registerObserver(Observer o);
    public void removeObserver(Observer o);
    public void notifyObserver();
}
```

ConcreteSubject:

```
public class ConcreteSubject implements Subject {
    private ArrayList<Observer> observers;
    private Object data;

    public ConcreteSubject() {
        this.observers = new ArrayList<>();
    }

    @Override
    public void registerObserver(Observer o) {
        observers.add(o);
    }

    @Override
    public void removeObserver(Observer o) {
        int index = observers.indexOf(o);
        if (index >= 0) {
            observers.remove(index);
        }
    }

    @Override
    public void notifyObserver() {
        for (Observer observer: observers) {
            observer.update(this, data);
        }
    }

    public void dataChanged() {
        notifyObserver();
    }

    public void setData(Object data) {
        this.data = data;
        dataChanged();
    }
}
```

Observer:

```
public interface Observer {
    public void update(Subject sub, Object obj);
}
```

ConcreteObserver:

```
public class ConcreteObserver implements Observer{
    private Subject concreteSubject;

    public ConcreteObserver(Subject subject) {
        this.concreteSubject = subject;
        this.concreteSubject.registerObserver(this);
    }

    @Override
    public void update(Subject sub, Object obj) {
        System.out.println("Subject is " + sub.toString() + " Data is " + obj.toString());
    }
}
```

Main:

```
public class Main {
    public static void main(String[] args) {
        ConcreteSubject subject = new ConcreteSubject();
        Observer observer = new ConcreteObserver(subject);
        subject.setData(new HashMap<Integer, Integer>(){{put(1, 1);}});
        subject.setData(new HashMap<Integer, Integer>(){{put(2, 2);}});
        subject.setData(new HashMap<Integer, Integer>(){{put(3, 3);}});
    }
}
```

输出结果：

```
Subject is observer_pattern.ConcreteSubject@610455d6 Data is {1=1}
Subject is observer_pattern.ConcreteSubject@610455d6 Data is {2=2}
Subject is observer_pattern.ConcreteSubject@610455d6 Data is {3=3}
```

### 使用场景

在以下情况下可以使用观察者模式：

+ 一个抽象模型有两个方面，其中一个方面依赖于另一个方面。将这些方面封装在独立的对象中使它们可以各自独立地改变和复用。
+ 一个对象的改变将导致其他一个或多个对象也发生改变，而不知道具体有多少对象将发生改变，可以降低对象之间的耦合度。
+ 一个对象必须通知其他对象，而并不知道这些对象是谁。
+ 需要在系统中创建一个触发链，A对象的行为将影响B对象，B对象的行为将影响C对象……，可以使用观察者模式创建一种链式触发机制。
