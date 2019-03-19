import UIKit

class CardDetailsPresentTransition: NSObject, UIViewControllerAnimatedTransitioning {

    init(cardView: CardView) {
        self.cardView = cardView
    }

    let duration = 0.8
    let cardView: CardView

    // MARK: - UIViewControllerAnimatedTransitioning

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let toViewController = transitionContext.viewController(forKey: .to) as? CardDetailsViewController,
            let fromViewController = transitionContext.viewController(forKey: .from) as? SearchViewController else {
                transitionContext.completeTransition(true)
                return
        }

        containerView.addSubview(toViewController.view)
        toViewController.view.frame = fromViewController.view.frame
        toViewController.view.layoutIfNeeded()

        let transitionView = createTransitionView(toViewController: toViewController,
                                                  fromViewController: fromViewController)

        containerView.addSubview(transitionView)
        transitionView.frame = fromViewController.view.frame

        let animators = self.animators(transitionView: transitionView, toViewController: toViewController)

        animators.forEach { $0.startAnimation() }

        animators.first?.addCompletion { _ in
            transitionContext.completeTransition(true)
            transitionView.removeFromSuperview()
        }
    }

    // MARK: - Private

    private func createTransitionView(toViewController: CardDetailsViewController,
                                      fromViewController: SearchViewController) -> CardDetailsTransitionView {
        let transitionView = CardDetailsTransitionView()

        let image = toViewController.cardDetailsView.headerView.topImageView.image
        transitionView.cardView.backgroundImageView.image = image
        transitionView.cardView.frame = cardView.cardFrame(in: fromViewController.view)

        transitionView.titleLabel.text = toViewController.cardDetailsView.headerView.topTitleLabel.text
        transitionView.titleLabel.frame = cardView.titleLabelFrame(in: fromViewController.view)

        let subtitle = toViewController.cardDetailsView.headerView.topSubtitleLabel.attributedText
        transitionView.subtitleLabel.attributedText = subtitle
        transitionView.subtitleLabel.frame = cardView.subtitleLabelFrame(in: fromViewController.view)

        transitionView.searchTopNavIconView.frame = fromViewController.topNavIconFrame
        transitionView.detailsTopNavIconView.frame = toViewController.topNavIconFrame

        transitionView.searchTopNavTitleLabel.frame = fromViewController.navTitleLabelFrame
        transitionView.detailsTopNavTitleLabel.frame = toViewController.navTitleLabelFrame

        transitionView.ratingImageView.frame = toViewController.ratingImageViewFrame

        transitionView.separator.frame = toViewController.separatorViewFrame

        transitionView.flagImageView.frame = toViewController.flagImageViewFrame

        transitionView.bottomSection.frame = fromViewController.bottomSectionFrame

        transitionView.learnMoreButton.frame = cardView.learnMoreButtonFrame(in: fromViewController.view)

        transitionView.otherInSeriesButton.frame = cardView.otherInSeriesButtonFrame(in: fromViewController.view)

        transitionView.regionOverviewView.frame = toViewController.regionOverviewFrame

        let winesConfigurator = CardDetailsWinesConfigurator()
        winesConfigurator.configure(wines: CardDetailsWineViewModel.wines,
                                    stackView: transitionView.winesView.contentStackView,
                                    action: nil)

        transitionView.winesView.frame = toViewController.winesViewFrame

        transitionView.layoutIfNeeded()

        return transitionView
    }

}
