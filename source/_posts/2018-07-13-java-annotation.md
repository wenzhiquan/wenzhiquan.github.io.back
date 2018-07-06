---
layout:     post
title:      "Java Annotation 简析"
date:       2018-07-13 12:00:00
updated:       2018-07-13 12:00:00
copyright: true
categories:
    - Java
tags:
    - Java
    - Annotation
---

> “Java Annotation 是 JDK5.0 引入的一种注释机制, 用于为 Java 代码提供元数据。”

### 概述

`Annotation`，中文译名为注解，那么注解又是什么呢？简单来说，注解就是对某件事物的标记和解释，用来描述这件事物的特点和属性。举个例子，前一阵看《创造 101》，看到了一名熟悉的 `Rapper` -- Yamy，参加这个节目之后，她又被打上了 `Dancer` 的标签。对于 Yamy 来说，`Rapper` 和 `Dancer` 就是对她的注解。我们通过注解，可以在一定程度上了解到被标记事物的一些属性，我们就可以用这些属性来做一些事情。比如在《中国有嘻哈》利用 `Rapper` 标签宣传 Yamy 的说唱能力，而在《创造 101》利用 `Dancer` 标签宣传 Yamy 的跳舞能力等。

从上面的例子我们可以看出来，通过获取事物的注解，可以得到事物的属性，利用这些属性可以进行一些操作。代码也是这样，通过获取代码的注解，我们可以获得注解赋予代码的属性，利用这些属性，我们就可以在程序的生命周期中，对具有这些属性的代码进行额外的操作。

<!-- more -->

### Annotation 组成部分

#### 关键代码

java annotation 的组成中，有 3 个非常重要的 java 文件。它们分别是：

##### Annotation.java

```
package java.lang.annotation;
public interface Annotation {

    boolean equals(Object obj);

    int hashCode();

    String toString();

    Class<? extends Annotation> annotationType();
}
```

##### ElementType.java

```
package java.lang.annotation;

public enum ElementType {
    TYPE,               /* 类、接口（包括注释类型）或枚举声明  */

    FIELD,              /* 字段声明（包括枚举常量）  */

    METHOD,             /* 方法声明  */

    PARAMETER,          /* 参数声明  */

    CONSTRUCTOR,        /* 构造方法声明  */

    LOCAL_VARIABLE,     /* 局部变量声明  */

    ANNOTATION_TYPE,    /* 注释类型声明  */

    PACKAGE             /* 包声明  */
}
```

##### RetentionPolicy.java

```
package java.lang.annotation;
public enum RetentionPolicy {
    SOURCE,            /* Annotation 信息仅存在于编译器处理期间，该 Annotation 信息不会进行存储到. class 文件中  */

    CLASS,             /* 编译器将 Annotation 存储于类对应的. class 文件中。默认行为  */

    RUNTIME            /* 编译器将 Annotation 存储于 class 文件中，并且可由 JVM 读入 */
}
```

#### 代码简析

上面三个类的关系如下图：

![](/uploads/in-post/java/java_annotation.jpg)

从中我们可以看出：

+   一个 Annotation 和一个 RetentionPolicy 唯一关联，即每个 Annotation 对象，都会有一个唯一的 RetentionPolicy 属性
+   一个 Annotation 和多个 ElementType 相关联，即每个 Annotation 对象，可以有一个或多个 Elementtype 属性

从代码中我们可以看出：

+   Annotation 是一个接口。当我们自定义注解时，需要添加 @interface 字段，相当于注解实现了 Annotation 接口，之后会有讲解
+   ElementType 是枚举类型，记录了注解可以标记的类型。例如一个 Annotation 标记了 METHOD 类型，则该 Annotation 只可以用来注解方法
+   RetentionPolicy 是枚举类型，记录了注解的保留策略。
  - 若为 SOURCE 类型，表示该 Annotation 只存在于编译器处理期间，编译结束后，该 Annotation 的信息则失去作用
  - 若为 CLASS 类型，表示该 Annotation 编译后会被存储于类对应的. class 文件中，但是 JVM 在加载类的时候不需要将其加载为运行时可见的（反射可见）的注解。这里很重要的一点是编译多个 Java 文件时的情况：假如要编译 A.java 源码文件和 B.class 文件，其中 A 类依赖 B 类，并且 B 类上有些注解希望让 A.java 编译时能看到，那么 B.class 里就必须要持有这些注解信息才行。
  - 若为 RUNTIME 注解，表示该 Annotation 编译后会被存储于类对应的. class 文件中，并且 JVM 加载类的时候也会将其加载为反射可见的注解。

