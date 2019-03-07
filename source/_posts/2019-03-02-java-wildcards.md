---
layout: post
title: "Java 通配符简析"
date: 2019-03-02 12:00:00
updated: 2019-03-02 12:00:00
copyright: true
categories:
  - Java
tags:
  - Java
  - 通配符
---

> “Java 通配符是一种表示未知类型的类型约束的方法。”

### 概述

`通配符` 并不包含在最初的泛型设计中（起源于 Generic Java（GJ）项目），从形成 JSR 14 到发布其最终版本之间的五年多时间内完成设计过程并被添加到了泛型中。`通配符` 在类型系统中具有重要的意义，它们为一个泛型类所指定的类型集合提供了一个有用的类型范围。Oracle 的官方解释是 Type of unknown。

<!-- more -->

### 通配符

#### 类型

通配符有以下三种类型：

```
List<?>  // 任意类型的 List
List<? extends T>  // 继承自 T 的任意类型的 List
List<? super T>  // 具有 T 的超类型的 List
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

按照普遍的逻辑推断，Fruit 是 Food 的子类，所以能够装下 Food 的集合理论上应该也可以装下 Fruit。尽管 Fruit 是 Food 的子类， Fruit 对象可以直接添加到 `List<Food>` 对象中。但是 `List<Fruit>` 却不能直接认为是 `List<Food>` 的子类，因为集合的泛型并不是协变的。所以将不是 `List<Food>` 对象子类的 `List<Fruit>` 对象传递给 `eat(List<Food> foodList)` 函数是不能通过编译的。此时就需要通配符上场了。

#### 作用

通配符被设计用来解决泛型继承规则所带来的问题。

##### 通配符上界

从上面我们知道 `List<Fruit>` 不是 `List<Food>` 的子类，那么我们要如何将 `List<Fruit>` 和 `List<Food>` 与 Fruit 和 Food 之间的关系关联起来呢？我们可以使用 `List<? extends Food>` 来表示 List 的上界是 Food，也就是说 `List<Food>` 或 `List<Food Subclass>` 都是 `List<? extends Food>` 的子类，这样就可以直接将 `List<Fruit>` 传递给 `List<? extends Food>` 进行操作了，因为 `List<Fruit>` 中的对象都将安全地向上转型为 Food 传递给 `List<? extends Food>`。

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

综上我们可以知道， `List<Food>`，`List<Meat>`，`List<Fruit>`，`List<Apple>` 都是 `List<? extends Food>` 的子类，通配符上界拥有以下规则：

```
假设有泛型类型 G(如 List 或 Map)， 泛型参数 X 和 Y，其中 Y 是 X 的子类，则有

G<Y> 是 G<? extends X> 的子类型（如 List<Fruit> 是 List<? extends Food > 的子类型）
G<? extends Y> 是 G<? extends X> 的子类型（如 List<? extends Fruit> 是 List<? extends Food> 的子类型）。
G<X> 是 G<? extends X> 的子类型（如 List<Food> 是 List<? extends Food> 的子类型）
G<?> 等同于 G<? extends Object>，如 List<?> 等同于 List<? extends Object>。
```

在上面我们测试了从 `List<? extends Food>` 中读取信息，那么我们能不能向其中添加信息呢？我们添加如下代码进行测试：

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

已知 `List<Food>` 中只可以添加 Food 类对象及其子类对象 (如 Meat 和 Fruit)，`List<Fruit>` 中只可以添加 Fruit 类对象及其子类对象 (如 Apple)。在向 testAdd() 函数传递参数时，我们可以传入 `List<? extends Food>` 的所有子类型。在进行 add() 操作时，假设传入的参数为 `List<Food>`，则三个 add 操作都是可以执行的，假设传入的参数为 `List<Fruit>`，则第一个 add 操作不能执行，假设传入的参数为 `List<Meat>`，则所有 add 操作都不能执行。

所以给 testAdd() 函数传入参数时，由于传入的参数是未知的，所以 add() 操作可能会引发类型不兼容的问题，所以 java 为了保护类型一致性，禁止向 `List<? extends T>` 中除了 null 之外的任意对象，即 foods.add(null) 是可行的。同样的第二段代码不能通过编译。

##### 通配符下界

类似的，通配符也拥有下界。可以如此定义通配符的下界 `List<? super Fruit>`，其中 Fruit 就是通配符的下界。`注意：不能同时声明泛型通配符申明上界和下界。` 通配符的下界拥有以下规则：

```
假设有泛型类型 G(如 List 或 Map)， 泛型参数 X 和 Y，其中 Y 是 X 的子类，则有

G<? super X> 是 G<? super Y > 的子类型（如 List<? super Food> 是 List<? super Fruit > 的子类型）。
G<X> 是 G<? super X > 的子类型（如 List<Fruit> 是 List<? super Fruit > 的子类型）
```

我们再次写两段测试代码：

```
public void testAdd(List<? super Fruit> fruits) {
    fruits.add(new Apple());
    fruits.add(new Fruit());
    fruits.add(new Food());
}

