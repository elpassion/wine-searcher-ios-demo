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

        cardView.contentView.layoutSubviews()

        initialBackgroundPosition = cardView.backgroundImageView.center
        initialLearnMoreButtonPosition = cardView.learnMoreButton.center
        initialOtherInSeriesButtonPosition = cardView.otherInSeriesButton.center
        initialTitleLabelPosition = cardView.titleLabel.center
        initialSubtitleLabelPosition = cardView.subtitleLabel.center
        cardInitialPosition = cardView.contentView.center

        didLayoutSubviews = true
        updateAnimations()
    }

    private var didLayoutSubviews = false

    // MARK: - CardViewControlling

    var animationProgress: CGFloat = 0 {
        didSet {
            guard didLayoutSubviews else { return }
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
    private var cardInitialPosition: CGPoint?

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
        animateCardPostion()
    }

    private var maxBackgroundParalax: CGFloat {
        return (cardView.backgroundImageView.frame.width - cardView.frame.width) * 0.35
    }

    private lazy var backgroundAnimation: () -> Void = {
        let initialPosition = cardView.backgroundImageView.center
        return { [weak self, maxBackgroundParalax, animationProgress] in
            self?.cardView.backgroundImageView.center.x = initialPosition.x + maxBackgroundParalax * animationProgress
        }
    }()

    private func animateBackground() {
        guard let initialPosition = initialBackgroundPosition else { return }
        cardView.backgroundImageView.center.x = initialPosition.x + maxBackgroundParalax * animationProgress
    }

    private func animateButtons() {
        learnMoreButtonLeftSwipeAnimation.animate(progress: animationProgress)
        learnMoreButtonRightSwipeAnimation.animate(progress: animationProgress)
        otherInSeriesButtonLeftSwipeAnimation.animate(progress: animationProgress)
        otherInSeriesButtonRightSwipeAnimation.animate(progress: animationProgress)
    }

    private func animateLabels() {
        titleLeftSwipeAnimation.animate(progress: animationProgress)
        titleRightSwipeAnimation.animate(progress: animationProgress)
        subtitleLeftSwipeAnimation.animate(progress: animationProgress)
        subtitleRightSwipeAnimation.animate(progress: animationProgress)
    }

    private lazy var learnMoreButtonLeftSwipeAnimation: Animator = {
        let initialPosition = cardView.learnMoreButton.center
        let animation: (CGFloat) -> Void = { [view = cardView.learnMoreButton] progress in
            view.layer.opacity = 1 - Float(progress)
            view.center.x = initialPosition.x - progress * 200
        }
        return Animator(startProgress: 0, endProgress: -0.27, animation: animation)
    }()

    private lazy var otherInSeriesButtonLeftSwipeAnimation: Animator = {
        let initialPosition = cardView.otherInSeriesButton.center
        let animation: (CGFloat) -> Void = { [view = cardView.otherInSeriesButton] progress in
            view.layer.opacity = 1 - Float(progress)
            view.center.x = initialPosition.x - progress * 200
        }
        return Animator(startProgress: 0, endProgress: -0.27, animation: animation)
    }()

    private lazy var learnMoreButtonRightSwipeAnimation: Animator = {
        let initialPosition = cardView.learnMoreButton.center
        let animation: (CGFloat) -> Void = { [view = cardView.learnMoreButton] progress in
            view.layer.opacity = 1 - Float(progress)
            view.center.x = initialPosition.x + progress * 150
        }
        return Animator(startProgress: 0.73, endProgress: 0, animation: animation)
    }()

    private lazy var otherInSeriesButtonRightSwipeAnimation: Animator = {
        let initialPosition = cardView.otherInSeriesButton.center
        let animation: (CGFloat) -> Void = { [view = cardView.otherInSeriesButton] progress in
            view.layer.opacity = 1 - Float(progress)
            view.center.x = initialPosition.x + progress * 150
        }
        return Animator(startProgress: 0.73, endProgress: 0, animation: animation)
    }()

    private lazy var titleLeftSwipeAnimation: Animator = {
        let initialPosition = cardView.titleLabel.center
        let animation: (CGFloat) -> Void = { [view = cardView.titleLabel] progress in
            view.layer.opacity = Float(1 - progress)
            view.center.x = initialPosition.x + progress * 150
        }
        return Animator(startProgress: 0.1, endProgress: 0.36, animation: animation)
    }()

    private lazy var titleRightSwipeAnimation: Animator = {
        let initialPosition = cardView.titleLabel.center
        let animation: (CGFloat) -> Void = { [view = cardView.titleLabel] progress in
            view.layer.opacity = Float(1 - progress)
            view.center.x = initialPosition.x - progress * 150
        }
        return Animator(startProgress: -0.89, endProgress: -0.16, animation: animation)
    }()

    private lazy var subtitleLeftSwipeAnimation: Animator = {
        let initialPosition = cardView.subtitleLabel.center
        let animation: (CGFloat) -> Void = { [view = cardView.subtitleLabel] progress in
            view.layer.opacity = Float(1 - progress)
            view.center.x = initialPosition.x + progress * 150
        }
        return Animator(startProgress: 0.1, endProgress: 0.36, animation: animation)
    }()

    private lazy var subtitleRightSwipeAnimation: Animator = {
        let initialPosition = cardView.subtitleLabel.center
        let animation: (CGFloat) -> Void = { [view = cardView.subtitleLabel] progress in
            view.layer.opacity = Float(1 - progress)
            view.center.x = initialPosition.x - progress * 150
        }
        return Animator(startProgress: -0.89, endProgress: -0.16, animation: animation)
    }()

    private func animateCardPostion() {
        guard let initialPosition = cardInitialPosition else { return }
        if (0.99...1).contains(animationProgress) || (-1...(-0.99)).contains(animationProgress) {
            cardView.contentView.center = initialPosition
        } else if animationProgress > 0.5 && animationProgress < 1 {
            cardView.contentView.center.x = initialPosition.x + (1 - abs(animationProgress)) * 70
        } else if animationProgress > 0 && animationProgress < 0.5 {
            cardView.contentView.center.x = initialPosition.x + animationProgress * 70
        }
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
