import UIKit

class CardDetailsViewControllerFactory: CardDetailsViewControllerFactoryProtocol {

    // MARK: - CardDetailsViewControllerFactoryProtocol

    func viewController(inputs: CardDetailsInputs) -> UIViewController {
        return CardDetailsViewController(inputs: inputs)
    }

}
