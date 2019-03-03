@testable import WineSearcher
import Quick
import Nimble

class SearchViewControllerSpec: QuickSpec {

    override func spec() {
        describe("SearchViewController") {
            var sut: SearchViewController!
            var dataSourceStub: CardsDataSourceStub!
            var viewControllerPresenterSpy: ViewControllerPresnterSpy!
            var cardsViewControllerFactorySpy: CardsViewControllerFactorySpy!
            var cardDetailsFactorySpy: CardDetailsViewControllerFactorySpy!

            beforeEach {
                dataSourceStub = CardsDataSourceStub()
                viewControllerPresenterSpy = ViewControllerPresnterSpy()
                cardsViewControllerFactorySpy = CardsViewControllerFactorySpy()
                cardDetailsFactorySpy = CardDetailsViewControllerFactorySpy()
                sut = SearchViewController(
                    cardsViewControllerFactory: cardsViewControllerFactorySpy,
                    viewControllerPresnter: viewControllerPresenterSpy,
                    cardsDataSource: dataSourceStub,
                    cardDetailsFactory: cardDetailsFactorySpy
                )
            }

            afterEach {
                sut = nil
                dataSourceStub = nil
                viewControllerPresenterSpy = nil
                cardsViewControllerFactorySpy = nil
                cardDetailsFactorySpy = nil
            }

            it("should have correct view type") {
                expect(sut.view).to(beAKindOf(SearchView.self))
            }

            context("when view did load") {
                beforeEach {
                    _ = sut.view
                }

                it("should add cards view controller as a child") {
                    expect(sut.children).to(contain(cardsViewControllerFactorySpy.viewControllerStub))
                }

                it("should add cards view to container view") {
                    expect(sut.searchView.cardsView.subviews).to(contain(cardsViewControllerFactorySpy.viewControllerStub.view))
                }

                context("when tapping on first card") {
                    beforeEach {
                        dataSourceStub.items.first?.cardTapAction?()
                    }

                    it("should present card details on correct view controller") {
                        expect(viewControllerPresenterSpy.caughtBaseViewController) == sut
                    }

                    it("should present correct view controller") {
                        expect(viewControllerPresenterSpy.caughtPresentedViewController) == cardDetailsFactorySpy.viewControllerStub
                    }
                }
            }
        }
    }

}
