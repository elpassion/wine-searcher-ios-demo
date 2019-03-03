import UIKit

class CardDetailsViewControllerFactory: CardDetailsViewControllerFactoryProtocol {

    func viewController(inputs: CardDetailsViewControllerInputs) -> UIViewController {
        return CardDetailsViewController(inputs: inputs)
    }

}
