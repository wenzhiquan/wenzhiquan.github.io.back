---
layout:     post
title:      "面试必会题目（4）—— Math & Bit Manipulation"
date:       2016-07-04 14:00:00
copyright: true
categories:
    - Algorithm
tags:
    - Algorithm
    - Math
    - Bit Manipulation
---

> “面试技术岗位应该掌握的算法题目--Math & Bit Manipulation相关”

<!-- more -->

### Flip Bits - easy

题目

```
Determine the number of bits required to flip if you want to convert integer n
to integer m.

Example
Given
n = 31 (`1`111`1`),
m = 14 (`0`111`0`),
return 2.
```

代码

```
Java:

public static int bitSwapRequired(int a, int b) {
    int count = 0;  
    for (int c = a ^ b; c != 0; c >>>= 1) {
        count += c & 1;
    }
    return count;
}

```

习题地址
[Flip Bits](http://www.lintcode.com/en/problem/flip-bits/)

### O(1) Check Power of 2 - easy

题目

```
Using O(1) time to check whether an integer n is a power of 2.

Example
For n=4, return true;

For n=5, return false;
```

代码

```
Java:

public boolean checkPowerOf2(int n) {
    if (n <= 0) return false;
    return (n & (n-1)) == 0;
}

```

习题地址
[O(1) Check Power of 2](http://www.lintcode.com/en/problem/o1-check-power-of-2/)

### Unique Paths - easy

题目

```
A robot is located at the top-left corner of a m x n grid
(marked 'Start' in the diagram below).

The robot can only move either down or right at any point in time. The robot is
trying to reach the bottom-right corner of the grid(marked 'Finish' in the diagram
below).

How many possible unique paths are there?

Example
```

1,1|1,2|1,3|1,4|1,5|1,6|1,7
--|--|--|--|--|--|--
2,1| | | | | |
3,1| | | | | |3,7

代码

```
Java:

// space O(n)
public int uniquePaths(int m, int n) {
    if (m < 1 || n < 1) return 0;
    if (m == 1 || n == 1) return 1;
    int[] result = new int[n];
    for (int i = 0; i < n; i++) {
        result[i] = 1;
    }
    for (int i = 1; i < m; i++) {
        for (int j = 1; j < n; j++)
            result[j] += result[j - 1];
    }
    return result[n - 1];
}

```

习题地址
[Unique Paths](http://www.lintcode.com/en/problem/unique-paths/)

### Trailing Zeros - easy

题目

```
Write an algorithm which computes the number of trailing zeros in n factorial.

Example
11! = 39916800, so the out should be 2
```

代码

```
Java:

public long trailingZeros(long n) {
    if (n <= 0) return 0;
    long count = 0;
    while(n > 0) {
        count += n / 5;
        n /= 5;
    }
    return count;
}

```

习题地址
[Trailing Zeros](http://www.lintcode.com/en/problem/trailing-zeros/)

### Update Bits - medium

题目

```
Given two 32-bit numbers, N and M, and two bit positions, i and j. Write a method
to set all bits between i and j in N equal to M (e g , M becomes a substring of N
located at i and starting at j)

Clarification
You can assume that the bits j through i have enough space to fit all of M. That is,
if M=10011， you can assume that there are at least 5 bits between j and i.
You would not, for example, have j=3 and i=2, because M could not fully fit between
bit 3 and bit 2.

Example
Given N=(10000000000)2, M=(10101)2, i=2, j=6

return N=(10001010100)2
```

代码

```
Java:

public int updateBits(int n, int m, int i, int j) {
    int max = ~0; /* All 1’s */
    // 1’s through position j, then 0’s
    if (j == 31)
        j = max;
    else
        j = (1 << (j + 1)) - 1;
    int left = max - j;
    // 1’s after position i
    int right = ((1 << i) - 1);
    // 1’s, with 0s between i and j
    int mask = left | right;
    // Clear i through j, then put m in there
    return ((n & mask) | (m << i));
}

```

习题地址
[Update Bits](http://www.lintcode.com/en/problem/update-bits/)

### Unique Binary Search Trees - medium

题目

```
Given n, how many structurally unique BSTs (binary search trees) that store
values 1...n?

Example
Given n = 3, there are a total of 5 unique BST's.

1           3    3       2      1
 \         /    /       / \      \
  3      2     1       1   3      2
 /      /       \                  \
2     1          2                  3
```

代码

```
Java:

public int numTrees(int n) {
    if (n == 0) return 1;
    int[] dp = new int[n + 1];
    dp[0] = 1;
    for (int i = 0; i <= n; i++) {
        for (int j = 0; j < i; j++) {
            dp[i] += dp[j] * dp[i - j - 1];
        }
    }
    return dp[n];
}

```

习题地址
[Unique Binary Search Trees](http://www.lintcode.com/en/problem/unique-binary-search-trees/)

### Fast Power - medium

题目

```
Calculate the power(a, n) % b where a, b and n are all 32bit integers.

Example
For power(2, 31) % 3 = 2

For power(100,1000) % 1000 = 0
```

代码

```
Java:

public int fastPower(int a, int b, int n) {
    long ret = getPower(a, b, n);
    return (int)ret;
}

public long getPower(int a, int b, int n){
    if(a == 0) return 0;
    if(n == 0) return 1 % b;
    if(n == 1) return a % b;

    long ret = getPower(a, b, n/2);
    ret *= ret;
    ret %= b;
    if(n % 2 == 1){
        ret = ret * (a % b);
    }
    return ret % b;
}

```

习题地址
[Fast Power](http://www.lintcode.com/en/problem/fast-power/)

### Binary Representation - hard

题目

```
Given a (decimal - e.g. 3.72) number that is passed in as a string, return the
binary representation that is passed in as a string. If the fractional part of
the number can not be represented accurately in binary with at most 32 characters,
return ERROR.

Example
For n = "3.72", return "ERROR".

For n = "3.5", return "11.1".
```

代码

```
Java:

public String binaryRepresentation(String n) {
    // write your code here
    if (n.indexOf('.') == -1) {
        return parseInteger(n);
    }
    String[] params = n.split("\\.");
    String flt = parseFloat(params[1]);
    if (flt == "ERROR") {
        return flt;
    }
    if (flt.equals("0") || flt.equals("")) {
        return parseInteger(params[0]);
    }
    return parseInteger(params[0]) "." flt;
}

private String parseInteger(String str) {
    int n = Integer.parseInt(str);
    if (str.equals("") || str.equals("0")) {
        return "0";
    }
    String binary = "";
    while (n != 0) {
        binary = Integer.toString(n % 2) binary;
        n = n / 2;
    }
    return binary;
}

private String parseFloat(String str) {
    double d = Double.parseDouble("0." str);
    StringBuilder binary = new StringBuilder();
    HashSet<Double> set = new HashSet<Double>();
    while (d > 0) {
        if (binary.length() > 32 || set.contains(d)) {
            return "ERROR";
        }
        set.add(d);
        d = d * 2;
        if (d >= 1) {
            binary.append(1);
            d = d - 1;
        } else {
            binary.append(0);
        }
    }
    return binary.toString();
}

```

习题地址
[Binary Representation](http://www.lintcode.com/en/problem/binary-representation/)
