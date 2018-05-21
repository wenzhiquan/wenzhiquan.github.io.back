---
layout:     post
title:      "使用IDEA和gradle创建超市管理系统（贰）-- 登录注册功能"
date:       2017-02-05 12:00:00
copyright: true
categories:
    - Java
tags:
    - Java
    - Web
    - Gradle
---

> “IDEA是jetbrains公司开发的Java开发IDE，功能齐全。使用IDEA搭建SSM开发环境简单有效。本项目基于Spring，Spring MVC和MyBatis进行开发，模板引擎为Thymeleaf。”

### 主要功能概述

因为是为超市定制的管理系统，所以只会有内部人员进行使用，这就意味着新用户是需要拥有权限的人来进行添加，故需要实现的功能主要包括以下两点：

+ 用户添加
+ 用户登录

这两点功能中又包含了一些更细小的功能，将在后续章节进行详细的介绍。

<!-- more -->

### 后台前端模板

由于本人不擅长前端页面的编写，故采用了开源的后台系统模板进行改造，后台系统模板的名称为[Gentallela](https://colorlib.com/polygon/gentelella/index.html)，下载地址是在作者的[Github](https://github.com/puikinsh/gentelella)，感兴趣的同学可以前往下载。

### 用户添加功能

用户添加功能分为以下几个步骤进行完成：

+ 添加数据库
+ 编写对应的model
+ 编写对应的mapper
+ 编写对应的service
+ 编写对应的controller
+ 编写对应的js请求和前端页面

#### 添加数据库

首先需要建立一个user表，用于存储用户信息。

```
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `email` varchar(45) NOT NULL COMMENT '用户邮箱',
  `salt` int(4) NOT NULL COMMENT '盐',
  `authority` int(2) NOT NULL DEFAULT '0' COMMENT '用户身份',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '账户状态',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8
```

其中`salt`的作用是和`password`一起作用生成一个不可破解的密码，加密方式用的是`MD5`加密。

#### 编写User类

User类中的属性和数据库的字段是一一对应的。

```
public class User {
    private int id;
    private String username;
    private String password;
    private String email;
    private int salt;
    private int status;
    private Date createdTime;
    private Date updatedTime;

    // 需要生成所有属性的get和set方法。
```

#### 编写UserMapper接口和UserMapper.xml文件

UserMapper接口为UserService提供可以调用的数据库操作接口。

```
@Repository
public interface UserMapper {
    // 由于接口方法默认且必须是public的，所以无需添加此关键字
    User selectByName(String name);

    User selectByEmail(String name);

    int addUser(User user);
}
```

而UserMapper.xml用于实现具体的数据库调用方法。

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org/DTD Mapper 3.0" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- namespace必须和UserMapper接口相对应 -->
<mapper namespace="cn.edu.bupt.wen.mapper.UserMapper">
    <!-- 自定义返回结果集 -->
    <!-- 由于Mybatis无法自动将DateTime类型和java.util.Date类型进行自动映射，故需要手动配置 -->
    <resultMap id="userMap" type="User">
        <id property="id" column="id" javaType="java.lang.Integer"></id>
        <result property="username" column="username" javaType="java.lang.String"></result>
        <result property="password" column="password" javaType="java.lang.String"></result>
        <result property="email" column="email" javaType="java.lang.String"></result>
        <result property="salt" column="salt" javaType="java.lang.Integer"></result>
        <result property="status" column="status" javaType="java.lang.Integer"></result>
        <result property="createdTime" column="created_time" jdbcType="DATE" javaType="java.util.Date"></result>
        <result property="updatedTime" column="updated_time" jdbcType="DATE" javaType="java.util.Date"></result>
    </resultMap>

    <sql id="tableName">user</sql>

    <sql id="insertFields">username, password, email, salt, status, created_time, updated_time</sql>

    <sql id="selectFields">id, <include refid="insertFields"/></sql>

    <!-- 方法的id必须和UserMapper接口中定义的方法名相同 -->
    <!-- parameterType必须和传入的参数类型相同，若要传多个参数需要在Mapper接口中加@Param注解 -->
    <select id="selectByName" parameterType="java.lang.String" resultMap="userMap">
        SELECT
        <include refid="selectFields"/>
        FROM
        <include refid="tableName"/>
        WHERE username = #{username}
    </select>

    <select id="selectByEmail" parameterType="java.lang.String" resultMap="userMap">
        SELECT
        <include refid="selectFields"/>
        FROM
        <include refid="tableName"/>
        WHERE email = #{email}
    </select>

    <insert id="addUser" parameterType="User">
        INSERT INTO
        <include refid="tableName"/>
        (<include refid="insertFields"/>)
        VALUES
        (#{username}, #{password}, #{email}, #{salt}, #{status}, #{createdTime}, #{updatedTime})
    </insert>
</mapper>
```

#### 编写UserService

UserService调用UserMapper的方法，并为UserController提供返回值。

```
@Service
public class UserService {
    // 利用slf4j生成log信息
    private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserMapper userMapper;

    public User getUserByName(String username) {
        return userMapper.selectByName(username);
    }

    /**
     * add a new user
     *
     * @param username
     * @param email
     * @return map
     * @author wenzhiquan
     */
    public Map<String, Object> addUser(String username, String email) {
        logger.info("UserService addUser");
        Map<String, Object> map = new HashMap<>();
        if (StringUtils.isEmpty(username)) {
            map.put("msg", "username can not be empty");
            return map;
        }

        if (userMapper.selectByName(username) != null) {
            map.put("msg", "username existed");
            return map;
        }

        if (StringUtils.isEmpty(email)) {
            map.put("msg", "email can not be empty");
            return map;
        }

        if (userMapper.selectByEmail(email) != null) {
            map.put("msg", "email existed");
            return map;
        }
        // 随机生成一个四位数的盐
        int salt = (int)Math.random() * 8999 + 1000;
        StringBuilder sb = new StringBuilder();
        sb.append(MD5Util.md5(username + "123")).append(String.valueOf(salt));
        String password = MD5Util.md5(sb.toString());
        int status = Constant.Status.NEED_CHANGE_PWD.getIndex();
        Date date = new Date();
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setSalt(salt);
        user.setStatus(status);
        user.setCreatedTime(date);
        user.setUpdatedTime(date);

        userMapper.addUser(user);
        return map;
    }
```

其中使用的MD5Util为自己编写的MD5加密算法。

```
public class MD5Util {

    /**
     * 获取加密后的字符串
     * @param pw
     * @return
     */
    public static String md5(String pw) {
        try {

            // 拿到一个MD5转换器（如果想要SHA1参数换成”SHA1”）
            MessageDigest messageDigest =MessageDigest.getInstance("MD5");
            // 输入的字符串转换成字节数组
            byte[] inputByteArray = pw.getBytes();
            // inputByteArray是输入字符串转换得到的字节数组
            messageDigest.update(inputByteArray);
            // 转换并返回结果，也是字节数组，包含16个元素
            byte[] resultByteArray = messageDigest.digest();
            // 字符数组转换成字符串返回
            return byteArrayToHex(resultByteArray);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    public static String byteArrayToHex(byte[] byteArray) {

        // 首先初始化一个字符数组，用来存放每个16进制字符
        char[] hexDigits = {'0','1','2','3','4','5','6','7','8','9', 'A','B','C','D','E','F' };
        // new一个字符数组，这个就是用来组成结果字符串的（解释一下：一个byte是八位二进制，也就是2位十六进制字符（2的8次方等于16的2次方））
        char[] resultCharArray =new char[byteArray.length * 2];
        // 遍历字节数组，通过位运算（位运算效率高），转换成字符放到字符数组中去
        int index = 0;
        for (byte b : byteArray) {
            resultCharArray[index++] = hexDigits[b>>> 4 & 0xf];
            resultCharArray[index++] = hexDigits[b& 0xf];
        }
        // 字符数组组合成字符串返回
        return new String(resultCharArray);
    }
}
```

Constant为自己编写的常量枚举魔法数

```
public class Constant {
  public enum Status {
    AVAILABLE("available", 0),
    UNAVAILABLE("unavailable", 1),
    NEED_CHANGE_PWD("need change password", 2);

    public String name;
    public int index;

    Status(String name, int index) {
        this.name = name;
        this.index = index;
    }

    public String getName() {
        return name;
    }

    public int getIndex() {
        return index;
    }

    public static String getNameByIndex(int index) {
        for (Status c : Status.values()) {
            if (c.getIndex() == index) {
                return c.name;
            }
        }
        return null;
    }
  }
}
```

#### 编写UserController

UserController用于处理用户请求并返回数据。

```
@Controller
public class UserController {
  private static final Logger logger = LoggerFactory.getLogger(UserController.class);

  @Autowired
  private UserService userService;

  @RequestMapping(path = {"/addUser"}, method = {RequestMethod.GET})
  public String addUser(Model model) {
    // model用于向view层返回数据
    model.addAttribute("title", "addUser");
    // 返回值为模板所在目录及其名称
    return "user/addUser";
  }

  @RequestMapping(path = {"/addUser"}, method = {RequestMethod.POST})
  @ResponseBody // 加上此字段后表明返回的数据直接发送给浏览器而不经过模板引擎渲染
  public String addUser(@RequestParam("username") String username,
                        @RequestParam("email") String email,
                        HttpServletResponse response) {
    try {
        Map<String, Object> map = userService.addUser(username, email);
        if (map.containsKey("msg")) {
            return JsonUtil.getJSONString(1, map);
        }
        map.put("msg", "success");
        return JsonUtil.getJSONString(0, map);

    } catch (Exception e) {
        logger.error("add user failed!");
        Map<String, Object> map = new HashMap<>();
        map.put("msg", "add user failed.");
        return JsonUtil.getJSONString(1, map);
    }
  }
}
```

JsonUtil为自己编写的将数据转换为json字符串的工具类。

```
public class JsonUtil {
  private static final Logger logger = LoggerFactory.getLogger(JsonUtil.class);

  /**
   * Generate a json string with certain code
   * @author wenzhiquan
   * @param code
   * @return json String
   */
  public static String getJSONString(int code) {
      JSONObject json = new JSONObject();
      json.put("code", code);
      return json.toJSONString();
  }

  /**
   * Generate a json string with code and message
   * @author wenzhiquan
   * @param code
   * @param msg
   * @return json String
   */
  public static String getJSONString(int code, String msg) {
      JSONObject json = new JSONObject();
      json.put("code", code);
      json.put("msg", msg);
      return json.toJSONString();
  }

  /**
   * Generate a json string with code and map
   * @author wenzhiquan
   * @param code
   * @param map
   * @return json String
   */
  public static String getJSONString(int code, Map<String, Object> map) {
      JSONObject json = new JSONObject();
      json.put("code", code);
      for (Map.Entry<String, Object> entry: map.entrySet()) {
          json.put(entry.getKey(), entry.getValue());
      }
      return json.toJSONString();
  }
}
```

#### 编写对应的js请求和前端页面

前端页面分为base，nav和sidebar，和页面内容addUser四大部分。

nav:

```
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head th:replace="~{common/base::common_header(_)}">
</head>
<body>
<!-- top navigation -->
<div th:fragment="top_nav" class="top_nav">
    <div class="nav_menu">
        <nav class="" role="navigation">
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                       aria-expanded="false">
                        <img src="images/img.jpg" th:src="@{/statics/img/default.png}" alt="">
                        <span th:if="${user}" th:text="${user.username}">John Doe</span>
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="javascript:;"> Profile</a></li>
                        <li>
                            <a href="javascript:;">
                                <span class="badge bg-red pull-right">50%</span>
                                <span>Settings</span>
                            </a>
                        </li>
                        <li><a href="javascript:;">Help</a></li>
                        <li><a href="login.html" th:href="@{/logout}"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->
</body>
</html>
```

siderbar:

```
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head th:replace="~{common/base::common_header(_)}">
</head>
<body>
<div th:fragment="sidebar" class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="index.html" th:href="@{/}" class="site_title"><i class="fa fa-barcode"></i>
                <span>SMS</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile">
            <div class="profile_pic">
                <img src="/statics/img/img.jpg" th:src="@{/statics/img/default.png}" alt="..."
                     class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>Welcome,</span>
                <h2 th:if="${user}" th:text="${user.username}">John Doe</h2>
            </div>
        </div>
        <!-- /menu profile quick info -->

        <br/>

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                    <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="index.html" th:href="@{/}">Dashboard</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-edit"></i> Authority <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="form.html" th:href="@{/addUser}">Add New User</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /sidebar menu -->

        <!-- menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a th:href="@{/logout}" data-toggle="tooltip" data-placement="top" title="Logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
        </div>
        <!-- /menu footer buttons -->
    </div>
</div>
</body>
</html>
```

base:

```
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head th:fragment="common_header(links)">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title th:text="${title}"></title>

    <!-- Common styles and scripts -->
    <link rel="stylesheet" th:href="@{/statics/vendors/bootstrap/dist/css/bootstrap.min.css}">
    <link rel="stylesheet" th:href="@{/statics/vendors/font-awesome/css/font-awesome.min.css}">
    <link rel="stylesheet" th:href="@{/statics/css/custom.min.css}">
    <link rel="stylesheet" th:href="@{/statics/css/main.css}">
    <!--/* Per-page placeholder for additional links */-->
    <th:block th:replace="${links}"/>

</head>
<body th:fragment="common_body(content, scripts)" class="nav-md">
<div class="container body">
    <div class="main_container">
        <div th:replace="~{common/sidebar::sidebar}"></div>

        <div th:replace="~{common/nav::top_nav}"></div>

        <!-- page content -->
        <div class="right_col" role="main" th:include="${content}">
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
            <div class="pull-right">
                ©2017 All Rights Reserved
                <span class="hidden-xs">Powered By <a href="http://wenzhiquan.github.io"
                                                      target="blank">Wen Zhiquan</a></span>
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
</div>

<!-- jQuery -->
<script src="../vendors/jquery/dist/jquery.min.js"
        th:src="@{/statics/vendors/jquery/dist/jquery.min.js}"></script>
<!-- Bootstrap -->
<script src="../vendors/bootstrap/dist/js/bootstrap.min.js"
        th:src="@{/statics/vendors/bootstrap/dist/js/bootstrap.min.js}"></script>
<!-- Custom Theme Scripts -->
<script src="../build/js/custom.min.js" th:src="@{/statics/js/custom.js}"></script>
<!--/* Per-page placeholder for additional links */-->
<th:block th:replace="${scripts}"/>
</body>
</html>
```

addUser:

```
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head th:replace="~{common/base::common_header(~{::link})}">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css"
          th:href="@{/statics/vendors/iCheck/skins/flat/green.css}" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="../vendors/google-code-prettify/bin/prettify.min.css"
          th:href="@{/statics/vendors/google-code-prettify/bin/prettify.min.css}" rel="stylesheet">
    <!-- Select2 -->
    <link href="../vendors/select2/dist/css/select2.min.css"
          th:href="@{/statics/vendors/select2/dist/css/select2.min.css}" rel="stylesheet">
    <!-- Switchery -->
    <link href="../vendors/switchery/dist/switchery.min.css"
          th:href="@{/statics/vendors/switchery/dist/switchery.min.css}" rel="stylesheet">
    <!-- starrr -->
    <link href="../vendors/starrr/dist/starrr.css"
          th:href="@{/statics/vendors/starrr/dist/starrr.css}" rel="stylesheet">
</head>
<body th:replace="~{common/base::common_body(~{::content}, ~{::script})}">
<div th:fragment="content">
    <div class="">
        <div class="alert alert-info">
        </div>
        <div class="page-title">
            <div class="title_left">
                <h3>Add new user</h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <br/>
                        <form id="add-user-form" data-parsley-validate
                              class="form-horizontal form-label-left">

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Username <span
                                        class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="username" class="form-control col-md-7 col-xs-12"
                                           name="username" placeholder="Enter the username" required="required"
                                           type="text">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span
                                        class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="email" id="email" name="email" placeholder="Enter the email"
                                           required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button type="reset" id="clear-btn" class="btn btn-primary">Clear</button>
                                    <button type="submit" id="submit-btn" class="btn btn-success">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div th:fragment="script">
    <!-- validator -->
    <script src="../vendors/validator/validator.min.js"
            th:src="@{/statics/vendors/validator/validator.min.js}"></script>
    <script th:src="@{/statics/js/authority/addUser.js}"></script>
    <script th:src="@{/statics/vendors/layer/layer.js}"></script>
</div>
</body>
</html>
```

addUser.js:

```
/**
 * Created by wenzhiquan on 16/7/14.
 */
$(function () {
    var username = $("#username"),
        email = $("#email"),
        clearBtn = $("#clear-btn"),
        submitBtn = $("#submit-btn");

    // initialize the validator function
    validator.message.date = 'not a real date';

    // validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
    $('form')
        .on('blur', 'input[required], input.optional, select.required', validator.checkField)
        .on('change', 'select.required', validator.checkField);

    $('.multi.required').on('keyup blur', 'input', function () {
        validator.checkField.apply($(this).siblings().last()[0]);
    });

    submitBtn.click(function (e) {
        e.preventDefault();
        var submit = true;

        // evaluate the form using generic validating
        if (!validator.checkAll($('form'))) {
            submit = false;
        }

        console.log(submit);

        if (submit) {
            $.ajax({
                url: 'addUser',// 跳转到 action
                data: {
                    username: username.val(),
                    email: email.val(),
                },
                type: 'post',
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        layer.msg('Success!', {
                            icon: 1,
                            time: 1000 //1s后自动关闭
                        });
                    }
                    else {
                        layer.msg('Failed!', {
                            icon: 2,
                            time: 1000 //1s后自动关闭
                        });
                    }
                },
                error: function () {
                    layer.msg('Error!', {
                        time: 1000 //1s后自动关闭
                    });
                }
            });
        }
        return false;
    });

    clearBtn.click(function () {
        username.val("");
        email.val("");
    });
});
```

#### 运行效果

![addUser](/uploads/in-post/sms/addUser.png)

### 用户登录功能

因为已经添加过User表并完成了model和mapper的编写，用户登录功能分为以下几个步骤进行完成：

+ 添加Token数据库表及对应model和mapper
+ 编写对应的service
+ 编写对应的controller
+ 编写对应的js请求和前端页面
+ 编写登录拦截器

#### 添加Token数据库表及Token model和TokenMapper

由于需要保持用户的登录状态，并且不能把用户信息保存在浏览器中，故需要在服务器端增加一个token字段，作为识别用户的唯一信息，可以保证用户登录时不用再次输入用户名密码。

首先，需要在数据库中增加Token表，用于存储token信息：

```
CREATE TABLE `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'token id',
  `user_id` int(11) NOT NULL COMMENT 'user id',
  `token` varchar(32) NOT NULL COMMENT 'token content',
  `expired_time` datetime NOT NULL COMMENT 'token expired time',
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
```

表中的`status`字段用于指示该`token`是否可用。

接着，类似于`User`类，需要生成一个`Token`的实体类：

```
public class Token {
    private int id;
    private int userId;
    private String token;
    private Date expiredTime;
    private int status;

    // 需要生成所有属性的get和set方法。
```

类似的，需要编写`TokenMapper`文件和相应的`xml`文件：

```
@Repository
public interface TokenMapper {

    Token selectByToken(String token);

    int addToken(Token token);

    int updateStatus(@Param("status")int status, @Param("token")String token);
}
```

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org/DTD Mapper 3.0" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="cn.edu.bupt.wen.mapper.TokenMapper">
    <!-- 自定义返回结果集 -->
    <resultMap id="tokenMap" type="Token">
        <id property="id" column="id" javaType="java.lang.Integer"></id>
        <result property="userId" column="user_id" javaType="java.lang.Integer"></result>
        <result property="token" column="token" javaType="java.lang.String"></result>
        <result property="status" column="status" javaType="java.lang.Integer"></result>
        <result property="expiredTime" column="expired_time" jdbcType="DATE" javaType="java.util.Date"></result>
    </resultMap>

    <sql id="tableName">token</sql>

    <sql id="insertFields">user_id, token, expired_time, status</sql>

    <sql id="selectFields">id, <include refid="insertFields"></include></sql>

    <select id="selectByToken" parameterType="java.lang.String" resultMap="tokenMap">
        SELECT
        <include refid="selectFields"></include>
        FROM
        <include refid="tableName"></include>
        WHERE token = #{token}
    </select>

    <insert id="addToken" parameterType="Token">
        INSERT INTO
        <include refid="tableName"></include>
        (<include refid="insertFields"></include>)
        VALUES
        (#{userId}, #{token}, #{expiredTime}, #{status})
    </insert>

    <update id="updateStatus">
        UPDATE
        <include refid="tableName"></include>
        SET status = #{status}
        WHERE token = #{token}
    </update>
</mapper>
```

至此，`Token`相关内容基本完成。

#### 编写UserService类

登录和登出是一对必不可少的操作。故为UserService类增加login和logout方法，除此之外，需要保存用户登录状态，故需要增加生成token字段的方法：

```
/**
     * settle the login request
     *
     * @param username
     * @param password
     * @return map
     * @author wenzhiquan
     */
    public Map<String, Object> login(String username, String password) {
        logger.info("UserService login");
        Map<String, Object> map = new HashMap<>();

        logger.info(username);
        if (StringUtils.isEmpty(username)) {
            map.put("msg", "username can not be empty");
            return map;
        }
        if (StringUtils.isEmpty(password)) {
            map.put("msg", "password can not be empty");
            return map;
        }
        User user = userMapper.selectByName(username);
        if (user == null) {
            map.put("msg", "username does not exist");
            return map;
        }

        logger.info(user.getUsername());
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(MD5Util.md5(password)).append(user.getSalt());
        if (!user.getPassword().equals(MD5Util.md5(stringBuffer.toString()))) {
            map.put("msg", "wrong password");
            return map;
        }

        String token = generateToken(user.getId());
        map.put("token", token);
        return map;
    }

    /**
     * generate login token
     *
     * @param userId
     * @return token
     * @author wenzhiquan
     */
    public String generateToken(int userId) {
        Token token = new Token();
        token.setUserId(userId);
        Date date = new Date();
        date.setTime(date.getTime() + 1000 * 3600 * 24);
        token.setExpiredTime(date);
        token.setToken(UUID.randomUUID().toString().replaceAll("-", ""));
        token.setStatus(0);
        tokenMapper.addToken(token);
        return token.getToken();
    }

    /**
     * logout and set token status to 1
     *
     * @param token
     * @return
     * @author wenzhiquan
     */
    public void logout(String token) {
        tokenMapper.updateStatus(1, token);
    }
```

#### 编写UserController类

同样的，需要在`UserController`类中增加登录登出相关代码：

```
@RequestMapping(path = {"/login"}, method = {RequestMethod.GET})
public String login(Model model) {
    model.addAttribute("title", "Login");
    return "user/login";
}

@RequestMapping(path = {"/login"}, method = {RequestMethod.POST})
@ResponseBody
public String login(@RequestParam("username") String username,
                    @RequestParam("password") String password,
                    HttpServletResponse response) {
    logger.info(username);
    try {
        Map<String, Object> map = userService.login(username, password);
        if (map.containsKey("token")) {
            Cookie cookie = new Cookie("token", map.get("token").toString());
            cookie.setPath("/");
            response.addCookie(cookie);
            map.put("msg", "login successful!");
        }
        return JsonUtil.getJSONString(0, map);
    } catch (Exception e) {
        logger.error("login failed!");
        Map<String, Object> map = new HashMap<>();
        map.put("msg", "login failed");
        return JsonUtil.getJSONString(1, map);
    }
}

@RequestMapping(path = {"/logout"}, method = {RequestMethod.GET, RequestMethod.POST})
public String logout(@CookieValue("token") String token) {
    userService.logout(token);
    return "redirect:/login";
}

```

在获取了用户的`token`之后，需要将`token`存储到浏览器的`Cookie`中，以便下次访问时将`token`发送给服务器，用于查询用户信息。

#### 编写对应的js请求和前端页面

登录界面独立于其他界面存在，便于拦截请求后的页面跳转。

login.html:

```
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head th:replace="~{common/base::common_header(~{::link})}">
    <link rel="stylesheet" th:href="@{/statics/vendors/animate.css/animate.min.css}">
</head>

<body class="login">
<div>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form>
                    <h1>Login Form</h1>
                    <div>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Username"
                               required="required"/>
                    </div>
                    <div>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password"
                               required="required"/>
                    </div>
                    <div class="error" id="error-password"></div>
                    <div class="error" id="error-username"></div>
                    <div>
                        <a class="btn btn-default submit" id="login-btn">Log in</a>
                        <a class="reset_pass">Lost your password?</a>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p></p>
                        <div>
                            <h1><i class="fa fa-barcode"></i> SMS</h1>
                            ©2017 All Rights Reserved
                            <span class="hidden-xs">Powered By <a href="http://wenzhiquan.github.io" target="blank">Wen Zhiquan</a></span>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
<!-- jQuery -->
<script src="../vendors/jquery/dist/jquery.min.js"
        th:src="@{/statics/vendors/jquery/dist/jquery.min.js}"></script>
<!-- Bootstrap -->
<script src="../vendors/bootstrap/dist/js/bootstrap.min.js"
        th:src="@{/statics/vendors/bootstrap/dist/js/bootstrap.min.js}"></script>
<script th:src="@{/statics/js/login.js}"></script>
<script th:src="@{/statics/vendors/layer/layer.js}"></script>
</body>
</html>
```

login.js:

```
$(function () {
    var username = $("#username"),
        password = $("#password"),
        loginBtn = $("#login-btn"),
        errorUsername = $("#error-username"),
        errorPassword = $("#error-password");

    username.blur(function () {
        if (username.val() == "") {
            errorUsername.html("username can not be empty");
            errorUsername.show();
        }
    });

    username.focus(function () {
        errorUsername.hide();
        username.val("");
    });

    password.blur(function () {
        if (password.val() == "") {
            errorPassword.html("password can not be empty");
            errorPassword.show();
        }
    });

    password.focus(function () {
        errorPassword.hide();
        password.val("");
    });

    loginBtn.click(function () {
        console.log(username.val());
        if (username.val() != "" && password.val() != "") {
            $.ajax({
                url: 'login',// 跳转到 action
                data: {
                    username: username.val(),
                    password: password.val()
                },
                type: 'post',
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        if (data.next != undefined) {
                            location.href = data.next;
                        }
                        location.href = "/";
                    }
                    else {
                        layer.msg(data.msg, {
                            time: 1000 //1s后自动关闭
                        });
                    }
                },
                error: function () {
                    layer.msg('Error!', {
                        time: 1000 //1s后自动关闭
                    });
                }
            });
        }
    });
});
```

#### 编写登录拦截器

拦截器分为两个，一个用于读取`token`信息，并根据`token`信息写入用户信息，一个用于拦截未登录用户。

拦截器运行阶段如下：

![拦截器运行阶段](/uploads/in-post/sms/interceptor.png)

PassportInterceptor（主要用于读取`token`，并根据此`token`读取并写入用户信息）:

```
@Component
public class PassportInterceptor implements HandlerInterceptor {
    private static final Logger logger = LoggerFactory.getLogger(PassportInterceptor.class);

    @Autowired
    private TokenMapper tokenMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private HostHolder hostHolder;

    /*
     * 此阶段发生在Controller运行之前
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String token = null;
        if (httpServletRequest.getCookies() != null) {
            for (Cookie cookie : httpServletRequest.getCookies()) {
                if (cookie.getName().equals("token")) {
                    token = cookie.getValue();
                    break;
                }
            }
        }

        if (token != null) {
            Token selectedToken = tokenMapper.selectByToken(token);
            if (selectedToken == null || selectedToken.getExpiredTime().before(new Date()) || selectedToken.getStatus() != 0) {
                return true;
            }

            User user = userMapper.selectById(selectedToken.getUserId());
            hostHolder.setUser(user);
        }
        return true;
    }

    /*
     * 此阶段发生在Controller运行之后
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        if (modelAndView != null && hostHolder.getUser() != null) {
            modelAndView.addObject("user", hostHolder.getUser());
        }
    }

    /*
     * 此阶段发生在视图渲染完成之后
     */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        hostHolder.clear();
    }
}
```

LoginRequiredInterceptor(用于拦截未登录用户):

```
@Component
public class LoginRequiredInterceptor implements HandlerInterceptor {

    @Autowired
    private HostHolder hostHolder;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        if (hostHolder.getUser() == null) {
            httpServletResponse.sendRedirect("/login");
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }
}

```

拦截器编写完成后，需要将拦截器注册到`Spring`当中：

spring-interceptor.xml:

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:mvc="http://www.springframework.org/schema/mvc"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd">
    <mvc:interceptors>
        <!-- 使用bean定义一个Interceptor，直接定义在mvc:interceptors根下面的Interceptor将拦截所有的请求 -->
        <bean class="cn.edu.bupt.wen.interceptor.PassportInterceptor"/>
        <mvc:interceptor>
            <mvc:mapping path="/*"/>
            <mvc:exclude-mapping path="/login"/>
            <!-- 定义在mvc:interceptor下面的表示是对特定的请求才进行拦截的 -->
            <bean class="cn.edu.bupt.wen.interceptor.LoginRequiredInterceptor"/>
        </mvc:interceptor>
    </mvc:interceptors>
</beans>
```

并在`spring-mvc.xml`中加入引用`<import resource="spring-interceptor.xml"></import>`

#### 运行效果

![登录页面](/uploads/in-post/sms/login.png)

### 遇到的问题和解决方案

```
问题：无法找到*Mapper.xml文件
解决方案：*Mapper.xml文件应当位于resources文件夹中而不是java文件夹中

问题：IDEA提示无法注入mapper的bean
解决方案：将Mapper接口文件注解为@Repository

问题：Could not resolve placeholder
解决方案：在引入外部文件的bean中增加属性
<property name="ignoreUnresolvablePlaceholders" value="true" />
并且需要注意properties的格式必须是beanName.property=value   

问题：xml文件，元素 'bean' 必须不含字符 [子级]
解决方案：xml文件中有不合法字符，可能是中文没有注释掉

问题：使用AOP的通配符时，报Expected raw type form of
org.springframework.web.servlet.handler.AbstractHandlerMethodMapping
$MappingRegistry错误
解决方案：AspectJ 1.8.10版本bug，换成1.8.9版本问题解决

问题：数据库datetime类型无法直接映射到java项目中
解决方案：在Mapper.xml文件中增加resultMap进行java.util.Date类型的映射
```
