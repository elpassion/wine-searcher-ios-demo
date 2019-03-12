import UIKit

class WineDetailsDismissTransition: NSObject, UIViewControllerAnimatedTransitioning {

    init(tappedView view: CardDetailsWineView) {
        self.view = view
    }

    let duration = 0.35
    let view: CardDetailsWineView

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

    // MARK: - Private

    private func createTransitionView(toViewController: CardDetailsViewController,
                                      fromViewController: WineDetailsViewController) -> WineDetailsTransitionView {
        let transitionView = WineDetailsTransitionView()

        transitionView.wineDetailsScrollableView.frame = fromViewController.scrollableViewFrame

        transitionView.wineDetailsFlagImageView.isHidden = true
        transitionView.wineDetailsRatingImageView.isHidden = true
        transitionView.wineDetailsDescriptionTitleLabel.isHidden = true
        transitionView.wineDetailsDescriptionSubtitleLabel.isHidden = true
        transitionView.wineDetailsScrollableView.isHidden = true

        transitionView.cardDetailsWineImageView.frame = fromViewController.wineImageViewFrame
        transitionView.cardDetailsWineBackgroundView.frame = fromViewController.wineDetailsView.contentCardView.frame
        transitionView.cardDetailsTitleLabel.frame = view.wineCardTitleLabelFrame(in: toViewController.view)
        transitionView.cardDetailsSubtitleLabel.frame = view.wineCardSubtitleLabelFrame(in: toViewController.view)

        let wineDetailsTitleLabel = fromViewController.wineDetailsView.wineDetailsDescriptionView.titleLabel
        transitionView.cardDetailsTitleLabel.text = wineDetailsTitleLabel.text

        let wineDetailsSubtitleLabel = fromViewController.wineDetailsView.wineDetailsDescriptionView.subtitleLabel
        transitionView.cardDetailsSubtitleLabel.text = wineDetailsSubtitleLabel.text

        transitionView.cardDetailsWineImageView.image = fromViewController.wineDetailsView.wineImageView.image

        return transitionView
    }

    private func beforeAnimation(toViewController: CardDetailsViewController) {
        toViewController.cardDetailsView.headerView.ratingImageView.isHidden = false
        view.wineImageView.isHidden = true
    }

    private func afterAnimation() {
        view.wineImageView.isHidden = false
    }

}
