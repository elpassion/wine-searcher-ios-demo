@testable import WineSearcher
import UIKit

class CardDetailsViewControllerFactorySpy: CardDetailsViewControllerFactoryProtocol {

    var viewControllerStub = UIViewController()
    private(set) var inputs: CardDetailsInputs?

    // MARK: - CardDetailsViewControllerFactoryProtocol

    func viewController(inputs: CardDetailsInputs) -> UIViewController {
        self.inputs = inputs

        return viewControllerStub
    }

}
