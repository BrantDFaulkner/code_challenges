
function presentFactors(array) {
  var object = createObject(array);
  for (var property in object) {
    if (object.hasOwnProperty(property)) {
        object[property] = findFactors(property);
    }
  }
  return object;
}



// function isBigEnough(value) {
//   return value >= 10;
// }
// var filtered = [12, 5, 8, 130, 44].filter(isBigEnough);
// // filtered is [12, 130, 44]




function createObject(array) {
  var object = {};
  var length = array.length;

  for (var i = 0; i < length; i++) {
    var key = array[i];
    object[key] = [];
  }
  return object;
}


function findFactors(num) {
  var factors = [];
  var max = maxFactor(num);

  for ( var i = 2; i <= max; i++) {
    if (num % i === 0) {
      factors.unshift(i);
    }
  }
  return factors;
}

function present(num, array) {
  var length = array.length;
  for ( var i = 0; i < length; i++ ) {
    if (num === array[i]) {
      return true;
    } else {
      return false;
    }
  }
}


function maxFactor(num) {
  return Math.floor(num/2);
}








