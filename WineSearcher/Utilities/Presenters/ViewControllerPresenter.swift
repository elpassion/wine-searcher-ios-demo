import UIKit

class ViewControllerPresenter: ViewControllerPresenting {

    // MARK: - ViewControllerPresnting

    func present(viewController: UIViewController, on baseViewController: UIViewController) {
        baseViewController.present(viewController, animated: true)
    }

}
