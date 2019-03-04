import UIKit

extension CardDetailsPresentTransition {

    func cardAnimator(transitionView: CardDetailsPresentTransitionView,
                      toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, dampingRatio: 0.62) {
            let cardView = transitionView.firstCardView
            cardView.frame = toViewController.headerFrame
            cardView.layer.cornerRadius = 0
            cardView.layoutIfNeeded()
            transitionView.firstCardView.backgroundImageView.contentMode = .scaleAspectFit
        }
    }

    func titleAnimator(transitionView: CardDetailsPresentTransitionView,
                       toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        let animator = defaultAnimator
        animator.addAnimations {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6) {
                    transitionView.titleLabel.frame = toViewController.topTitleLabelFrame
                }
            }
        }
        return animator
    }

    func subtitleAnimator(transitionView: CardDetailsPresentTransitionView,
                          toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        let animator = defaultAnimator
        animator.addAnimations {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.6) {
                    transitionView.subtitleLabel.frame = toViewController.topSubtitleLabelFrame
                }
            }
        }
        return animator
    }

    func topIconChangeAnimator(transitionView: CardDetailsPresentTransitionView,
                               toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        transitionView.toTopIconView.alpha = 0

        let animator = defaultAnimator
        animator.addAnimations {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6) {
                    transitionView.toTopIconView.alpha = 1
                    transitionView.fromTopIconView.center.x -= 50
                }
            }
        }
        return animator
    }

    func topNavTitleAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        transitionView.toNavTopTitleLabel.alpha = 0

        let animator = defaultAnimator
        animator.addAnimations {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6) {
                    transitionView.toNavTopTitleLabel.alpha = 1
                    transitionView.fromNavTopTitleLabel.alpha = 0
                }
            }
        }
        return animator
    }

}
