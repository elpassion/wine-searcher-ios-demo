import UIKit

class CardDetailsViewControllerFactory: CardDetailsViewControllerFactoryProtocol {

    func viewController(inputs: CardDetailsInputs) -> UIViewController {
        return CardDetailsViewController(inputs: inputs)
    }

}
