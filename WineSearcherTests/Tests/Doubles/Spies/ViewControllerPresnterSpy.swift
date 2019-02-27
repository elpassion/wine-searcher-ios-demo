@testable import WineSearcher
import UIKit

class ViewControllerPresnterSpy: ViewControllerPresenting {

    private(set) var caughtPresentedViewController: UIViewController?
    private(set) var caughtBaseViewController: UIViewController?

    // MARK: - ViewControllerPresnting

    func present(viewController: UIViewController, on baseViewController: UIViewController) {
        caughtPresentedViewController = viewController
        caughtBaseViewController = baseViewController
    }

}
