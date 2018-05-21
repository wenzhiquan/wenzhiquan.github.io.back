---
layout:     post
title:      "字符串匹配Sunday算法"
date:       2016-05-28 12:00:00
copyright: true
categories:
    - Algorithm
tags:
    - String
    - Algorithm
---


> “Sunday算法是Daniel M.Sunday于1990年提出的字符串模式匹配。”

### Sunday算法简介

字符串查找算法中，最著名的两个是`KMP`算法(Knuth-Morris-Pratt)和`BM`算法(Boyer-Moore)。两个算法在最坏情况下均具有线性的查找时间。但是在实用上，KMP算法并不比c库函数`strstr()`快多少，而`BM`算法则往往比`KMP`算法快上3－5倍(未经验证)。而`Sunday`算法比`BM`还要快，而且更易理解。`Sunday`算法的核心思想是：在匹配过程中，模式串并不被要求一定要按从左向右进行比较还是从右向左进行比较，它在发现不匹配时，算法能跳过尽可能多的字符以进行下一步的匹配，从而提高了匹配效率。

<!-- more -->

### Sunday算法讲解

假设现在有两个字符串

主串为 A = "What a nice algorithm"

模式串为 B = "nice"

Sunday算法的大致原理是：

先从左到右逐个字符进行比较，以A和B字符串为例：初始状态i = 0, 指向A的第一个字符，j = 0 指向B的第一个字符，分别为`W`和`n`，不匹配，于是要把子串往后移动。

|W|h|a|t| |a| |n|i|c|e| |a|l|g|o|r|i|t|h|m|
|-|
|i| | | |m|
|n|i|c|e|
|j|

此时，Sunday算法要求，找到位于A字串中位于B字符串后面的第一个字符，即下图中m所指向的字符`空格`，在模式字符串B中从后向前查找是否存在`空格`，如果不存在，则直接将模式串置于m之后。

|W|h|a|t| |a| |n|i|c|e| |a|l|g|o|r|i|t|h|m|
|-|
|i| | | |m| | | | |
| | | | | |n|i|c|e|
|j|

然后将i和j置于新位置，继续进行匹配。

|W|h|a|t| |a| |n|i|c|e| |a|l|g|o|r|i|t|h|m|
|-|
| | | | | |i| | | |m|
| | | | | |n|i|c|e|
| | | | | |j| |k| |

`a`和`n`不匹配，需要将子串向后移动，可以看到此时m所在位置的字符`c`和k所在位置的字符`c`相同，此时需要将相同的字符对齐，让j再次指向B字符串的头一个字符，相应地，将i指向主串对应的字符`n`。

|W|h|a|t| |a| |n|i|c|e| |a|l|g|o|r|i|t|h|m|
|-|
| | | | | | | |i| | | |
| | | | | | | |n|i|c|e|
| | | | | | | |j| | | |

此时找到匹配的字符串，算法结束。

### Sunday算法代码

java代码如下：

```
public int strStr(String text, String pattern) {
    int result = 0;
    if (pattern == null || text == null) return -1;
    if (pattern.equals("")) return 0;   // 如果模式串为空，认为第0位已经匹配
    int tlen = text.length(), plen = pattern.length();
    if (plen > tlen) return -1;
    int i = 0, j = 0, k;  // 分别记录text索引，pattern索引和模式串计数索引
    int index;  // 记录不匹配时字符（m所在位置）的索引
    while (i < tlen && j < plen) {
        if (text.charAt(i) == pattern.charAt(j)) {
            i++;
            j++;
            continue;
        }
        index = result + plen;
        if (index >= tlen) return -1;
        for (k = plen - 1; k >= 0 && text.charAt(index) != pattern.charAt(k); k--);
        i = result;
        i += plen - k;
        result = i;
        j = 0;
        if (result + plen > tlen) return -1;  // 如果匹配长度超过主串，匹配失败
    }
    return i <= tlen? result: -1;
}
```

### 需要注意的测试用例

* "", ""
* null, "a"
* "tartarget", "target"
* "source", "rced"

### 相关题目地址

Leetcode:
[Implement strStr()](https://leetcode.com/problems/implement-strstr/)

Lintcode:
[strStr](http://www.lintcode.com/en/problem/strstr/)
