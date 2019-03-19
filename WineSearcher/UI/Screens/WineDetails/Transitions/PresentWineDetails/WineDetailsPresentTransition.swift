import UIKit

class WineDetailsPresentTransition: NSObject, UIViewControllerAnimatedTransitioning {

    init(tappedView view: CardDetailsWineView) {
        self.view = view
    }

    let duration = 0.8
    let view: CardDetailsWineView

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

        beforeAnimation(fromViewController: fromViewController)

        let animators = self.animators(transitionView: transitionView,
                                       fromViewController: fromViewController,
                                       toViewController: toViewController)

        animators.forEach {
            $0.startAnimation()
        }

        animators.first?.addCompletion { [weak self] _ in
            self?.afterAnimation()
            transitionView.removeFromSuperview()
            container.addSubview(toViewController.view)
            transitionContext.completeTransition(true)
        }
    }

    // MARK: - Private

    private func createTransitionView(fromViewController: CardDetailsViewController,
                                      toViewController: WineDetailsViewController) -> WineDetailsTransitionView {

        let transitionView = WineDetailsTransitionView()

        let cardDetailsBackgroundFrame = view.wineCardInitialFrame(in: fromViewController.view)
        transitionView.cardDetailsWineBackgroundView.frame = cardDetailsBackgroundFrame

        transitionView.cardDetailsTitleLabel.frame = view.wineCardTitleLabelFrame(in: fromViewController.view)

        let cardDetailsSubtitleLabelFrame = view.wineCardSubtitleLabelFrame(in: fromViewController.view)
        transitionView.cardDetailsSubtitleLabel.frame = cardDetailsSubtitleLabelFrame

        transitionView.cardDetailsWineImageView.frame = view.wineCardImageViewFrame(in: fromViewController.view)

        transitionView.wineDetailsRatingImageView.frame = toViewController.ratingImageViewFrame

        transitionView.wineDetailsFlagImageView.frame = toViewController.flagImageViewFrame

        transitionView.wineDetailsDescriptionTitleLabel.frame = toViewController.titleLabelFrame

        transitionView.wineDetailsDescriptionSubtitleLabel.frame = toViewController.subtitleLabelFrame

        transitionView.wineDetailsScrollableView.frame = toViewController.scrollableViewFrame

        transitionView.cardDetailsTitleLabel.text = view.titleLabel.text
        transitionView.cardDetailsSubtitleLabel.text = view.subtitleLabel.text
        transitionView.cardDetailsWineImageView.image = view.wineImageView.image
        transitionView.wineDetailsDescriptionSubtitleLabel.text = view.subtitleLabel.text
        transitionView.wineDetailsDescriptionTitleLabel.text = view.titleLabel.text

        return transitionView
    }

    private func beforeAnimation(fromViewController: CardDetailsViewController) {
        fromViewController.cardDetailsView.headerView.ratingImageView.isHidden = true
        view.wineImageView.isHidden = true
    }

    private func afterAnimation() {
        view.wineImageView.isHidden = false
    }

}
