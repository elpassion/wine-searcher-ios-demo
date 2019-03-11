import UIKit

class WineDetailsPresentTransition: NSObject, UIViewControllerAnimatedTransitioning {

    init(view: CardDetailsWineView) {
        self.view = view
    }

    let duration = 0.7

    // MARK: - UIViewControllerAnimatedTransitioning

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        guard let fromViewController = transitionContext.viewController(forKey: .from) as? CardDetailsViewController,
            let toViewController = transitionContext.viewController(forKey: .to) as? WineDetailsViewController else {
                transitionContext.completeTransition(true)
                return
        }

        toViewController.view.frame = transitionContext.finalFrame(for: toViewController)
        toViewController.view.layoutIfNeeded()

        let transitionView = createTransitionView(fromViewController: fromViewController,
                                                  toViewController: toViewController)

        container.addSubview(transitionView)

        let animators = self.animators(transitionView: transitionView,
                                       fromViewController: fromViewController,
                                       toViewController: toViewController)

        animators.forEach {
            $0.startAnimation()
        }

        animators.first?.addCompletion { _ in
            transitionContext.completeTransition(true)
            transitionView.removeFromSuperview()
            container.addSubview(toViewController.view)
        }
    }

    func createTransitionView(fromViewController: CardDetailsViewController,
                              toViewController: WineDetailsViewController) -> WineDetailsTransitionView {

        let transitionView = WineDetailsTransitionView()

        transitionView.wineBackgroundView.frame = view.wineCardInitialFrame(fromView: fromViewController.view)

        transitionView.wineCardTitleLabel.frame = view.wineCardTitleLabelFrame(fromView: fromViewController.view)
        transitionView.wineCardTitleLabel.text = view.titleLabel.text

        transitionView.wineCardSubtitleLabel.frame = view.wineCardSubtitleLabelFrame(fromView: fromViewController.view)
        transitionView.wineCardSubtitleLabel.text = view.subtitleLabel.text

        transitionView.wineCardImageView.frame = view.wineCardImageViewFrame(fromView: fromViewController.view)
        transitionView.wineCardImageView.image = view.wineImageView.image

        transitionView.ratingImageView.frame = toViewController.ratingImageViewFrame

        transitionView.flagImageView.frame = toViewController.flagImageViewFrame

        transitionView.wineDetailsDescriptionTitleLabel.frame = toViewController.titleLabelFrame
        transitionView.wineDetailsDescriptionTitleLabel.text = view.titleLabel.text
        transitionView.wineDetailsDescriptionSubtitleLabel.frame = toViewController.subtitleLabelFrame
        transitionView.wineDetailsDescriptionSubtitleLabel.text = view.subtitleLabel.text
        transitionView.wineDetailsScrollableView.frame = toViewController.scrollableViewFrame

        return transitionView
    }

    // MARK: - Private

    let view: CardDetailsWineView

}
