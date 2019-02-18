@testable import WineSearcher
import Quick
import Nimble

class CardsSizesProviderSpec: QuickSpec {

    override func spec() {
        describe("CardsSizesProvider") {
            var sut: CardsSizesProvider!
            var screenSizeProviderStub: ScreenSizeProviderStub!
            var configuration: CardsConfiguration!

            beforeEach {
                configuration = .testData()
                screenSizeProviderStub = ScreenSizeProviderStub()
                sut = CardsSizesProvider(configuration: configuration,
                                         screenSizeProvider: screenSizeProviderStub)
            }

            afterEach {
                sut = nil
            }

            it("should return correct card size") {
                expect(sut.cardSize) == CGSize(width: 100, height: 100)
            }

            it("should return correct spacing") {
                expect(sut.spacing) == configuration.spacing
            }

            it("should return correct insets") {
                expect(sut.insets) == UIEdgeInsets(top: 0,
                                                   left: 0,
                                                   bottom: 0,
                                                   right: 0)
            }
        }
    }

}
