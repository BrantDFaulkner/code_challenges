#Factors and Caching

##Language
I chose to complete this challenge in JavaScript for a few reasons:
  * JavaScript offers iteration  methods that would allow me to build a solution.
  * Jasmine is a great testing framework for test/behavior driven development.
  * I had had basic exposure to scripting with JavaScript.

##Additional Questions Responses
####What if you were to cache the calculation? What would an example implementation  look like?

My solution utilizes three methods that may benefit from implementing a cache.

```javascript
function present(num, array) {...}
```

**_present()_** iterates  over an array looking for the number. It will stop upon finding the number or reaching the end of the array.

It could create an object to store values that where not/found and perform a lookup prior to iterating  over the entire array. This cache would most likely be useful for a long array or if there are duplicate numbers. It could look like this:

```javascript
var presentCache = {
  4: true,
  10: undefined,
  16: true,
  17: undefined
};
```
---

 ```javascript
function intersection(factors, pool) {...}
```

**_intersection()_** iterates over the array of factors to find the intersection of the two arrays. Much of the calculation costs is tied to function **_present()_**.

Implementing the above **_presentCache_** implementation would improve the performance of this method also.

---

```javascript
function findFactors(num) {...}
```
**_findFactors()_** calculates all factors of an integer, and returns them in an array. Performance could be improved by caching the results of every new **_{ number: [factors]}_**. It might look like this:

```javascript
var factorsCache = {
  20: [10,5,4,2],
  10: [5,2],
  7: [],
  4: [2]
};
```

So for example, finding that a factor pair of 40 is [20,2], prior to calculating the factors of 20 the algorithm would check **_factorsCache_** and return [10,5,4,2].

####What is the performance of your caching implementation? Is there any way to make it more performant?
The current implementation does not use caching. It performs very quickly while solving the current prompts. However, if one were to increase either the length of the given array and/or the size of the integers within, the calculation intensity of the program would quickly grow. Caching would greatly reduce the increased costs in this situation.

####What if you wanted to reverse the functionality?
######Input: [10, 5, 2, 20]
######Output: {10: [20], 5: [10,20], 2: [10, 20], 20: []}
######Would this change your caching algorithm?

It would surely change/reverse some of the logic in the program. The costliest operations, however--iteration and factorization, would remain constant and similarly  benefit from the caching mechanisms.

##Prompt
Accomplish in a language of your choice:

Input: Given an array of integers

Output: In whatever representation you wish, output each integer in the array and all the other integers in the array that are
factors of the first integer.

Example:

  Given an array of [10, 5, 2, 20], the output would be:

{10: [5, 2], 5: [], 2: [], 20: [10,5,2]}

Additional Questions:

1.  What if you were to cache the calculation, for example in the file system.  What would an example implementation
of the cache look like?  By cache I mean, given an array input, skip the calculation of the output if you have already
calculated the output at least once already.

2.  What is the performance of your caching implementation?  Is there any way to make it more performant.

3.  What if you wanted to reverse the functionality.  What if you wanted to output each integer and all the other integers in the
array that is the first integer is a factor of I.E:

Given an array of [10, 5, 2, 20], the output would be:
{10: [20], 5: [10,20], 2: [10, 20], 20: []}

Would this change your caching algorithim?

With caching, the output should be the same except the calculations are not performed.