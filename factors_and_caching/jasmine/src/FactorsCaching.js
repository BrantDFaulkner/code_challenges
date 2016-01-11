
var maxFactor = function(num) {
  return Math.floor(num/2)
};

// for (i = 0; i < cars.length; i++) {
//     text += cars[i] + "<br>";
// }

// if (condition) {
//     block of code to be executed if the condition is true
// } else {
//     block of code to be executed if the condition is false
// }


var findFactors = function(num) {
  var max = maxFactor(num)
  var factors = []
  for (i=2; i <= max; i++) {
    if (num % i == 0) {
      factors.unshift(i)
    }
  }
  return factors
};
