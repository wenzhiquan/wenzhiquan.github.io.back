---
layout:     post
title:      "面试必会题目（1）—— String"
date:        2016-05-31 12:00:00
copyright: true
categories:
    - Algorithm
tags:
    - Algorithm
    - String
---

> “面试技术岗位应该掌握的算法题目--String相关”

<!-- more -->

### Two Strings Are Anagrams - easy

题目

```
Write a method anagram(s,t) to decide if two strings are anagrams or not.

Example
Given s = "abcd", t = "dcab", return true.
Given s = "ab", t = "ab", return true.
Given s = "ab", t = "ac", return false.
```

代码

```
Java:

public boolean anagram(String s, String t) {
    // write your code here
    if (s.length() != t.length()) {
        return false;
    }
    HashMap<Character, Integer> hashMap = new HashMap<>();
    // 将第一个字符串的每个字母存入哈希表中，也可以用数组进行处理
    for (int i = 0; i < s.length(); i++){
        char tmp = s.charAt(i);
        if (hashMap.containsKey(tmp)) {
            hashMap.put(tmp, hashMap.get(tmp) 1);
        } else {
            hashMap.put(tmp, 1);
        }
    }
    // 查询第二个字符串中的每个字母是否在哈希表中
    for (int i = 0; i < t.length(); i++) {
        char tmp = t.charAt(i);
        if (!hashMap.containsKey(tmp)) {
            return false;
        } else {
            hashMap.put(tmp, hashMap.get(tmp) - 1);
            if (hashMap.get(tmp) < 0) {
                return false;
            }
        }
    }
    return true;
}

```

