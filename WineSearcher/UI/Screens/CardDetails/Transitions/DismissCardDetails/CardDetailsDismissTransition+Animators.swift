import UIKit

extension CardDetailsDismissTransition {

    func animators(transitionView: CardDetailsTransitionView,
                   toViewController: SearchViewController) -> [UIViewPropertyAnimator] {
        return [
            transitionView.searchTopNavIconView.enterAnimator(duration: duration, enterX: 50),
            transitionView.detailsTopNavIconView.hideAnimator(duration: duration),
            transitionView.detailsTopNavTitleLabel.hideAnimator(duration: duration),
            transitionView.searchTopNavTitleLabel.showAnimator(duration: duration),
            transitionView.separator.hideAnimator(duration: duration),
            transitionView.ratingImageView.movementAnimator(duration: duration, movementY: -50),
            transitionView.ratingImageView.hideAnimator(duration: duration),
            transitionView.regionOverviewView.hideAnimator(duration: duration),
            transitionView.winesView.titleLabel.hideAnimator(duration: duration),
            transitionView.learnMoreButton.showAnimator(duration: duration),
            transitionView.otherInSeriesButton.showAnimator(duration: duration),
            transitionView.bottomSection.showAnimator(duration: duration),
            transitionView.bottomSection.enterAnimator(duration: duration, enterY: -150),
            transitionView.flagImageView.hideAnimator(duration: duration),
            transitionView.titleLabel.frameAnimator(duration: duration,
                                                    toFrame: cardView.titleLabelFrame(in: toViewController.view)),
            transitionView.subtitleLabel.frameAnimator(duration: duration,
                                                       toFrame: cardView.subtitleLabelFrame(in: toViewController.view)),
            transitionView.cardView.cornerRadiousAnimator(duration: duration, toValue: 16, relativeDuration: 1),
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
            let cardView = transitionView.cardView
            cardView.frame = self.cardView.cardFrame(in: toViewController.view)
        }
        return animator
    }

}
