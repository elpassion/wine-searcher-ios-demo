import UIKit

extension UIViewController {

    func embed(_ viewController: UIViewController, in view: (UIView) -> Void) {
        addChild(viewController)
        view(viewController.view)
        viewController.didMove(toParent: self)
    }

    func embed(_ viewController: UIViewController, in view: UIView) {
        addChild(viewController)
        view.addSubview(viewController.view)

        viewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            viewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            viewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            viewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        viewController.didMove(toParent: self)
    }

}
