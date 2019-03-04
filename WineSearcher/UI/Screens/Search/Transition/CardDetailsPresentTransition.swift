import UIKit

class CardDetailsPresentTransition: NSObject, UIViewControllerAnimatedTransitioning {

    init(inputs: CardDetailsPresentTransitionInputs) {
        self.inputs = inputs
    }

    let duration = 1.0

    private let inputs: CardDetailsPresentTransitionInputs

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

        guard let transitionView = createTransitionView(toViewController: toViewController,
                                                        fromViewController: fromViewController) else {
                                                            transitionContext.completeTransition(true)
                                                            return
        }

        containerView.addSubview(transitionView)
        transitionView.frame = fromViewController.view.frame

        let animators = self.animators(transitionView: transitionView, toViewController: toViewController)

        animators.forEach { $0.startAnimation() }

        animators.first?.addCompletion { _ in
            transitionContext.completeTransition(true)
            transitionView.removeFromSuperview()
        }
    }

    private func createTransitionView(toViewController: CardDetailsViewController,
                                      fromViewController: SearchViewController) -> CardDetailsPresentTransitionView? {
        let transitionView = CardDetailsPresentTransitionView()

        transitionView.firstCardView.backgroundImageView.image = inputs.cardImage
        transitionView.firstCardView.frame = fromViewController.firstCardFrame

        transitionView.titleLabel.text = inputs.cardTitle
        transitionView.titleLabel.frame = fromViewController.titleLabelFrame

        transitionView.subtitleLabel.attributedText = inputs.cardSubtitle
        transitionView.subtitleLabel.frame = fromViewController.subtitleLabelFrame

        transitionView.fromTopIconView.frame = fromViewController.topNavIconFrame
        transitionView.toTopIconView.frame = toViewController.topNavIconFrame

        transitionView.fromNavTopTitleLabel.frame = fromViewController.navTitleLabelFrame
        transitionView.toNavTopTitleLabel.frame = toViewController.navTitleLabelFrame

        transitionView.ratingImageView.frame = toViewController.ratingImageViewFrame

        transitionView.separator.frame = toViewController.separatorViewFrame

        transitionView.flagImageView.frame = toViewController.flagImageViewFrame

        transitionView.bottomSection.frame = fromViewController.bottomSectionFrame

        transitionView.learnMoreButton.frame = fromViewController.learnMoreButtonFrame

        transitionView.otherInSeriesButton.frame = fromViewController.otherInSeriesButtonFrame

        transitionView.regionOverviewView.frame = toViewController.regionOverviewFrame

        let winesConfigurator = CardDetailsWinesConfigurator()
        winesConfigurator.configure(wines: CardDetailsWineViewModel.wines,
                                    stackView: transitionView.winesView.contentStackView)

        transitionView.winesView.frame = toViewController.winesViewFrame

        transitionView.layoutIfNeeded()

        return transitionView
    }

}
