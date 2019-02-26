import UIKit

class CardDetailsViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = CardDetailsView()
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
