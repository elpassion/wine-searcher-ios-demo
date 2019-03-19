import UIKit

class CardDetailsDismissTransition: NSObject, UIViewControllerAnimatedTransitioning {

    init(cardView: CardView) {
        self.cardView = cardView
    }

    let duration = 0.3
    let cardView: CardView

    // MARK: - UIViewControllerAnimatedTransitioning

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let toViewController = transitionContext.viewController(forKey: .to) as? SearchViewController,
            let fromViewController = transitionContext.viewController(forKey: .from) as? CardDetailsViewController
            else {
                transitionContext.completeTransition(true)
                return
        }

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

    private func createTransitionView(toViewController: SearchViewController,
                                      fromViewController: CardDetailsViewController) -> CardDetailsTransitionView {
        let transitionView = CardDetailsTransitionView()

        transitionView.cardView.backgroundImageView.image = cardView.contentView.backgroundImageView.image

        transitionView.cardView.frame = fromViewController.headerFrame
        transitionView.cardView.layer.cornerRadius = 0

        transitionView.titleLabel.text = cardView.titleLabel.text
        transitionView.titleLabel.frame = fromViewController.topTitleLabelFrame
        transitionView.titleLabel.sizeToFit()

        transitionView.subtitleLabel.attributedText = cardView.subtitleLabel.attributedText
        transitionView.subtitleLabel.frame = fromViewController.topSubtitleLabelFrame
        transitionView.subtitleLabel.sizeToFit()

        transitionView.searchTopNavIconView.frame = fromViewController.topNavIconFrame
        transitionView.detailsTopNavIconView.frame = toViewController.topNavIconFrame

        transitionView.searchTopNavTitleLabel.frame = fromViewController.navTitleLabelFrame
        transitionView.detailsTopNavTitleLabel.frame = toViewController.navTitleLabelFrame
        transitionView.searchTopNavTitleLabel.sizeToFit()
        transitionView.detailsTopNavTitleLabel.sizeToFit()

        transitionView.ratingImageView.frame = fromViewController.ratingImageViewFrame

        transitionView.separator.frame = fromViewController.separatorViewFrame

        transitionView.flagImageView.frame = fromViewController.flagImageViewFrame

        transitionView.bottomSection.frame = toViewController.bottomSectionFrame

        transitionView.learnMoreButton.frame = cardView.learnMoreButtonFrame(in: fromViewController.view)

        transitionView.otherInSeriesButton.frame = cardView.otherInSeriesButtonFrame(in: fromViewController.view)

        transitionView.regionOverviewView.frame = fromViewController.regionOverviewFrame

        let winesConfigurator = CardDetailsWinesConfigurator()
        winesConfigurator.configure(wines: CardDetailsWineViewModel.wines,
                                    stackView: transitionView.winesView.contentStackView,
                                    action: nil)

        transitionView.winesView.frame = fromViewController.winesViewFrame

        transitionView.layoutIfNeeded()

        return transitionView
    }

}
