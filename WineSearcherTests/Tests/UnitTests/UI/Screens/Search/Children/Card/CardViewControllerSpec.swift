@testable import WineSearcher
import Quick
import Nimble

class CardViewControllerSpec: QuickSpec {

    override func spec() {
        describe("CardViewController") {
            var sut: CardViewController!
            var viewModel: CardViewModel!
            var didCallTapAction = false

            beforeEach {
                viewModel = CardViewModel(title: "fake_title",
                                          subtitle: NSAttributedString(string: "fake_subtitle"),
                                          backgroundImage: UIImage())
                viewModel.cardTapAction = {
                    didCallTapAction = true
                }
                sut = CardViewController(viewModel: viewModel)
            }

            afterEach {
                sut = nil
                viewModel = nil
                didCallTapAction = false
            }

            context("when tapping on card") {
                beforeEach {
                    sut.cardView.contentView.sendActions(for: .touchUpInside)
                }

                it("should call tap action") {
                    expect(didCallTapAction) == true
                }
            }
        }
    }

}
