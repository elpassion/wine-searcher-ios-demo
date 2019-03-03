import UIKit

class CardDetailsViewController: UIViewController {

    init(inputs: CardDetailsViewControllerInputs) {
        self.inputs = inputs
        super.init(nibName: nil, bundle: nil)
    }

    var cardDetailsView: CardDetailsView! {
        return view as? CardDetailsView
    }

    override func loadView() {
        view = CardDetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Private

    private let inputs: CardDetailsViewControllerInputs

    private func setupView() {
        cardDetailsView.headerView.topImageView.image = inputs.topImage
        cardDetailsView.headerView.topTitleLabel.text = inputs.title
        cardDetailsView.headerView.topSubtitleLabel.attributedText = inputs.subtitle
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
