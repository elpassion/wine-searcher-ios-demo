@testable import WineSearcher
import UIKit

class CardDetailsViewControllerFactorySpy: CardDetailsViewControllerFactoryProtocol {

    var viewControllerStub = UIViewController()
    private(set) var inputs: CardDetailsViewControllerInputs?

    // MARK: - CardDetailsViewControllerFactoryProtocol

    func viewController(inputs: CardDetailsViewControllerInputs) -> UIViewController {
        self.inputs = inputs

        return viewControllerStub
    }

}
