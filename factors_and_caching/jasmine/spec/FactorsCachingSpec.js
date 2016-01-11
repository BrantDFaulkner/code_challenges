describe("FactorsCaching", function() {

  describe("findFactors", function () {
    describe("maxFactor", function() {
      it("should find the largest potential factor", function() {
          expect(maxFactor(10)).toBe(5);
          expect(maxFactor(99)).toBe(49);
      });
    });//maxFactor

    describe("present", function() {
      it("should check if the number is present", function() {
          expect(present(10, [8,5])).toBe(false);
          expect(present(10, [10,5])).toBe(true);
      });
    });//present

    it("should return an array of factors", function() {
      expect(findFactors(10)).toEqual([5,2]);
      expect(findFactors(20)).toEqual([10,5,4,2]);
    });
  });//findFactors

  describe("createObject", function() {
    it("should find the largest potential factor", function() {
        expect(createObject([10, 5, 2, 20])).toEqual({10: [], 5: [], 2: [], 20: []});
    });
  });//createObject;

  describe("presentFactors", function() {
    xit("should return an object with array elemements as keys and their factors, also present in the array, as the corresponding values", function(){
      expect(presentFactors([10, 5, 2, 20])).toEqual({10: [5, 2], 5: [], 2: [], 20: [10,5,2]});
    });
  });//presentFactors
});//FactorsCaching


// The 'toBe' matcher compares with ===
// The 'toEqual' matcher
// works for simple literals and variables
// should work for objects
// The 'toMatch' matcher is for regular expressions
// The 'toBeDefined' matcher compares against `undefined`
// The `toBeUndefined` matcher compares against `undefined`
// The 'toBeNull' matcher compares against null
// The 'toBeTruthy' matcher is for boolean casting testing
// The 'toBeFalsy' matcher is for boolean casting testing
// The 'toContain' matcher is for finding an item in an Array
// The 'toBeLessThan' matcher is for mathematical comparisons
// The 'toBeGreaterThan' matcher is for mathematical comparisons
// The 'toBeCloseTo' matcher is for precision math comparison
// The 'toThrow' matcher is for testing if a function throws an exception
// The 'toThrowError' matcher is for testing a specific thrown exception
