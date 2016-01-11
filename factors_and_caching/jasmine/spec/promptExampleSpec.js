// Input: Given an array of integers

// Output: In whatever representation you wish, output each integer in the array and all the other integers in the array that are factors of the first integer.

// Example:

// Given an array of [10, 5, 2, 20], the output would be:

// {10: [5, 2], 5: [], 2: [], 20: [10,5,2]}

describe("Prompt example", function() {
  describe("Given array of integers; output object reflecting {integer: [present factors]}", function() {
    describe("presentFactors()", function() {
      it("should accept input: [10, 5, 2, 20] and output {10: [5, 2], 5: [], 2: [], 20: [10,5,2]}", function(){
      expect(presentFactors([10, 5, 2, 20])).toEqual({10: [5, 2], 5: [], 2: [], 20: [10,5,2]});
      });
    });
  });
});

