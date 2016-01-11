#Factors and Caching

##Language
I chose to complete this challenge in JavaScript for a few reasons:
  * JavaScript offers itteration methods that would allow me to build a solution.
  * Jasmine is a great testing framework for test/behavior driven development.
  * I had had basic exposure to scripting with JavaScript.

##Additional Questions Responses
####What if you were to cache the calculation? What would an example impementation look like?

My solution utilizes three methods which may benefit from implementing a cache.

```javascript
function present(num, array) {...};
```
  Present() itterates over an array looking for the number. It will stop upon finding the number or reaching the end of the array.

It could create an object to store values that where not/found and perform a lookup prior to itterating over the entire array. This cache would most likely be useful for a long array or if there are duplicate numbers. It could look like this:

```javascript
var present_cache = {
  4: true,
  10: undefined,
  16: true,
  17: undefined
}
```




 ```javascript
function intersection(factprs, pool) {...};
```

  Intersection() itterates over the array of factors to find the intersection of the two arrays. Much of the calculation costs is tied to function present();

 ```javascript
function findFactors(num) {...}
```
FindFactors(); calculates returns an array of all the factors of a give integer.






2.####What is the performance of your caching implementation? Is there any way to make it more performant?

3.####What if you wanted to reverse the functionality?
Input: [10, 5, 2, 20]

Output: {10: [20], 5: [10,20], 2: [10, 20], 20: []}

Would this change your caching algorithim?

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