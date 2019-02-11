@testable import WineSearcher
import Quick
import Nimble

class SearchViewControllerSpec: QuickSpec {

    override func spec() {
        describe("SearchViewController") {
            var sut: SearchViewController!
            var cardsViewControllerStub: UIViewController!

            beforeEach {
                cardsViewControllerStub = UIViewController()
                sut = SearchViewController(cardsViewController: cardsViewControllerStub)
            }

            afterEach {
                sut = nil
                cardsViewControllerStub = nil
            }

            it("should have correct view type") {
                expect(sut.view).to(beAKindOf(SearchView.self))
            }

            context("when view did load") {
                beforeEach {
                    _ = sut.view
                }

                it("should add cards view controller as a child") {
                    expect(sut.children).to(contain(cardsViewControllerStub))
                }

                it("should add cards view to container view") {
                    expect(sut.searchView.cardsView.subviews).to(contain(cardsViewControllerStub.view))
                }
            }
        }
    }

}
