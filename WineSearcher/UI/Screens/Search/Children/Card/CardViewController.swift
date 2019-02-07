import UIKit

class CardViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = CardView()
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
