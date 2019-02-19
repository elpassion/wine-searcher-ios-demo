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
        initialLearnMoreButtonPosition = cardView.learnMoreButton.center
        initialOtherInSeriesButtonPosition = cardView.otherInSeriesButton.center
        initialTitleLabelPosition = cardView.titleLabel.center
        initialSubtitleLabelPosition = cardView.subtitleLabel.center

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
    private var initialLearnMoreButtonPosition: CGPoint?
    private var initialOtherInSeriesButtonPosition: CGPoint?
    private var initialTitleLabelPosition: CGPoint?
    private var initialSubtitleLabelPosition: CGPoint?

    private func setupView() {
        cardView.backgroundImageView.image = viewModel.backgroundImage
        cardView.titleLabel.text = viewModel.title
        cardView.subtitleLabel.attributedText = viewModel.subtitle
    }

    // MARK: - Animation

    func updateAnimations() {
        animateBackground()
        animateButtons()
        animateLabels()
    }

    private var maxBackgroundParalax: CGFloat {
        return (cardView.backgroundImageView.frame.width - cardView.frame.width) * 0.35
    }

    func animateBackground() {
        guard let initialPosition = initialBackgroundPosition else { return }
        cardView.backgroundImageView.center.x = initialPosition.x + maxBackgroundParalax * animationProgress
    }

    func animateButtons() {
        animateLearnMoreButton()
        animateOtherInSeriesButton()
    }

    func animateLabels() {
        animateTitleLabel()
        animateSubtitleLabel()
    }

    func animateLearnMoreButton() {
        cardView.learnMoreButton.layer.opacity = 1 - Float(abs(animationProgress))
        guard let initialPosition = initialLearnMoreButtonPosition else { return }
        cardView.learnMoreButton.center.x = initialPosition.x + animationProgress * 450
    }

    func animateOtherInSeriesButton() {
        cardView.otherInSeriesButton.layer.opacity = 1 - Float(abs(animationProgress))
        guard let initialPosition = initialOtherInSeriesButtonPosition else { return }
        cardView.otherInSeriesButton.center.x = initialPosition.x + animationProgress * 450
    }

    func animateTitleLabel() {
        let startProgress: CGFloat = 0.1
        guard abs(animationProgress) > startProgress else { return }
        let progress = animationProgress < 0 ? animationProgress + startProgress : animationProgress - startProgress
        let opacityProgress = 1 - (abs(progress) / (1 - startProgress))
        cardView.titleLabel.layer.opacity = Float(opacityProgress)
        guard let initialPositon = initialTitleLabelPosition else { return }
        cardView.titleLabel.center.x = initialPositon.x + progress * 600
    }

    func animateSubtitleLabel() {
        let startProgress: CGFloat = 0.1
        guard abs(animationProgress) > startProgress else { return }
        let progress = animationProgress < 0 ? animationProgress + startProgress : animationProgress - startProgress
        let opacityProgress = 1 - (abs(progress) / (1 - startProgress))
        cardView.subtitleLabel.layer.opacity = Float(opacityProgress)
        guard let initialPositon = initialSubtitleLabelPosition else { return }
        cardView.subtitleLabel.center.x = initialPositon.x + progress * 600
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
