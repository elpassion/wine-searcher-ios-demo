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
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        initialBackgroundPosition = cardView.backgroundImageView.center
        updateAnimations()
    }

    // MARK: - CardViewControlling

    var animationProgress: CGFloat = 0 {
        didSet {
            updateAnimations()
        }
    }

    // MARK: - Private

    private let viewModel: CardViewModel
    private var initialBackgroundPosition: CGPoint?

    private var maxBackgroundParalax: CGFloat {
        return (cardView.backgroundImageView.frame.width - cardView.frame.width) * 0.35
    }

    func updateAnimations() {
        animateBackground()
    }

    func animateBackground() {
        guard let initialPosition = initialBackgroundPosition else { return }
        cardView.backgroundImageView.center.x = initialPosition.x + maxBackgroundParalax * animationProgress
    }

    private func setupView() {
        cardView.backgroundImageView.image = viewModel.backgroundImage
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
