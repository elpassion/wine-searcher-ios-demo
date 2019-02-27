import UIKit

protocol ViewControllerPresenting {
    func present(viewController: UIViewController, on baseViewController: UIViewController)
}
