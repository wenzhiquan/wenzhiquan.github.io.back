---
layout:     post
title:      "面试必会题目（3）—— Binary Search"
date:        2016-06-26 12:00:00
copyright: true
categories:
    - Algorithm
tags:
    - Algorithm
    - Binary Search
---

> “面试技术岗位应该掌握的算法题目--Binary Search相关”

<!-- more -->

### Sqrt(x) - easy

题目

```
Implement int sqrt(int x).

Compute and return the square root of x.

Example
sqrt(3) = 1

sqrt(4) = 2

sqrt(5) = 2

sqrt(10) = 3
```

代码

```
Java:

public int sqrt(int x) {
    if (x <= 0) return 0;
    long v = x;  
    while(v * v > x)
        v = (v + (x / v)) >> 1;
    return (int)v;
}

```

习题地址
[Sqrt(x)](http://www.lintcode.com/en/problem/sqrtx/)

### Search Insert Position - easy

题目

```
Given a sorted array and a target value, return the index if the target is found.
If not, return the index where it would be if it were inserted in order.

You may assume NO duplicates in the array.

Example
[1,3,5,6], 5 → 2

[1,3,5,6], 2 → 1

[1,3,5,6], 7 → 4

[1,3,5,6], 0 → 0
```

代码

```
Java:

public int searchInsert(int[] A, int target) {
    if (A == null && A.length < 1) return 0;
    int low = 0, high = A.length - 1;
    int mid = 0;
    while (low <= high) {
        mid = low + (high - low) / 2;
        if (A[mid] == target) return mid;
        else if (A[mid] < target) low = mid + 1;
        else high = mid - 1;
    }
    return high - 1;
}

```

习题地址
[Search Insert Position](http://www.lintcode.com/en/problem/search-insert-position/)

### Search a 2D Matrix - easy

题目

```
Write an efficient algorithm that searches for a value in an m x n matrix.

This matrix has the following properties:

Integers in each row are sorted from left to right.
The first integer of each row is greater than the last integer of the previous row.

Example
Consider the following matrix:

[
    [1, 3, 5, 7],
    [10, 11, 16, 20],
    [23, 30, 34, 50]
]
Given target = 3, return true.
```

代码

```
Java:

public boolean searchMatrix(int[][] matrix, int target) {
    if (matrix == null || matrix.length < 1) return false;
    int row = matrix.length;
    int column = matrix[0].length - 1;
    for (int i = 0; i < row; i++) {
        if (matrix[i][column] == target) return true;
        else if (matrix[i][column] < target) continue;
        else return binarySearch(matrix[i], target);
    }
    return false;
}

public boolean binarySearch(int[] arr, int target) {
    if (arr == null || arr.length < 1) return false;
    int low = 0, mid = 0, high = arr.length - 1;
    while (low <= high) {
        mid = low + (high - low) / 2;
        if (arr[mid] == target) return true;
        else if (arr[mid] < target) low = mid + 1;
        else high = mid - 1;
    }
    return false;
}

```

习题地址
[Search a 2D Matrix](http://www.lintcode.com/en/problem/search-a-2d-matrix/)

### First Position of Target - easy

题目

```
For a given sorted array (ascending order) and a target number, find the first
index of this number in O(log n) time complexity.

If the target number does not exist in the array, return -1.

Example
If the array is [1, 2, 3, 3, 4, 5, 10], for given target 3, return 2.
```

代码

```
Java:

public int binarySearch(int[] nums, int target) {
    if (nums == null && nums.length == 0) return -1;
    int low = 0, mid = 0, high = nums.length - 1;
    while (low <= high) {
        mid = low + (high - low) / 2;
        if (nums[mid] >= target) high = mid - 1;
        else low = mid + 1;
    }
    if (nums[high - 1] == target)
        return high - 1;
    else return -1;
}

```

习题地址
[First Position of Target](http://www.lintcode.com/en/problem/first-position-of-target/)

### Wood Cut - medium

题目

```
Given n pieces of wood with length L[i] (integer array). Cut them into small pieces
to guarantee you could have equal or more than k pieces with the same length.
What is the longest length you can get from the n pieces of wood? Given L & k,
return the maximum length of the small pieces.

Example
For L=[232, 124, 456], k=7, return 114.
```

代码

```
Java:

public int woodCut(int[] L, int k) {
    int max = 0;
    for (int i = 0; i < L.length; i++) {
        max = Math.max(max, L[i]);
    }

    int low = 1, high = max;
    while (low 1 < high) {
        int mid = low + (high - low) / 2;
        if (count(L, mid) >= k) low = mid;
        else high = mid;
    }

    if (count(L, high) >= k) return high;
    if (count(L, low) >= k) return low;
    return 0;
}

public int count(int[] L, int length) {
    int sum = 0;
    for (int i = 0; i < L.length; i++) {
        sum += L[i] / length;
    }
    return sum;
}

```

习题地址
[Wood Cut](http://www.lintcode.com/en/problem/wood-cut/)

### Find Minimum in Rotated Sorted Array - medium

题目

```
Suppose a sorted array is rotated at some pivot unknown to you beforehand.

(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).

Find the minimum element.

Example
Given [4, 5, 6, 7, 0, 1, 2] return 0
```

代码

```
Java:

public int findMin(int[] num) {
    if (num == null || num.length < 1) return 0;
    int low = 0, mid = 0, high = num.length - 1;
    while (low <= high) {
        mid = low + (high - low) / 2;
        if (num[mid] > num[high]) low = mid 1;
        else if (num[mid] < num[high]) high = mid;
        else break;
    }
    return num[high];
}

```

习题地址
[Find Minimum in Rotated Sorted Array](http://www.lintcode.com/en/problem/find-minimum-in-rotated-sorted-array/)

### Find Peak Element - medium

题目

```
There is an integer array which has the following features:

The numbers in adjacent positions are different.
A[0] < A[1] && A[A.length - 2] > A[A.length - 1].
We define a position P is a peek if:

A[P] > A[P-1] && A[P] > A[P+1]
Find a peak element in this array. Return the index of the peak.

Example
Given [1, 2, 1, 3, 4, 5, 7, 6]

Return index 1 (which is number 2) or 6 (which is number 7)
```

代码

```
Java:

public int findPeak(int[] nums) {
    // write your code here
    if(nums == null || nums.length < 1) return 0;
    int start = 0;
    int end = nums.length - 1;
    while(start 1 < end) {
        int mid = start + (end - start) / 2;
        if(nums[mid] < nums[mid-1]) {
            end = mid;
        } else if(nums[mid] < nums[mid+1]) {
            start = mid;
        } else {
            return mid;
        }
    }
    return nums[start] >= nums[end] ? start : end;
}

```

习题地址
[Find Peak Element](http://www.lintcode.com/en/problem/find-peak-element/)

### First Bad Version - medium

题目

```
The code base version is an integer start from 1 to n. One day, someone committed
a bad version in the code case, so it caused this version and the following versions
are all failed in the unit tests. Find the first bad version.

You can call isBadVersion to help you determine which version is the first bad one.
The details interface can be found in the code's annotation part.

Notice

Please read the annotation in code area to get the correct way to call
isBadVersion in different language. For example, Java is SVNRepo.isBadVersion(v)

Example
Given n = 5:

isBadVersion(3) -> false
isBadVersion(5) -> true
isBadVersion(4) -> true
Here we are 100% sure that the 4th version is the first bad version.
```

代码

```
Java:

public int findFirstBadVersion(int n) {
    if (n < 1) return 0;
    int low = 0, mid = 0, high = n;
    while (low < high) {
        mid = low + (high - low) / 2;
        if (SVNRepo.isBadVersion(mid)) high = mid;
        else low = mid + 1;
    }
    return low;
}

```

习题地址
[First Bad Version](http://www.lintcode.com/en/problem/first-bad-version/)

### Search in Rotated Sorted Array - medium

题目

```
Suppose a sorted array is rotated at some pivot unknown to you beforehand.

(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).

You are given a target value to search. If found in the array return its index,
otherwise return -1.

You may assume no duplicate exists in the array.

Example
For [4, 5, 1, 2, 3] and target=1, return 2.

For [4, 5, 1, 2, 3] and target=0, return -1.
```

代码

```
Java:

public int search(int[] A, int target) {
    if (A == null || A.length < 1) return -1;
    int low = 0, mid = 0, high = A.length - 1;
    while (low <= high) {
        mid = low + (high - low) / 2;
        if (A[mid] == target) return mid;
        else if (A[mid] < A[high]) {
            if (A[high] >= target && target >= A[mid]) low = mid + 1;
            else high = mid - 1;
        } else {
            if (A[low] <= target && target <= A[mid]) high = mid - 1;
            else low = mid + 1;
        }
    }
    if (A[low] == target) {
        return low;
    }
    if (A[high] == target) {
        return high;
    }
    return -1;
}

```

习题地址
[Search in Rotated Sorted Array](http://www.lintcode.com/en/problem/search-in-rotated-sorted-array/)

### Search for a Range - medium

题目

```
Given a sorted array of n integers, find the starting and ending position of a
given target value.

If the target is not found in the array, return [-1, -1].

Example
Given [5, 7, 7, 8, 8, 10] and target value 8,
return [3, 4].
```

代码

```
Java:

public int[] searchRange(int[] A, int target) {
    if (A.length == 0) {
        return new int[]{-1, -1};
    }

    int start, end, mid;
    int[] bound = new int[2];

    // search for left bound
    start = 0;
    end = A.length - 1;
    while (start 1 < end) {
        mid = start + (end - start) / 2;
        if (A[mid] >= target) {
            end = mid;
        } else if (A[mid] < target) {
            start = mid;
        }
    }
    if (A[start] == target) {
        bound[0] = start;
    } else if (A[end] == target) {
        bound[0] = end;
    } else {
        bound[0] = bound[1] = -1;
        return bound;
    }

    // search for right bound
    start = 0;
    end = A.length - 1;
    while (start 1 < end) {
        mid = start + (end - start) / 2;
        if (A[mid] <= target) {
            start = mid;
        } else {
            end = mid;
        }
    }
    if (A[end] == target) {
        bound[1] = end;
    } else if (A[start] == target) {
        bound[1] = start;
    } else {
        bound[0] = bound[1] = -1;
        return bound;
    }

    return bound;
}

```

习题地址
[Search for a Range](http://www.lintcode.com/en/problem/search-for-a-range/)
