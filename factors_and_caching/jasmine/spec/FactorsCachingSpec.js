describe("factorsCaching", function() {

  describe("findFactors()", function () {
    describe("maxFactor()", function() {
      it("should find the largest potential factor", function() {
          expect(maxFactor(10)).toBe(5);
          expect(maxFactor(99)).toBe(49);
      });
    });//maxFactor()

    it("should return an array of factors", function() {
      expect(findFactors(10)).toEqual([5,2]);
      expect(findFactors(20)).toEqual([10,5,4,2]);
    });
  });//findFactors()

  describe("intersection()", function() {
    describe("present()", function() {
      it("should check if the number is present", function() {
          expect(present(10, [8,5])).toBe(undefined);
          expect(present(10, [10,5])).toBe(true);
      });
    });//present()

    it("should return the intersection of two arrays", function() {
        expect(intersection([1,2,3],[1,2,3,4,5])).toEqual([1,2,3]);
    });
  });//intersection();

  describe("presentFactors()", function() {
    describe("createObject", function() {
      it("should create an object with empty arrays for keys", function() {
          expect(createObject([10, 5, 2, 20])).toEqual({10: [], 5: [], 2: [], 20: []});
      });
    });//createObject();

    it("should return an object containing {number: [presentFactors]", function(){
      expect(presentFactors([21, 14, 7, 3])).toEqual({21: [7,3], 14: [7], 7: [], 3: []});
    });
  });//presentFactors()
});//FactorsCaching



