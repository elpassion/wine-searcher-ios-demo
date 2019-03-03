import UIKit

protocol CardDetailsViewControllerFactoryProtocol {
    func viewController(inputs: CardDetailsViewControllerInputs) -> UIViewController
}

class CardDetailsViewControllerFactory: CardDetailsViewControllerFactoryProtocol {

    func viewController(inputs: CardDetailsViewControllerInputs) -> UIViewController {
        return CardDetailsViewController(inputs: inputs)
    }

}
