import UIKit

protocol CardDetailsViewControllerFactoryProtocol {
    func viewController(inputs: CardDetailsViewControllerInputs) -> UIViewController
}
