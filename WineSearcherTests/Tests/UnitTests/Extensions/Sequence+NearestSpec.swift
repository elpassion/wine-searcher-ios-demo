@testable import WineSearcher
import Quick
import Nimble

class Sequence_NearestSpec: QuickSpec {

    override func spec() {
        describe("Sequence+Nearest") {
            var nearestElement: CGFloat?
            var elements: [CGFloat]!

            afterEach {
                elements = nil
                nearestElement = nil
            }

            context("when calling nearest on empty array") {
                beforeEach {
                    elements = []
                    nearestElement = elements.nearest(value: 1)
                }

                it("should return nil") {
                    expect(nearestElement).to(beNil())
                }
            }

            context("when calling nearest on NOT empty array") {
                beforeEach {
                    elements = [2, 4, 10, 15]
                }

                context("when value is 1") {
                    beforeEach {
                        nearestElement = elements.nearest(value: 2)
                    }

                    it("should return correct nearest element") {
                        expect(nearestElement) == 2
                    }
                }

                context("when value is 5") {
                    beforeEach {
                        nearestElement = elements.nearest(value: 5)
                    }

                    it("should return correct nearest element") {
                        expect(nearestElement) == 4
                    }
                }

                context("when value is 3") {
                    beforeEach {
                        nearestElement = elements.nearest(value: 3)
                    }

                    it("should return correct nearest element") {
                        expect(nearestElement) == 2
                    }
                }

                context("when value is 200") {
                    beforeEach {
                        nearestElement = elements.nearest(value: 200)
                    }

                    it("should return correct nearest element") {
                        expect(nearestElement) == 15
                    }
                }
            }
        }
    }

}
