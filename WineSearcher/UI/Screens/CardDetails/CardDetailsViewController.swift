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
        setupWines()
    }

    // MARK: - Private

    private let inputs: CardDetailsViewControllerInputs

    private func setupView() {
        cardDetailsView.headerView.topImageView.image = inputs.topImage
        cardDetailsView.headerView.topTitleLabel.text = inputs.title
        cardDetailsView.headerView.topSubtitleLabel.attributedText = inputs.subtitle
    }

    private func setupWines() {
        let wines = CardDetailsWineViewModel.wines
        wines.forEach {
            let view = CardDetailsWineView()
            view.wineImageView.image = $0.wineImage
            view.titleLabel.text = $0.title
            view.subtitleLabel.text = $0.subtitle
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 140)
            ])
            cardDetailsView.winesView.contentStackView.addArrangedSubview(view)
        }
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
