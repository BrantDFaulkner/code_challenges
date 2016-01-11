describe("FactorsCaching", function() {
  describe("findFactors", function () {
    describe("maxFactor", function() {
      it("should find the largest potential factor", function() {
          expect(maxFactor(10)).toBe(5);
          expect(maxFactor(99)).toBe(49);
      });
    })//maxFactor;

    it("should return an array of factors", function() {
      expect(findFactors(10)).toEqual([5,2])
      expect(findFactors(20)).toEqual([10,5,4,2])
    });


  });//findFactors
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