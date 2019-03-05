---
layout:     post
title:      "Java 通配符简析"
date:       2019-03-23 12:00:00
updated:    2019-03-23 12:00:00
copyright: true
categories:
    - Java
tags:
    - Java
    - 通配符
---

> “Java 通配符是一种表示未知类型的类型约束的方法。”

### 概述

` 通配符 ` 并不包含在最初的泛型设计中（起源于 Generic Java（GJ）项目），从形成 JSR 14 到发布其最终版本之间的五年多时间内完成设计过程并被添加到了泛型中。` 通配符 ` 在类型系统中具有重要的意义，它们为一个泛型类所指定的类型集合提供了一个有用的类型范围。Oracle 的官方解释是 Type of unknown。

<!-- more -->

### 通配符

#### 类型

通配符有以下三种类型：

```
List<?>  // 任意类型的 List
List<? extends T>  // 继承自 T 的任意类型的 List
List<? super T>  // T 或者是 T 的子类的任意类型的 List
```

#### 问题描述

假设有以下几个类：

```
public class Food {
  public void taste() {
    System.out.println("Food taste");
  }
}

public class Meat extends Food {
  @Override
  public void taste() {
    System.out.println("Meat taste");
  }
}

public class Fruit extends Food {
  @Override
  public void taste() {
    System.out.println("Fruit taste");
  }
}

public class Apple extends Fruit {
  @Override
  public void taste() {
    System.out.println("Apple taste");
  }
}
```

然后我们定义了一个无通配符的使用示例：

```
public class Eater {
  public void eat(List<Food> foodList) {
    for(Food food: foodList) {
      food.taste();
    }
  }
}

public class EaterTest {

    public static void main(String[] args) {
        Eater eater = new Eater();

        // Test1
        List<Food> foodList = new ArrayList<>();
        foodList.add(new Apple());
        foodList.add(new Fruit());

        eater.eat(foodList);

        // Test2
        List<Fruit> fruitList = new ArrayList<>();
        fruitList.add(new Apple());
        fruitList.add(new Fruit());

        eater.eat(fruitList);  // 无法通过编译
    }
}
```

按照普遍的逻辑推断，Fruit 是 Food 的子类，所以能够装下 Food 的集合理论上应该也可以装下 Fruit。但是，尽管 Fruit 是 Food 的子类，所以 Fruit 对象是可以直接添加到 List<Food> 对象中的。但是 List<Fruit> 却不能直接认为是 List<Food> 的子类，因为集合的泛型并不是协变的。所以将不是 List<Food> 对象子类的 List<Fruit> 对象传递给 eat(List<Food> foodList) 函数是不能通过编译的。此时就需要通配符上场了。

#### 作用

通配符被设计用来解决泛型继承规则所带来的问题。

##### 通配符上界

从上面我们知道 List<Fruit> 不是 List<Food> 的子类，那么我们要如何将 List<Fruit> 和 List<Food> 与 Fruit 与 Food 之间的关系关联起来呢？我们可以使用 `List<? extends Food>` 来表示 List 的上界是 Food，也就是说 List<Food> 或 List<Food Subclass> 都是 List<? extends Food> 的子类，这样就可以直接将 List<Fruit> 传递给 List<? extends Food> 进行操作了。

更改后的 eat() 函数如下：

```
public class Eater {
    public void eat(List<? extends Food> foodList) {
        for (Food food: foodList) {
            food.taste();
        }
    }
}
```

再试一次之前的测试函数可以通过编译了。

综上我们可以知道， List<Food>，List<Meat>， List<Fruit>，List<Apple> 都是 List<? extends Food> 的子类，现有总结如下：

```
假设有泛型类型 G(如 List 或 Map)， 泛型参数 X 和 Y，其中 Y 是 X 的子类，则有

G<Y> 是 G<? extends X> 的子类型（如 List<Fruit> 是 List<? extends Food > 的子类型）
G<? extends Y> 是 G<? extends X> 的子类型（如 List<? extends Fruit> 是 List<? extends Food> 的子类型）。
G<X> 是 G<? extends X> 的子类型（如 List<Food> 是 List<? extends Food> 的子类型）
G<?> 等同于 G<? extends Object>，如 List<?> 等同于 List<? extends Object>。
```

在上面我们测试了从 List<? extends Food> 中读取信息，那么我们能不能向其中添加信息呢？我们添加如下代码进行测试：

```
public void testAdd(List<? extends Food> foods) {
    foods.add(new Food());
    foods.add(new Fruit());
    foods.add(new Apple());
}

List<? extends Food> foods = new ArrayList<>();
foods.add(new Food());
foods.add(new Fruit());
foods.add(new Apple());
```

根据我们之前的分析，`? extends Food` 可以代表 Food 及其子类 (Meat 或 Fruit 或 Apple)，那上述代码理应是可以通过编译的。但是实际上结果却是 `无法通过编译`，原因如下：

已知 List<Food> list 中只可以添加 Food 类对象及其子类对象 (如 Meat 和 Fruit)，List<Fruit> 中只可以添加 Fruit 类对象及其子类对象 (如 Apple)。在向 testAdd() 函数传递参数时，我们可以传入 List<? extends Food> 的所有子类型，假设传入的参数为 List<Food>，则三个 add 操作都是可以执行的，假设传入的参数为 List<Fruit>，则第一个 add 操作不能执行，假设传入的参数为 List<Meat>，则所有 add 操作都不能执行。

所以给 testAdd() 函数传入参数时，由于传入的参数是未知的，所以 add 操作都可能会引发类型不兼容的问题，所以 java 为了保护类型一致性，禁止向 List<? extends T> 中除了 null 之外的任意对象，即 foods.add(null) 是可行的。同样的第二段代码不能通过编译。

### 参考

1、peiquan，[java 通配符解惑](https://blog.51cto.com/peiquan/1303768)

2、Brian Goetz，[使用通配符简化泛型使用](https://www.ibm.com/developerworks/cn/java/j-jtp04298.html)

3、BarbaraBear，[Java泛型中的通配符](https://www.jianshu.com/p/cb543969a15b)