### Annotation 语法

#### 注解的定义

注解通过 `@interface` 关键字进行定义

```
public @interface TestAnnotation {
}
```

现在，我们创建了一个 `TestAnnotation` 的注解，可以使用它对代码进行注解。

#### 注解的使用

将创建的注解使用 java annotation 的方式添加到代码顶部，即为代码增加了注解：

```
@TestAnnotation
public class Test {
}
```

这里，我们对 Test 类添加了 TestAnnotation 的注解，这样 Test 类就具有了 TestAnnotation 注解的所有属性，当然，目前 TestAnnotation 注解中还没有加入属性，之后会有相关讲解。

#### 元注解

到这里，我们已经简单的创建并使用了注解，但是仅仅使用这种默认的注解并不能达到理想的效果，所以 java 提供了 ` 元注解 ` 来帮助我们丰富注解的功能。

那么什么是元注解呢？简单来说，元注解就是注解的注解。我们自定义的注解可以为代码增加属性，而元注解可以为我们的注解增加属性。

元注解一共有五种：

+   @Documented
+   @Target
+   @Retention
+   @Inherited
+   @Repeatable

##### @Documented

使用此元注解会将注解中的元素包含到 Javadoc 中

##### @Target

此元注解对应了 ElementType 的类型，用于限制注解可以注解到哪些场景下，有以下取值：

```
ElementType.ANNOTATION_TYPE 可以给一个注解进行注解
ElementType.CONSTRUCTOR 可以给构造方法进行注解
ElementType.FIELD 可以给属性进行注解
ElementType.LOCAL_VARIABLE 可以给局部变量进行注解
ElementType.METHOD 可以给方法进行注解
ElementType.PACKAGE 可以给一个包进行注解
ElementType.PARAMETER 可以给一个方法内的参数进行注解
ElementType.TYPE 可以给一个类型进行注解，比如类、接口、枚举
```

使用了 `@Target` 元注解之后，注解就被限制在定义的场景下使用了，例如 `@Target(ElementType.METHOD)` 表示注解只能用于标记方法。

##### @Retention

此注解对应了 RetentionPolicy 的类型，用于限制注解的存活时间，有以下取值：

```
RetentionPolicy.SOURCE 注解只在源码阶段保留，在编译器进行编译时它将被丢弃忽视。
RetentionPolicy.CLASS 注解只被保留到编译进行的时候，它并不会被加载到 JVM 中。
RetentionPolicy.RUNTIME 注解可以保留到程序运行的时候，它会被加载进入到 JVM 中，所以在程序运行时可以获取到它们。
```

使用了 `@Retention` 元注解之后，注解的生命周期就被决定了，例如 `@Retention(RetentionPolicy.RUNTIME)` 表示注解可以在程序运行期间被获取到。

##### @Inherited

使用此元注解表示子类如果没有自己的注解，会继承父类的注解，例如：

```
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@interface TestAnnotation {}

@TestAnnotation
public class A {}

public class B extends A {}
```

注解 `@TestAnnotation` 被 `@Inherited` 修饰，之后类 A 被 TestAnnotation 注解，类 B 继承 A，则类 B 也拥有 TestAnnotation 这个注解。

##### @Repeatable

`@Repeatable` 是 Java 1.8 加进来的特性，表示注解可以多次使用。

举个例子，一个人他既是程序员又是产品经理, 同时他还是个艺术家：

```
@interface Persons {
    Person[]  value();
}


@Repeatable(Persons.class)
@interface Person{
    String role default "";
}


@Person(role="artist")
@Person(role="coder")
@Person(role="PM")
public class SuperMan{
}
```

从上面的代码我们可以看到，`@Repeatable` 元注解注解了 `@Person` 注解，其中的参数是一个用于存放其他注解的 ` 容器注解 `。

按照规定，它里面必须要有一个 `value` 的属性，属性类型是一个被 `@Repeatable` 注解过的注解数组，注意它是数组。

Persons 是标签盒子，里面放满了 Person 这种同类型但内容不一样的标签。把 Persons 送给一个 SuperMan ，相当于同时把盒子里面的所有标签贴在了 SuperMan 身上。

#### 注解的属性

注解的属性类似于类的成员变量。但是注解只有属性，而没有方法。注解的属性以 ` 无形参方法 ` 的方式来声明，其方法名定义了该成员变量的名字，其返回值定义了该成员变量的类型：

