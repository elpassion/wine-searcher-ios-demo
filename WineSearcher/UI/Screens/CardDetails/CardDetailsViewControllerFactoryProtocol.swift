import UIKit

protocol CardDetailsViewControllerFactoryProtocol {
    func viewController(inputs: CardDetailsInputs) -> UIViewController
}
