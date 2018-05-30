---
layout:     post
title:      "Spring 简介"
date:       2018-04-15 12:00:00
updated:    2018-05-30 12:00:00
copyright: true
categories:
    - Java
    - Spring
tags:
    - Spring
---

> “本章将从宏观的层面上介绍 Spring。”

### 简化 Java 开发

Spring 采取 4 种关键策略简化 Java 开发：

* 基于 POJO 的轻量级和最小侵入性编程
* 通过依赖注入和面向接口实现松耦合
* 基于切面和惯例进行声明式编程
* 通过切面和模板减少样板式代码

<!-- more -->

#### POJO

Spring 不强迫实现 Spring 规范的接口或继承 Spring 规范的类，最坏的场景是使用了 Sprin 的注解，但他依旧是 POJO。

Spring 赋予 POJO 魔力的方式是通过 DI 来装配他们。

#### 依赖注（Dependenc Injection）

依赖注入又可以称为控制反转（IOC，Inversion of Control），通过使用 DI，对象的依赖关系将由系统中负责协调各对象的第三方组件在创建对象时进行设定，对象无需自行创建或管理他们的依赖关系。

依赖注入有四种方式：

1. 构造器注入
2. setter 注入
3. 静态工厂的方法注入
4. 实例工厂的方法注入

DI 带来的最大收益是 **松耦合**，创建应用组件之间的行为通常称为 ` 装配 `（wiring），Spring 支持使用 XM 文件和 Java 文件来进行装配

Spring 通过应用上下文（Applicaiton Context）装载 bea 的定义并把它们组装起来。Spring 应用上下文全权负责对象的创建和组装。

#### 应用切面

面向切面编程（Aspect-Oriented Programming) 允许你把遍布应用各处的功能分离出来形成可重用的组件，可以使服务模块化，并以声明的方式将他们应用到他们需要影响的组件中去。

定义方法：

```
<aop:config>
  <aop:aspect ref="beanname">
    <aop:pointcut id="pointcutId" expression="execution(* *.functionName(..))"/>

    <aop:before pointcut-ref="pointcutId" method="beforeMethodName"/>
    <aop:after pointcut-ref="pointcutId" method="afterMethodName"/>
  </aop:aspect>
</aop:config>
```

#### 使用模板消除样板式代码

Spring 的 JdbcTemplate 使得执行数据库操作时，避免传统的 JDBC 样板代码成为了可能。

### 容纳你的 Bean

在基于 Spring 的应用中，应用对象生存在 Spring 容器中，Spring 容器负责创建对象，装配对象，配置对象管理他们的整个生命周期。

容器是 Spring 的核心，Spring 容器使用 DI 管理构成应用的组件，他会创建相互协作的组件之间的关联。

#### 使用应用上下文

Spring 自带多种类型的应用上下文，常用的有以下几种：

* AnnotationConfigApplicationContext：从一个或多个基于 Java 的配置类中加载 Spring 应用上下文
* AnnotationConfigWebApplicationContext：从一个或多个基于 Java 的配置类中加载 Spring Web 应用上下文
* ClassPathXmlApplicationContext：从类路径下的一个或多个 XML 配置文件中加载上下文定义，把应用上下文的定义文件作为类资源
* FileSystemXmlApplicationContext：从文件系统下的一个或多个 XMl 配置文件中加载上下文定义
* XmlWebApplicationContex：从 Web 应用的一个或多个 XML 配置文件中加载上下文定义

#### Bean 的生命周期

Spring 容器中的 Bean 生命周期比较复杂，如下图：

![](/uploads/in-post/spring-introduciton/bean_lifecycle.png)

##### 实例化 Bean

当客户向容器请求一个尚未初始化的 Bean 时，或初始化 Bean 时需要注入另一个尚未初始化的依赖时，容器就会调用 createBean 方法进行实例化，实例化对象呗包装在 BeanWrapper 对象中，BeanWrapper 提供了设置对象属性的接口，这个步骤没有进行依赖注入。

##### 设置对象属性

Spring 根据 BeanDefinition 中的信息，将值和 Bean 的引用通过 BeanWrapper 提供的设置属性的接口注入到 Bean 对应的属性中。

##### 调用 setBeanName() 方法

如果 Bean 实现了 BeanNameAware 接口，Spring 将 Bean 的 ID 传递给 setBeanName(String beanId) 方法

##### 调用 setBeanFactory() 方法

如果 Bean 实现了 BeanFactoryAware 接口，Spring 将调用 setBeanFactory() 方法，传入 BeanFactory 容器。

##### 调用 setApplicationContext() 方法

如果 Bean 实现了 ApplicationContextAware 接口，Spring 将调用 setApplicationContext() 方法，传入 Bean 所在的应用上下文的引用。

##### 调用 BeanPostProcessor 接口的 postProcessBeforeInitialization() 方法

如果 Bean 实现了 BeanPostProcessor 接口，Spring 将调用他们的 postProcessBeforeInitialization() 方法，当前正在初始化的对象会被传递进来，我们就可以对这个 Bean 做任何处理，此函数会先于 InitializationBean 执行，因此称为前置处理，`所有 Aware 接口的注入` 就是在这一步完成的。

##### 调用 InitializingBean 接口的 afterPropertiesSet() 方法

当前置处理完成后进入本阶段，本阶段可以在 Bean 正式构建前增加我们自定义的逻辑，但是由于并没有把 Bean 对象传递进来，因此本阶段无法处理对象本身，只能增加一些额外的逻辑。

若要使用他，需要让 Bean 实现该接口，并把要增加的逻辑写入该函数当中，Spring 火灾前置处理完成后检测当前 Bean 是否实现了该接口，并执行该函数。

类似地，Spring 为 Bean 的配置提供了 init-method 属性，该属性指定了在本阶段需要执行的函数名，Spring 会在初始化阶段执行设置的函数。init-method 本质上也是使用了 InitializingBean 接口。

##### 调用 BeanPostProcessor 接口的 postProcessAfterInitialization() 方法

如果 Bean 实现了 BeanPostProcessor 接口，Spring 将调用他们的 postProcessAfterInitialization() 方法，当前正在初始化的 Bean 对象会被传递进来，我们可以对这个对象做任何处理，这个函数回来 InitializingBean 完成后执行，因此成为后置处理。

##### 准备就绪

此时，Bean 已经准备就绪，可以被应用程序使用了，他们将一直驻留在应用上下文中，直到被该应用上下文销毁。

##### 调用 DisposableBean 接口的 destroy() 方法

如果 Bean 实现了 DisposableBean 接，Spring 将调它的 destroy()方法，可以在 Bean 销毁前执行指定的逻辑，类似的，通过给 destroy-method 属性指定函数，可以在 Bean 小回迁执行这个函数