```
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface TestAnnotation {
    int id();
    String msg();
}
```

上面代码定义了 `@TestAnnotation` 这个注解中拥有 id 和 msg 两个属性。在使用的时候，我们应该给它们进行赋值。

** 注意：在注解中定义属性时它的类型必须是 8 种基本数据类型外加 类、接口、注解及它们的数组 **

赋值方式是在注解的括号内以 value=”” 形式，多个属性之前用 `,` 隔开, 如下：

```
@TestAnnotation(id=3, msg="hello annotation")
public class Test {
}
```

当然，注解中属性也可以有默认值，默认值需要用 default 关键值指定。比如：

```
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface TestAnnotation {
    public int id() default -1;
    public String msg() default "Hi";
}
```

`@TestAnnotation` 注解中 id 属性默认值为 -1，msg 属性默认值为 Hi。这样即使不对注解进行 id 和 msg 的赋值，也会拥有默认值。

此外，如果一个注解内仅仅只有一个名字为 value 的属性时，应用这个注解时可以直接接属性值填写到括号内。

```
public @interface Check {
    String value();
}

@Check("hi")
int a;

@Check(value="hi")
int a;
```

上面两种注解变量 a 的方式是相同的。

### Java 预置注解

除了我们自定义注解之外，Java 已经内置了一些常用的注解：

+   @Deprecated
+   @Override
+   @SuppressWarnings
+   @SafeVarargs
+   @FunctionalInterface

#### @Deprecated

此注解用于标注过时的，不被推荐使用的方法，属于编译期注解（ElementType.SOURCE），编译器在编译阶段遇到这个注解时会发出提醒警告，告诉开发者正在调用一个过时的元素比如过时的方法、过时的类、过时的成员变量。

```
public class TestAnnotation {
    @Deprecated
    public void deprecatedMethod(){
        System.out.println("Noting has to say!");
    }

    public void newMethod(){
        System.out.println("I have a dream!");
    }

    public static void main(String[] args) {
        TestAnnotation testAnnotation = new TestAnnotation();
        testAnnotation.deprecatedMethod();
        testAnnotation.newMethod();
    }
}
```

在 IDE 中可以看到，deprecatedMethod() 方法将会被划掉，以提示用户该方法已过时：

![](/uploads/in-post/java/deprecated_annotation.png)

#### @Override

这个注解应该是使用最多的注解之一了，主要用于提示子类复写父类中被 `@Override` 修饰的方法，同样属于编译期注解。

#### @SuppressWarnings

这个注解同样是编译期注解，主要用于阻止编译期的警告，之前调用被 `@Deprecated` 注解的方法后，编译器会警告提醒，而有时候开发者会忽略这种警告，他们可以在调用的地方通过 `@SuppressWarnings` 达到目的。

![](/uploads/in-post/java/suppress_warnings_annotation.png)

#### @SafeVarargs

参数安全类型注解。它的目的是提醒开发者不要用参数做一些不安全的操作，它会阻止编译器产生 unchecked 这样的警告。

```
@SafeVarargs
static void m(List<String>... stringLists) {
    Object[] array = stringLists;
    List<Integer> tmpList = Arrays.asList(42);
    array[0] = tmpList;
    String s = stringLists[0].get(0);
}
```

上面的代码中，编译阶段不会报错，但是运行时会抛出 ClassCastException 这个异常，所以尽量还是不要使用这个注解。

#### @FunctionalInterface

函数式接口注解，这个是 Java 1.8 版本引入的新特性。

函数式接口 (Functional Interface) 就是一个具有一个方法的普通接口。

```
@FunctionalInterface
public interface Runnable {
    /**
     * When an object implementing interface <code>Runnable</code> is used
     * to create a thread, starting the thread causes the object's
     * <code>run</code> method to be called in that separately executing
     * thread.
     * <p>
     * The general contract of the method <code>run</code> is that it may
     * take any action whatsoever.
     *
     * @see     java.lang.Thread#run()
     */
    public abstract void run();
}
```

 Runnable 接口就是一个典型的函数式接口，通过源码我们可以看到它就被 `@FunctionalInterface` 注解。而函数式接口一般被用于 Java 的 Lambda 表达式，感兴趣的话可以搜索学习相关内容。

### 注解的提取和使用

