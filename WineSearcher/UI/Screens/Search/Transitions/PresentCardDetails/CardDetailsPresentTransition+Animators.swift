import UIKit

extension CardDetailsPresentTransition {

    func animators(transitionView: CardDetailsTransitionView,
                   toViewController: CardDetailsViewController) -> [UIViewPropertyAnimator] {
        return [
            transitionView.fromTopIconView.movementAnimator(duration: duration, movementX: -50, relativeDuration: 0.6),
            transitionView.toTopIconView.showAnimator(duration: duration, relativeDuration: 0.6),
            transitionView.toNavTopTitleLabel.showAnimator(duration: duration, relativeDuration: 0.6),
            transitionView.fromNavTopTitleLabel.hideAnimator(duration: duration, relativeDuration: 0.6),
            transitionView.ratingImageView.enterAnimator(duration: duration, enterY: 40, relativeDuration: 0.6),
            transitionView.ratingImageView.showAnimator(duration: duration, relativeDuration: 0.6),
            transitionView.flagImageView.showAnimator(duration: duration,
                                                      relativeStartTime: 0.4,
                                                      relativeDuration: 0.6),
            transitionView.separator.showAnimator(duration: duration, relativeDuration: 0.6),
            transitionView.regionOverviewView.showAnimator(duration: duration, relativeDuration: 0.6),
            transitionView.winesView.titleLabel.showAnimator(duration: duration, relativeDuration: 0.6),
            transitionView.bottomSection.hideAnimator(duration: duration, relativeDuration: 0.6),
            transitionView.bottomSection.movementAnimator(duration: duration, movementY: 300, relativeDuration: 0.6),
            transitionView.learnMoreButton.hideAnimator(duration: 0, relativeDuration: 0.3),
            transitionView.otherInSeriesButton.hideAnimator(duration: 0, relativeDuration: 0.3),
            transitionView.firstCardView.cornerRadiousAnimator(duration: duration, relativeDuration: 0.6),
            transitionView.titleLabel.frameAnimator(duration: duration,
                                                    toFrame: toViewController.topTitleLabelFrame,
                                                    relativeDuration: 0.6),
            transitionView.subtitleLabel.frameAnimator(duration: duration,
                                                       toFrame: toViewController.topSubtitleLabelFrame,
                                                       relativeStartTime: 0.1,
                                                       relativeDuration: 0.6),
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
        let movment: CGFloat = 140

        wines.forEach { element in
            element.layer.opacity = 0
            element.center.y += movment
        }

        let animator = defaultAnimator
        animator.addAnimations {
            UIView.keyframeAnimation(duration: self.duration) {
                wines.enumerated().forEach { index, element in
                    UIView.addKeyframe(withRelativeStartTime: 0.08 * Double(index), relativeDuration: 0.3) {
                        element.layer.opacity = 1
                        element.center.y -= movment
                    }
                }
            }
        }
        return animator
    }

    private func cardAnimator(transitionView: CardDetailsTransitionView,
                              toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, dampingRatio: 0.62) {
            let cardView = transitionView.firstCardView
            cardView.frame = toViewController.headerFrame
            cardView.layoutIfNeeded()
            transitionView.firstCardView.backgroundImageView.contentMode = .scaleAspectFit
        }
    }

}