List<? super Fruit> fruits = new ArrayList<>();
fruits.add(new Apple());
fruits.add(new Fruit());
fruits.add(new Food());
```

根据分析，`? super Fruit` 可以代表 Fruit 及其父类，而 Apple 是 Fruit 的子类，那上述代码理应是可以无法通过编译的。但是实际上结果却是 `可以通过编译`，原因如下：

在向 testAdd() 函数传递参数时，我们可以传入 `List<? super Fruit>` 的所有子类型，则传入的参数可以为 `List<Fruit>`，`List<Food>` 以及 `List<Object>`。`List<? super Fruit>` 表示具有任何 Fruit 超类型的列表，亦即该列表至少是一个 `List<Fruit>` 类型的列表，故所有 Fruit 的子类都可以添加至该列表中，所以 testAdd() 函数中前两行代码是可以成功执行的。但是往列表中添加 Fruit 的父类型的时候，假设添加的是 Food 类对象，是无法添加到 `List<Fruit>` 中的，假设添加的是 Object 类对象，也是无法添加到 `List<Fruit>` 中的。为了保证数据类型的统一性，java 禁止向 `List<? super T>` 中添加任意 T 的父类对象。同样的第二段代码的最后一行无法通过编译。

而在读取 `List<? super Fruit>` 时，无法保证读取到的元素是 Fruit，因为它还有可能是 Food 或者 Object，也无法保证读取到的元素是 Food，因为它还有可能是 Object，只能保证能够读取到的对象一定是 Object。所以在调用 `List<? supper Fruit>` 的 get() 方法时，返回的数据是 Object 类型的数据。

这样看起来通配符下界貌似没有起到什么作用。那么什么地方能够利用上通配符下界的特性呢？请看以下代码：

```
class Fruit implements Comparable<Fruit>{
    private int price;

    public Fruit(int price) {
        this.price = price;
    }

    public int getPrice() {
        return price;
    }

    @Override
    public int compareTo(Fruit o) {
        return Integer.compare(price, o.price);
    }
}

class Apple extends Fruit{
    public Apple(int price) {
        super(price);
    }
}

public static <T extends Comparable<? super T>> void sort(List<T> list) {
    Collections.sort(list);
}

public static void main(String[] args) {
    List<Apple> apples = new ArrayList<>();
    apples.add(new Apple(1));
    apples.add(new Apple(4));
    apples.add(new Apple(2));
    apples.add(new Apple(3));
    for (Apple collegeStudent: apples) {
        System.out.println(collegeStudent.getPrice());
    }
    System.out.println("---------------------");
    sort(apples);
    for (Apple collegeStudent: apples) {
        System.out.println(collegeStudent.getPrice());
    }
}
```

以上代码可以正常运行，下面我们来分析这段代码：

```
public static <T extends Comparable<? super T>> void sort(List<T> list) {
    Collections.sort(list);
}
```

首先 `<T extends Comparable<T>>` 规定了数组中对象必须实现 Comparable 接口，而 `Comparable<? super T>` 表示如果数组中对象的父类实现了 Comparable 接口，则其自身可不实现，如 Apple。

如果将代码改为如下内容：

```
public static <T extends Comparable<T>> void sort(List<T> list) {
    Collections.sort(list);
}
```

则 sort() 方法无法执行, 因为 Apple 没有实现 `Comparable<Apple>` 接口。换句话来说就是 `? super T` 使 sort() 方法变得更为通用了。

##### 无界通配符

当通配符只有一个 `?` 时，即为无界通配符。如 List<?>，`?` 可以代表任意类型，`任意` 也就是未知类型。无界通配符一般应用于以下两种场景中：

1. 当方法是使用原始的 Object 类型作为参数时
2. 在定义的方法体的业务逻辑与泛型类型无关时

第一种场景，例如：

```
public static void printList(List<Object> list) {
  for (Object item : list) {
    System.out.println(item + " ");
    System.out.println();
  }
}

List<Integer> li = Arrays.asList(1, 2, 3);
List<String> ls = Arrays.asList("one", "two", "three");
printList(li);  // 编译不通过，因为需要传入 List<Object> 但是传入的参数为 List<Integer>
printList(ls);  // 编译不通过，因为需要传入 List<Object> 但是传入的参数为 List<String>
```

此时，如果将 printList 参数进行修改：

```
public static void printList(List<?> list) {
  for (Object item : list) {
    System.out.println(item + " ");
    System.out.println();
  }
}
```

上面我们提到过 `List<?>` 相当于 `List<? extends Object>`，则所有 `List<? extends Object>` 的子类型都可以传递给 printList() 函数，并且所有传入的元素都将安全地向上转型为 Object 存入 `List<?>` 中。这样可以更好地兼容函数的参数传递和调用。

第二种场景，例如：

List.size(), List.clear() 方法等，使用最多的是 `Class<?>` ，这样就避免了 `Class<T>` 对于 T 类型的依赖。

最后需要注意的是，`List<?>` 不同于 `List<Object>`，因为 `List<Object>` 是 `List<?>` 的子类，而且不能往 `List<?>` 列表中添加除了 null 之外的任何元素。

### 参考

1、peiquan，[java 通配符解惑](https://blog.51cto.com/peiquan/1303768)

2、Brian Goetz，[使用通配符简化泛型使用](https://www.ibm.com/developerworks/cn/java/j-jtp04298.html)

3、BarbaraBear，[Java 泛型中的通配符](https://www.jianshu.com/p/cb543969a15b)

4、Stack Overflow，[Difference between <? super T> and <? extends T> in Java](https://stackoverflow.com/questions/4343202/difference-between-super-t-and-extends-t-in-java)
