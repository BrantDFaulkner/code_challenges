
function presentFactors(array) {
  var object = createObject(array);
  for (var property in object) {
    if (object.hasOwnProperty(property)) {
      var factors = findFactors(property)
      object[property] = intersection(factors, array)
    }
  }
  return object;
}

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

function intersection(factors, pool) {
  var interray = [];
  var length = factors.length;
  for ( var i = 0; i < length; i++) {
    if (present(factors[i], pool)) {
      interray.push(factors[i]);
    }
  }
  return interray;
}

function present(num, array) {
  var length = array.length;
  for ( var i = 0; i < length; i++ ) {
    if (num === array[i]) {
      return true;
    }
  }
}

function maxFactor(num) {
  return Math.floor(num/2);
}








