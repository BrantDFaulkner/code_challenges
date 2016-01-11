// for (i = 0; i < cars.length; i++) {
//     text += cars[i] + "<br>";
// }

// if (condition) {
//     block of code to be executed if the condition is true
// } else {
//     block of code to be executed if the condition is false
// }

// while (condition) {
//     code block to be executed
// }

// The For/In Loop
// The JavaScript for/in statement loops through the properties of an object:

// Example
// var person = {fname:"John", lname:"Doe", age:25};

// var text = "";
// var x;
// for (x in person) {
//     text += person[x];
// }

var includedFactors = function(array) {

};

var createObject = function(array) {
  var length = array.length;
  var object = {};
  for (var i = 0; i < length; i ++) {
    var key = array[i];
    object[key] = [];
  }
  return object;
};


var findFactors = function(num) {
  var max = maxFactor(num);
  var factors = [];
  for ( var i = 2; i <= max; i++) {
    if (num % i === 0) {
      factors.unshift(i);
    }
  }
  return factors;
};

var maxFactor = function(num) {
  return Math.floor(num/2);
};







