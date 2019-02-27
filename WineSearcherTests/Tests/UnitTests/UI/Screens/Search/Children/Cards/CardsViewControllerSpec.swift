@testable import WineSearcher
import Quick
import Nimble

class CardsViewControllerSpec: QuickSpec {

    override func spec() {
        describe("CardsViewController") {
            var sut: CardsViewController!
            var cardsDataSourceStub: CardsDataSourceStub!
            var cardsSizesProviderStub: CardsSizesProviderStub!

            beforeEach {
                cardsDataSourceStub = CardsDataSourceStub()
                cardsSizesProviderStub = CardsSizesProviderStub()
                sut = CardsViewController(
                    dataSource: cardsDataSourceStub,
                    sizesProvider: cardsSizesProviderStub
                )
            }

            afterEach {
                cardsDataSourceStub = nil
                cardsSizesProviderStub = nil
                sut = nil
            }

            it("should have correct view") {
                expect(sut.view).to(beAKindOf(CardsView.self))
            }
        }
    }

}