习题地址
[Two Strings Are Anagrams](http://www.lintcode.com/en/problem/two-strings-are-anagrams/)

### Compare Strings - easy

题目

```
Compare two strings A and B, determine whether A contains all of the characters
in B.The characters in string A and B are all Upper Case letters.

Example
For A = "ABCD", B = "ACD", return true.
For A = "ABCD", B = "AABC", return false.
```

代码

```
Java:

public boolean compareStrings(String s, String t) {
    // write your code here
    int[] arr = new int[26];
    for (int i = 0; i < arr.length; i++) {
        arr[i] = 0;
    }
    for (int i = 0; i < s.length(); i++){
        char tmp = s.charAt(i);
        arr[tmp - 'A'] += 1;
    }
    for (int i = 0; i < t.length(); i++) {
        char tmp = t.charAt(i);
        arr[tmp - 'A'] -= 1;
        if (arr[tmp - 'A'] < 0) {
            return false;
        }
    }
    return true;
}

```

习题地址
[Compare Strings](http://www.lintcode.com/zh-cn/problem/compare-strings/)

### strStr - easy

题目

```
For a given source string and a target string, you should output the first
index(from 0) of target string in source string.

If target does not exist in source, just return -1.

Example
If source = "source" and target = "target", return -1.

If source = "abcdabcdefg" and target = "bcd", return 1.
```

代码

```
Java:

public int strStr(String text, String pattern) {
    //write your code here
    int result = 0;
    if (pattern == null || text == null) return -1;
    if (pattern.equals("")) return 0;
    int tlen = text.length(), plen = pattern.length();
    if (plen > tlen) return -1;
    int i = 0, j = 0, k;
    int index;
    while (i < tlen && j < plen) {
        if (text.charAt(i) == pattern.charAt(j)) {
            i++;
            j++;
            continue;
        }
        index = result plen;
        if (index >= tlen) return -1;
        for (k = plen - 1; k >= 0 && text.charAt(index) != pattern.charAt(k); k--);
        i = result;
        i += plen - k;
        result = i;
        j = 0;
        if (result plen > tlen) return -1;
    }
    return i <= tlen? result: -1;
}

```

习题地址
[strStr](http://www.lintcode.com/en/problem/strstr/)

### Anagrams - medium

题目

```
Given an array of strings, return all groups of strings that are anagrams.

Example
Given ["lint", "intl", "inlt", "code"], return ["lint", "inlt", "intl"].

Given ["ab", "ba", "cd", "dc", "e"], return ["ab", "ba", "cd", "dc"].
```

代码

```
Java:

public List<String> anagrams(String[] strs) {
    int length = strs.length;
    List<String> result = new ArrayList<>();
    if (length == 0 || strs == null) return result;
    HashMap<String, ArrayList<String>> map = new HashMap<>();
    for (String str: strs) {
        String key = getKey(str);
        if (!map.containsKey(key)) {
            map.put(key, new ArrayList<String>());
        }
        map.get(key).add(str);
    }
    for (ArrayList<String> tmp: map.values()) {
        if (tmp.size() > 1) {
            result.addAll(tmp);
        }
    }
    return result;
}

public String getKey(String str) {
    char[] array = str.toCharArray();
    Arrays.sort(array);

    return String.valueOf(array);
}

```

习题地址
[Anagrams](http://www.lintcode.com/zh-cn/problem/anagrams/)

### Longest Common Substring - medium

题目

```
Given two strings, find the longest common substring.Return the length of it.

Example
Given A = "ABCD", B = "CBCE", return 2.
```

代码

```
Java:

public int longestCommonSubstring(String A, String B) {
    // write your code here
    int max = 0;
    int lengthA = A.length();
    int lengthB = B.length();
    if (lengthA < 0 || lengthB < 0) return 0;
    int[][] arr = new int[lengthA][lengthB];
    for (int i = 0; i < lengthA; i++) {
        for (int j = 0; j < lengthB; j++) {
            if (A.charAt(i) == B.charAt(j)) {
                if (i == 0 || j == 0) arr[i][j] = 1;
                else arr[i][j] = arr[i -1][j - 1] 1;
                if (max < arr[i][j])
                    max = arr[i][j];
            }
        }
    }
    return max;
}

```

习题地址
[Longest Common Substring ](http://www.lintcode.com/en/problem/longest-common-substring/)

### Longest Common Prefix - medium

题目

```
Given k strings, find the longest common prefix (LCP).

Example
For strings "ABCD", "ABEF" and "ACEF", the LCP is "A"

For strings "ABCDEFG", "ABCEFG" and "ABCEFA", the LCP is "ABC"

```

代码

```
Java:

public String longestCommonPrefix(String[] strs) {
    // write your code here
    if (strs.length < 1) return "";
    String prefix = strs[0];
    int length = prefix.length();
    for (String str: strs) {
        if(str.equals("")) return "";
        if (str.length() < length) {
            length = str.length();
        }
        while (!str.substring(0, length).equals(prefix)) {
            length -= 1;
            prefix = prefix.substring(0, length);
        }
    }
    return prefix;
}

```

习题地址
[Longest Common Prefix](http://www.lintcode.com/en/problem/longest-common-prefix/)

### String to Integer II - hard

题目

```
Implement function atoi to convert a string to an integer.

If no valid conversion could be performed, a zero value is returned.

If the correct value is out of the range of representable values, INT_MAX (2147483647) or INT_MIN (-2147483648) is returned.

Example
"10" => 10
"-1" => -1
"123123123123123" => 2147483647
"1.0" => 1
```

代码

```
Java:

public int atoi(String str) {
    // write your code here
    str = str.trim();
    if (str.length() > 12) str = str.substring(0, 12);
    if (str == null || str.length() < 1) return 0;
    char [] arr = str.toCharArray();
    int symbol = 0;
    long result = 0;
    if (arr[0] == '+') symbol = 1;
    else if (arr[0] == '-') symbol = -1;
    else if (arr[0] <= '9' && arr[0] >= '0') result += (arr[0] - '0');
    else return 0;
    for (int i = 1; i < str.length(); i++) {
         if (arr[i] <= '9' && arr[i] >= '0') {
             result *= 10;
             result += (arr[i] - '0');
         }
         else break;
    }
    if (symbol != 0) result *= symbol;
    if (result > Integer.MAX_VALUE) return Integer.MAX_VALUE;
    else if (result < Integer.MIN_VALUE) return Integer.MIN_VALUE;
    else return (int)result;
}

```

习题地址
[String to Integer II](http://www.lintcode.com/en/problem/string-to-integer-ii/)
