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
            var cardDetailsViewController: UIViewController!

            beforeEach {
                dataSourceStub = CardsDataSourceStub()
                viewControllerPresenterSpy = ViewControllerPresnterSpy()
                cardsViewControllerFactorySpy = CardsViewControllerFactorySpy()
                cardDetailsViewController = UIViewController()
                sut = SearchViewController(
                    cardsViewControllerFactory: cardsViewControllerFactorySpy,
                    viewControllerPresnter: viewControllerPresenterSpy,
                    cardsDataSource: dataSourceStub,
                    cardDetailsFactory: { cardDetailsViewController }
                )
            }

            afterEach {
                sut = nil
                dataSourceStub = nil
                viewControllerPresenterSpy = nil
                cardsViewControllerFactorySpy = nil
                cardDetailsViewController = nil
            }

            it("should have correct view type") {
                expect(sut.view).to(beAKindOf(SearchView.self))
            }

            context("when view did load") {
                beforeEach {
                    _ = sut.view
                }

                it("should add cards view controller as a child") {
                    expect(sut.children).to(contain(cardsViewControllerFactorySpy.viewControllerResult))
                }

                it("should add cards view to container view") {
                    expect(sut.searchView.cardsView.subviews).to(contain(cardsViewControllerFactorySpy.viewControllerResult.view))
                }

                context("when tapping on first card") {
                    beforeEach {
                        dataSourceStub.items.first?.cardTapAction?()
                    }

                    it("should present card details on correct view controller") {
                        expect(viewControllerPresenterSpy.caughtBaseViewController) == sut
                    }

                    it("should present correct view controller") {
                        expect(viewControllerPresenterSpy.caughtPresentedViewController) == cardDetailsViewController
                    }
                }
            }
        }
    }

}
