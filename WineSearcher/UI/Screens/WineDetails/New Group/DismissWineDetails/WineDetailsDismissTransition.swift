import UIKit

class WineDetailsDismissTransition: NSObject, UIViewControllerAnimatedTransitioning {

    init(toView: CardDetailsWineView) {
        self.toView = toView
    }

    let duration = 0.35

    // MARK: - UIViewControllerAnimatedTransitioning

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let fromViewController = transitionContext.viewController(forKey: .from) as? WineDetailsViewController,
            let toViewController = transitionContext.viewController(forKey: .to) as? CardDetailsViewController else {
                transitionContext.completeTransition(true)
                return
        }

        let transitionView = createTransitionView(toViewController: toViewController,
                                                  fromViewController: fromViewController)

        containerView.addSubview(transitionView)
        transitionView.frame = fromViewController.view.frame

        fromViewController.view.isHidden = true

        beforeAnimation(toViewController: toViewController)

        let animators = self.animators(transitionView: transitionView, toViewController: toViewController)

        animators.forEach { $0.startAnimation() }

        animators.first?.addCompletion { [weak self] _ in
            self?.afterAnimation()
            transitionView.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }

    func animators(transitionView: WineDetailsTransitionView,
                   toViewController: CardDetailsViewController) -> [UIViewPropertyAnimator] {
        let headerView = toViewController.cardDetailsView.headerView
        let wineCardInitialFrame = toView.wineCardInitialFrame(fromView: toViewController.view)
        let wineCardImageViewFrame = toView.wineCardImageViewFrame(fromView: toViewController.view)
        return [
            headerView.topTitleLabel.movementAnimator(duration: duration,
                                                      movementX: 400,
                                                      relativeStartTime: 0.14,
                                                      relativeDuration: 0.86),
            headerView.separator.showAnimator(duration: duration,
                                              relativeStartTime: 0.14,
                                              relativeDuration: 0.86),
            headerView.topSubtitleLabel.movementAnimator(duration: duration,
                                                         movementY: 100,
                                                         relativeStartTime: 0.14,
                                                         relativeDuration: 0.86),
            headerView.topSubtitleLabel.showAnimator(duration: duration,
                                                     relativeStartTime: 0.14,
                                                     relativeDuration: 0.86),
            transitionView.wineBackgroundView.frameAnimator(duration: duration,
                                                            toFrame: wineCardInitialFrame,
                                                            relativeStartTime: 0.14,
                                                            relativeDuration: 0.86),
            transitionView.wineCardImageView.frameAnimator(duration: duration,
                                                           toFrame: wineCardImageViewFrame,
                                                           relativeStartTime: 0.14,
                                                           relativeDuration: 0.86),
            transitionView.wineCardTitleLabel.showAnimator(duration: duration,
                                                           relativeStartTime: 0.14,
                                                           relativeDuration: 0.86),
            transitionView.wineCardSubtitleLabel.showAnimator(duration: duration,
                                                              relativeStartTime: 0.14,
                                                              relativeDuration: 0.86),
            transitionView.wineCardTitleLabel.enterAnimator(duration: duration,
                                                            enterY: -200,
                                                            relativeStartTime: 0.14,
                                                            relativeDuration: 0.86),
            transitionView.wineCardSubtitleLabel.enterAnimator(duration: duration,
                                                               enterY: -200,
                                                               relativeStartTime: 0.14,
                                                               relativeDuration: 0.86)
        ]
    }

    // MARK: - Private

    private let toView: CardDetailsWineView

    private func createTransitionView(toViewController: CardDetailsViewController,
                                      fromViewController: WineDetailsViewController) -> WineDetailsTransitionView {
        let transitionView = WineDetailsTransitionView()

        transitionView.wineDetailsScrollableView.frame = fromViewController.scrollableViewFrame

        transitionView.flagImageView.isHidden = true
        transitionView.ratingImageView.isHidden = true
        transitionView.wineDetailsDescriptionTitleLabel.isHidden = true
        transitionView.wineDetailsDescriptionSubtitleLabel.isHidden = true
        transitionView.wineDetailsScrollableView.isHidden = true

        transitionView.wineCardImageView.frame = fromViewController.wineImageViewFrame
        transitionView.wineBackgroundView.frame = fromViewController.wineDetailsView.contentCardView.frame
        transitionView.wineCardTitleLabel.frame = toView.wineCardTitleLabelFrame(fromView: toViewController.view)
        transitionView.wineCardSubtitleLabel.frame = toView.wineCardSubtitleLabelFrame(fromView: toViewController.view)

        transitionView.wineCardImageView.image = fromViewController.wineDetailsView.wineImageView.image
        let wineDetailsTitleLabel = fromViewController.wineDetailsView.wineDetailsDescriptionView.titleLabel
        transitionView.wineCardTitleLabel.text = wineDetailsTitleLabel.text
        let wineDetailsSubtitleLabel = fromViewController.wineDetailsView.wineDetailsDescriptionView.subtitleLabel
        transitionView.wineCardSubtitleLabel.text = wineDetailsSubtitleLabel.text

        return transitionView
    }

    private func beforeAnimation(toViewController: CardDetailsViewController) {
        toViewController.cardDetailsView.headerView.ratingImageView.isHidden = false
        toView.wineImageView.isHidden = true
    }

    private func afterAnimation() {
        toView.wineImageView.isHidden = false
    }

}