之前我们提到过，通过注解，可以在一定程度上了解到被标记事物的一些属性，我们就可以用这些属性来做一些事情。所以如果去获取这些属性并做一些事就是我们接下来要讨论的内容。

想要提取和使用注解，需要利用 Java 的一个特点，那就是反射。

通过反射，我们可以在程序运行阶段获取到注解中的属性，并根据这些属性进行额外的操作。

#### 注解与反射

注解通过反射获取。首先可以通过 Class 对象的 isAnnotationPresent() 方法判断它是否被某个注解标记。

```
public boolean isAnnotationPresent(Class<? extends Annotation> annotationClass) {}
```

如果拥有注解，则可以使用 getAnnotation() 方法来获取 Annotation 对象，或使用 getAnnotations() 方法来获取多个 Annotation 对象。

```
public <A extends Annotation> A getAnnotation(Class<A> annotationClass) {}
public Annotation[] getAnnotations() {}
```

前一种方法返回指定类型的注解，后一种方法返回注解到这个元素上的所有注解。

如果能够获取到注解，我们就可以使用注解中的属性了：

```
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface TestAnnotation {
    int id() default -1;
    String msg() default "Hi";
}

@TestAnnotation()
public class Test {

    public static void main(String[] args) {

        boolean hasAnnotation = Test.class.isAnnotationPresent(TestAnnotation.class);

        if ( hasAnnotation ) {
            TestAnnotation testAnnotation = Test.class.getAnnotation(TestAnnotation.class);

            System.out.println("id:"+testAnnotation.id());
            System.out.println("msg:"+testAnnotation.msg());
        }

    }

}
```

程序的运行结果是：

```
id:-1
msg:Hi
```

**注意：如果一个注解要在运行时被成功提取，那么 @Retention(RetentionPolicy.RUNTIME) 是必须的。**

#### 注解的使用场景

官方文档对于 Java 注解的文档是这样说明的：

```
注解是一系列元数据，它提供数据用来解释程序代码，但是注解并非是所解释的代码本身的一部分。注解对于代码的运行效果没有直接影响。

注解有许多用处，主要如下：
- 提供信息给编译器： 编译器可以利用注解来探测错误和警告信息
- 编译阶段时的处理： 软件工具可以用来利用注解信息来生成代码、Html文档或者做其它相应处理。
- 运行时的处理： 某些注解可以在程序运行的时候接受代码的提取
```

从上面的描述中我们可以看出来，注解仅仅是对代码的一个标记，不会对代码的运行自动产生任何影响。 所以如果我们想要对拥有某些注解的代码进行操作的话，需要`自己编写代码`来提取注解信息，并处理这些信息，执行一些代码之外的操作。

说了这么多，我们用实际的代码来感受一下如何使用注解吧！

#### 自定义注解

注解的使用可以贯穿程序的整个生命周期，何时何地使用注解完全由程序员自己决定，举一个简单的例子：

首先创建一个 `@CheckLogin` 注解：

```
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface CheckLogin {

}
```

我想在调用 `getName()` 方法之前检查是否有这个注解，如果有，则检查登录状态，如果没有则通知用户先登录：

```
import java.lang.reflect.Method;

public class TestAnnotation {

    @CheckLogin
    public void getName() {
        System.out.println("获取姓名");
    }

    public static void main(String[] args) {
        boolean loggedIn = true;
        try {
            Method getNameMethod = TestAnnotation.class.getDeclaredMethod("getName");

            if (getNameMethod != null) {
                CheckLogin checkLogin = getNameMethod.getAnnotation(CheckLogin.class);
                if (checkLogin != null) {
                    System.out.println("需要检查登录");
                    if (!loggedIn) {
                        System.out.println("请先登录");
                        return;
                    }
                }
            }
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        TestAnnotation testAnnotation = new TestAnnotation();
        testAnnotation.getName();
    }
}
```

输出结果为：

```
// loggedIn = true
需要检查登录
获取姓名
// loggedIn = false
需要检查登录
请先登录
```

这只是一个最简单的注解使用的例子，如何更好地使用注解，就需要各位自己去发掘啦~~

**最后再提一句，由于注解的提取需要借助于 Java 的反射技术，反射会降低程序运行效率，所以使用注解时也需要谨慎考虑时间成本。**

### 参考

1、frank909，[秒懂，Java 注解 （Annotation）你可以这样学](https://blog.csdn.net/briblue/article/details/73824058)

2、skywang12345，[Java Annotation认知](https://www.cnblogs.com/skywang12345/p/3344137.html)
