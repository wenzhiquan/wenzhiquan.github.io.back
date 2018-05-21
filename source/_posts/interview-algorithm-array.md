---
layout:     post
title:      "面试必会题目（2）—— Array"
date:        2016-06-15 12:00:00
copyright: true
categories:
    - Algorithm
tags:
    - Algorithm
    - Array
---

> “面试技术岗位应该掌握的算法题目--Array相关”

<!-- more -->

### Remove Element - easy

题目

```
Given an array and a value, remove all occurrences of that value in place and
return the new length.

The order of elements can be changed, and the elements after the new length
don't matter.

Example
Given an array [0,4,4,0,0,2,4,4], value=4

return 4 and front four elements of the array is [0,0,0,2]
```

代码

```
Java:

public int removeElement(int[] A, int elem) {
    if (A == null || A.length == 0) return 0;
    int step = 0;
    for (int i = 0; i < A.length; i++) {
        if (A[i] == elem) {
            step++;
            continue;
        } else {
            A[i - step] = A[i];
        }
    }
    return A.length - step;
}

```

习题地址
[Remove Element](http://www.lintcode.com/en/problem/remove-element/)

### Subarray Sum - easy

题目

```
Given an integer array, find a subarray where the sum of numbers is zero. Your
code should return the index of the first number and the index of the last number.

Example
Given [-3, 1, 2, -3, 4], return [0, 2] or [1, 3].
```

代码

```
Java:

public ArrayList<Integer> subarraySum(int[] nums) {
    int len = nums.length;

    ArrayList<Integer> ans = new ArrayList<Integer>();
    HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();

    map.put(0, -1);

    int sum = 0;
    for (int i = 0; i < len; i++) {
        sum += nums[i];

        if (map.containsKey(sum)) {
            ans.add(map.get(sum) 1);
            ans.add(i);
            return ans;
        }

        map.put(sum, i);
    }

    return ans;
}

```

习题地址
[Subarray Sum](http://www.lintcode.com/en/problem/subarray-sum/)

### Remove Duplicates from Sorted Array - easy

题目

```
Given a sorted array, remove the duplicates in place such that each element appear
only once and return the new length.

Do not allocate extra space for another array, you must do this in place with
constant memory.

Example
Given input array A = [1,1,2],

Your function should return length = 2, and A is now [1,2].
```

代码

```
Java:

public int removeDuplicates(int[] nums) {
    final int k = 1;  // k means the max appear times of the duplicates
    if(nums.length == 0) return 0;
    int start = 1;
    int count = 1;
    for(int i = 1; i < nums.length; ++i) {
        if(nums[i] == nums[i - 1]) {
            if(count < k) nums[start++] = nums[i];
            count++;
        } else {
            count = 1;
            nums[start++] = nums[i];
        }
    }
    return start;
}

```

习题地址
[Remove Duplicates from Sorted Array](http://www.lintcode.com/en/problem/remove-duplicates-from-sorted-array/)

### Merge Sorted Array - easy

题目

```
Given two sorted integer arrays A and B, merge B into A as one sorted array.

Example
A = [1, 2, 3, empty, empty], B = [4, 5]

After merge, A will be filled as [1, 2, 3, 4, 5]
```

代码

```
Java:

public void mergeSortedArray(int[] A, int m, int[] B, int n) {
    if (n == 0) return;
    int i = m - 1, j = n - 1;
    while (i >=0 && j >= 0) {
        if (A[i] < B[j]) {
            A[i + j - 1] = B[j--];
        } else {
            A[i + j - 1] = A[i--];
        }
    }
    while (j >= 0) {
        A[i + j - 1] = B[j--];
    }
}

```

习题地址
[Merge Sorted Array](http://www.lintcode.com/en/problem/merge-sorted-array/)

### Product of Array Exclude Itself - easy

题目

```
Given an integers array A.

Define B[i] = A[0] * ... * A[i-1] * A[i+1] * ... * A[n-1], calculate B WITHOUT
divide operation.

Example
For A = [1, 2, 3], return [6, 3, 2].
```

代码

```
Java:

public ArrayList<Long> productExcludeItself(ArrayList<Integer> A) {
    // write your code
    int length = A.size();
    ArrayList<Long> result = new ArrayList<>();
    if (length < 1) return result;
    long tmp = 1;
    for (int i = 0; i < length; i++) {
        result.add(tmp);
        tmp *= A.get(i);
    }
    tmp = 1;
    for (int i = length - 1; i >= 0; i--) {
        Long data = result.get(i);
        result.set(i, data * tmp);
        tmp *= A.get(i);
    }
    return result;
}

```

习题地址
[Product of Array Exclude Itself ](http://www.lintcode.com/en/problem/product-of-array-exclude-itself/)

### First Missing Positive - medium

题目

```
Given an unsorted integer array, find the first missing positive integer.

Example
Given [1,2,0] return 3,
and [3,4,-1,1] return 2.
```

代码

```
Java:

public int firstMissingPositive(int[] A) {
    // write your code here
    int length = A.length;
    if (length < 1) return 1;
    int i = 0;
    while (i < length) {
        if (A[i] >= 0 && A[i] < length && A[A[i]] != A[i]) swap(A, i, A[i]);
        else i++;
    }
    int k = 1;
    while (k < length && A[k] == k) k++;
    if (length == 0 || k < length) return k;
    else return A[0] == k? k + 1: k;
}

public void swap(int[] arr, int i, int j) {
    int tmp = arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
}

```

习题地址
[First Missing Positive](http://www.lintcode.com/en/problem/first-missing-positive/)

### 3Sum Closest - medium

题目

```
Given an array S of n integers, find three integers in S such that the sum is
closest to a given number, target. Return the sum of the three integers.

Example
For example, given array S = [-1 2 1 -4], and target = 1. The sum that is closest
to the target is 2. (-1 2 1 = 2).
```

代码

```
Java:

public int threeSumClosest(int[] numbers, int target) {
    // write your code here
    int result = 0;
    if (numbers == null || numbers.length < 3) return result;
    int min = Integer.MAX_VALUE;
    int i = 0;
    Arrays.sort(numbers);
    while (i < numbers.length - 2) {
        int j = i 1;
        int k = numbers.length - 1;
        while (j < k) {
            int sum = numbers[i] numbers[j] numbers[k];
            if (sum == target) return sum;
            else if (sum < target) while (numbers[j] == numbers[++j] && j < k);
            else while (numbers[k] == numbers[--k] && j < k);
            int diff = Math.abs(sum - target);
            if (diff < min) {
                min = diff;
                result = sum;
            }
        }
        while (numbers[i] == numbers[++i] && i < numbers.length - 2);
    }
    return result;
}

```

习题地址
[3Sum Closest](http://www.lintcode.com/en/problem/3sum-closest/)

### 3Sum - medium

题目

```
Given an array S of n integers, are there elements a, b, c in S such that
a b c = 0? Find all unique triplets in the array which gives the sum of zero.

Example
For example, given array S = {-1 0 1 2 -1 -4}, A solution set is:

(-1, 0, 1)
(-1, -1, 2)
```

代码

```
Java:

public ArrayList<ArrayList<Integer>> threeSum(int[] numbers) {
    // write your code here
    ArrayList<ArrayList<Integer>> result = new ArrayList<>();
    if (numbers == null || numbers.length < 3) return result;
    Arrays.sort(numbers);
    int i = 0;
    while (i < numbers.length - 2) {
        if (numbers[i] > 0) break;
        int j = i 1;
        int k = numbers.length - 1;
        while (j < k) {
            int sum = numbers[i] numbers[j] numbers[k];
            if (sum == 0) {
                ArrayList<Integer> tmp = new ArrayList<>();
                tmp.add(numbers[i]);
                tmp.add(numbers[j]);
                tmp.add(numbers[k]);
                result.add(tmp);
            }
            if (sum <= 0) while (numbers[j] == numbers[++j] && j < k);
            if (sum >= 0) while (numbers[k] == numbers[--k] && j < k);
        }
        while (numbers[i] == numbers[++i] && i < numbers.length - 2);
    }

    return result;
}

```

习题地址
[3Sum](http://www.lintcode.com/en/problem/3sum/)

### Two Sum - medium

题目

```
Given an array of integers, find two numbers such that they add up to a specific
target number.

The function twoSum should return indices of the two numbers such that they add
up to the target, where index1 must be less than index2. Please note that your
returned answers (both index1 and index2) are NOT zero-based.

Example
numbers=[2, 7, 11, 15], target=9

return [1, 2]
```

代码

```
Java:

public int[] twoSum(int[] numbers, int target) {
    // write your code here
    if (numbers == null ||numbers.length < 1) return null;
    HashMap<Integer, Integer> hashMap = new HashMap<>();
    int [] result = new int[2];
    for (int i = 0; i < numbers.length; i++) {
        int key = target - numbers[i];
        if (hashMap.containsKey(key)) {
            result[0] = hashMap.get(key);
            result[1] = i + 1;
            break;
        } else {
            hashMap.put(numbers[i], i + 1);
        }
    }
    return result;
}

```

习题地址
[Two Sum](http://www.lintcode.com/en/problem/two-sum/)

### Partition Array - medium

题目

```
Given an array nums of integers and an int k, partition the array
(i.e move the elements in "nums") such that:

All elements < k are moved to the left
All elements >= k are moved to the right
Return the partitioning index, i.e the first index i nums[i] >= k.

Example
If nums = [3,2,2,1] and k=2, a valid answer is 1.
```

代码

```
Java:

public int partitionArray(int[] nums, int k) {
    //write your code here
    if (nums == null || nums.length < 1) return 0;
    int low = 0, high = nums.length - 1;
    while (low <= high) {
        while (low <= high && nums[high] >= k) high--;
        while (low <= high && nums[low] < k) low++;
        if(high >= 0 && low < high){
            swap(nums, low, high);
        }
    }
    return high + 1;
}

public void swap(int[] nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
}

```

习题地址
[Partition Array](http://www.lintcode.com/en/problem/partition-array/)
