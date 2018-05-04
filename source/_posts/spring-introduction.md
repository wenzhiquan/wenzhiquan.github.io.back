---
layout:     post
title:      "Spring简介"
date:       2018-04-15 12:00:00
copyright: true
categories:
    - Java
    - Spring
tags:
    - Spring
---

> “本章将从宏观的层面上介绍Spring。”

### 简化Java开发

Spring采取4种关键策略简化Java开发：

+ 基于POJO的轻量级和最小侵入性编程
+ 通过依赖注入和面向接口实现松耦合
+ 基于切面和惯例进行声明式编程
+ 通过切面和模板减少样板式代码

#### POJO

Spring不强迫实现Spring规范的接口或继承Spring规范的类，最坏的场景是使用了Sprin的注解，但他依旧是POJO。

Spring赋予POJO魔力的方式是通过DI来装配他们。

#### 依赖注（Dependenc Injection）

依赖注入又可以称为控制反转（IOC，Inversion of Control），通过使用DI，对象的依赖关系将由系统中负责协调各对象的第三方组件在创建对象时进行设定，对象无需自行创建或管理他们的依赖关系。

依赖注入有四种方式：

1. 构造器注入
2. setter注入
3. 静态工厂的方法注入
4. 实例工厂的方法注入

DI带来的最大收益是**松耦合**，创建应用组件之间的行为通常称为`装配`（wiring），Spring支持使用XM文件和Java文件来进行装配

Spring通过应用上下文（Applicaiton Context）装载bea的定义并把它们组装起来。Spring应用上下文全权负责对象的创建和组装。

#### 应用切面

面向切面编程（Aspect-Oriented Programming)允许你把遍布应用各处的功能分离出来形成可重用的组件，可以使服务模块化，并以声明的方式将他们应用到他们需要影响的组件中去。

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
<!-- more -->

#### 使用模板消除样板式代码

Spring的JdbcTemplate使得执行数据库操作时，避免传统的JDBC样板代码成为了可能。


### 容纳你的Bean

在基于Spring的应用中，应用对象生存在Spring容器中，Spring容器负责创建对象，装配对象，配置对象管理他们的整个生命周期。

容器是Spring的核心，Spring容器使用DI管理构成应用的组件，他会创建相互协作的组件之间的关联。

#### 使用应用上下文

Spring自带多种类型的应用上下文，常用的有以下几种：

+ AnnotationConfigApplicationContext：从一个或多个基于Java的配置类中加载Spring应用上下文
+ AnnotationConfigWebApplicationContext：从一个或多个基于Java的配置类中加载Spring Web应用上下文
+ ClassPathXmlApplicationContext：从类路径下的一个或多个XML配置文件中加载上下文定义，把应用上下文的定义文件作为类资源
+ FileSystemXmlApplicationContext：从文件系统下的一个或多个XMl配置文件中加载上下文定义
+ XmlWebApplicationContex：从Web应用的一个或多个XML配置文件中加载上下文定义

#### Bean的生命周期

Spring容器中的Bean生命周期比较复杂，如下图：

![](https://pic3.zhimg.com/80/754a34e03cfaa40008de8e2b9c1b815c_hd.jpg)

##### 实例化Bean

当客户向容器请求一个尚未初始化的Bean时，或初始化Bean时需要注入另一个尚未初始化的依赖时，容器就会调用createBean方法进行实例化，实例化对象呗包装在BeanWrapper对象中，BeanWrapper提供了设置对象属性的接口，这个步骤没有进行依赖注入。

##### 设置对象属性

Spring根据BeanDefinition中的信息，将值和Bean的引用通过BeanWrapper提供的设置属性的接口注入到Bean对应的属性中。

##### 调用setBeanName()方法

如果Bean实现了BeanNameAware接口，Spring将Bean的ID传递给setBeanName(String beanId)方法

##### 调用setBeanFactory()方法

如果Bean实现了BeanFactoryAware接口，Spring将调用setBeanFactory()方法，传入BeanFactory容器。

##### 调用setApplicationContext()方法

如果Bean实现了ApplicationContextAware接口，Spring将调用setApplicationContext()方法，传入Bean所在的应用上下文的引用。

##### 调用BeanPostProcessor接口的postProcessBeforeInitialization()方法

如果Bean实现了BeanPostProcessor接口，Spring将调用他们的postProcessBeforeInitialization()方法，当前正在初始化的对象会被传递进来，我们就可以对这个Bean做任何处理，此函数会先于InitializationBean执行，因此称为前置处理，`所有Awar接口的注入`就是在这一步完成的。

##### 调用InitializingBean接口的afterPropertiesSet()方法

当前置处理完成后进入本阶段，本阶段可以在Bean正式构建前增加我们自定义的逻辑，但是由于并没有把Bean对象传递进来，因此本阶段无法处理对象本身，只能增加一些额外的逻辑。

若要使用他，需要让Bean实现该接口，并把要增加的逻辑写入该函数当中，Spring火灾前置处理完成后检测当前Bean是否实现了该接口，并执行该函数。

类似地，Spring为Bean的配置提供了init-method属性，该属性指定了在本阶段需要执行的函数名，Spring会在初始化阶段执行设置的函数。init-method本质上也是使用了InitializingBean接口。

##### 调用BeanPostProcessor接口的postProcessAfterInitialization()方法

如果Bean实现了BeanPostProcessor接口，Spring将调用他们的postProcessAfterInitialization()方法，当前正在初始化的Bean对象会被传递进来，我们可以对这个对象做任何处理，这个函数回来InitializingBean完成后执行，因此成为后置处理。

##### 准备就绪

此时，Bean已经准备就绪，可以被应用程序使用了，他们将一直驻留在应用上下文中，直到被该应用上下文销毁。

##### 调用DisposableBean接口的destroy()方法

如果Bean实现了DisposableBean接，Spring将调它的destroy()方法，可以在Bean销毁前执行指定的逻辑，类似的，通过给destroy-method属性指定函数，可以在Bean小回迁执行这个函数
