import UIKit

extension CardDetailsDismissTransition {

    func animators(transitionView: CardDetailsTransitionView,
                   toViewController: SearchViewController) -> [UIViewPropertyAnimator] {
        return [
            transitionView.searchTopNavIconView.enterAnimator(duration: duration, enterX: 50, relativeDuration: 1),
            transitionView.detailsTopNavIconView.hideAnimator(duration: duration, relativeDuration: 1),
            transitionView.detailsTopNavTitleLabel.hideAnimator(duration: duration, relativeDuration: 1),
            transitionView.searchTopNavTitleLabel.showAnimator(duration: duration, relativeDuration: 1),
            transitionView.separator.hideAnimator(duration: duration, relativeDuration: 1),
            transitionView.ratingImageView.movementAnimator(duration: duration, movementY: -50, relativeDuration: 1),
            transitionView.ratingImageView.hideAnimator(duration: duration, relativeDuration: 1),
            transitionView.regionOverviewView.hideAnimator(duration: duration, relativeDuration: 1),
            transitionView.winesView.titleLabel.hideAnimator(duration: duration, relativeDuration: 1),
            transitionView.learnMoreButton.showAnimator(duration: duration, relativeDuration: 1),
            transitionView.otherInSeriesButton.showAnimator(duration: duration, relativeDuration: 1),
            transitionView.bottomSection.showAnimator(duration: duration, relativeDuration: 1),
            transitionView.bottomSection.enterAnimator(duration: duration, enterY: -150, relativeDuration: 1),
            transitionView.flagImageView.hideAnimator(duration: duration, relativeDuration: 1),
            transitionView.titleLabel.frameAnimator(duration: duration,
                                                    toFrame: toViewController.titleLabelFrame,
                                                    relativeDuration: 1),
            transitionView.subtitleLabel.frameAnimator(duration: duration,
                                                       toFrame: toViewController.subtitleLabelFrame,
                                                       relativeDuration: 1),
            transitionView.firstCardView.cornerRadiousAnimator(duration: duration, toValue: 16, relativeDuration: 1),
            cardAnimator(transitionView: transitionView, toViewController: toViewController),
            winesAnimator(transitionView: transitionView)
        ]
    }

    // MARK: - Private

    private var defaultAnimator: UIViewPropertyAnimator {
        return UIViewPropertyAnimator.defaultAnimator(duration: duration)
    }

    private func winesAnimator(transitionView: CardDetailsTransitionView) -> UIViewPropertyAnimator {
        let wines = transitionView.winesView.contentStackView.subviews

        let animator = defaultAnimator
        animator.addAnimations {
            UIView.keyframeAnimation(duration: self.duration) {
                wines.reversed().enumerated().forEach { index, element in
                    let startTime = 0.08 * Double(index)
                    UIView.addKeyframe(withRelativeStartTime: startTime, relativeDuration: 1) {
                        element.layer.opacity = 0
                        element.center.y += 140
                    }
                }
            }
        }
        return animator
    }

    private func cardAnimator(transitionView: CardDetailsTransitionView,
                              toViewController: SearchViewController) -> UIViewPropertyAnimator {
        let animator = defaultAnimator
        animator.addAnimations {
            let cardView = transitionView.firstCardView
            transitionView.firstCardView.backgroundImageView.contentMode = .scaleToFill
            cardView.frame = toViewController.firstCardFrame
            cardView.layoutIfNeeded()
        }
        return animator
    }

}
