import UIKit

class CardViewController: UIViewController, CardViewControlling {

    init(viewModel: CardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    var cardView: CardView! {
        return view as? CardView
    }

    override func loadView() {
        view = CardView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animate()
    }

    // MARK: - CardViewControlling

    var animationProgress: CGFloat = 0 {
        didSet { view.setNeedsLayout() }
    }

    // MARK: - Private

    private let viewModel: CardViewModel

    private func setupView() {
        cardView.contentView.backgroundImageView.image = viewModel.backgroundImage
        cardView.contentView.layoutSubviews()
        cardView.titleLabel.text = viewModel.title
        cardView.subtitleLabel.attributedText = viewModel.subtitle
    }

    private func setupActions() {
        cardView.contentView.addTarget(self, action: #selector(cardTapped), for: .touchUpInside)
    }

    @objc
    private func cardTapped() {
        viewModel.cardTapAction?()
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
