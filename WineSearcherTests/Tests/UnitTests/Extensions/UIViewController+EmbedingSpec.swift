@testable import WineSearcher
import Quick
import Nimble

class UIViewController_EmbedingSpec: QuickSpec {

    override func spec() {
        describe("UIViewController+Embeding") {
            var sut: UIViewController!
            var childViewController: UIViewController!

            beforeEach {
                sut = UIViewController(nibName: nil, bundle: nil)
                childViewController = UIViewController(nibName: nil, bundle: nil)
            }

            context("when calling embed") {
                beforeEach {
                    sut.embed(childViewController, in: sut.view)
                }

                it("should add child view controller") {
                    expect(sut.children).to(contain(childViewController))
                }

                it("should add subview") {
                    expect(sut.view.subviews).to(contain(childViewController.view))
                }
            }
        }
    }

}
