@testable import WineSearcher
import Quick
import Nimble

class SearchViewControllerSpec: QuickSpec {

    override func spec() {
        describe("SearchViewController") {
            var sut: SearchViewController!

            beforeEach {
                sut = SearchViewController()
            }

            afterEach {
                sut = nil
            }

            it("should have correct view type") {
                expect(sut.view).to(beAKindOf(SearchView.self))
            }
        }
    }

}
