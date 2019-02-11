@testable import WineSearcher
import Quick
import Nimble

class CardsViewControllerSpec: QuickSpec {

    override func spec() {
        describe("CardsViewController") {
            var sut: CardsViewController!

            beforeEach {
                sut = CardsViewController()
            }

            afterEach {
                sut = nil
            }

            it("should have correct view") {
                expect(sut.view).to(beAKindOf(CardsView.self))
            }
        }
    }

}
