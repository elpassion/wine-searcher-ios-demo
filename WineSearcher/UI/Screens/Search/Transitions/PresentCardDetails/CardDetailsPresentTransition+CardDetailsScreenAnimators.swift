import UIKit

extension CardDetailsPresentTransition {

    func ratingImageAnimation(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        let movment: CGFloat = 40
        transitionView.ratingImageView.alpha = 0
        transitionView.ratingImageView.center.y -= movment

        let animator = defaultAnimator
        animator.addAnimations {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6) {
                    transitionView.ratingImageView.alpha = 1
                    transitionView.ratingImageView.center.y += movment
                }
            }
        }
        return animator
    }

    func flagIconAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        transitionView.flagImageView.alpha = 0

        let animator = defaultAnimator
        animator.addAnimations {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.6) {
                    transitionView.flagImageView.alpha = 1
                }
            }
        }
        return animator
    }

    func separatorAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        transitionView.separator.alpha = 0

        let animator = defaultAnimator
        animator.addAnimations {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6) {
                    transitionView.separator.alpha = 1
                }
            }
        }
        return animator
    }

    func regionOverviewAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        transitionView.regionOverviewView.alpha = 0

        let animator = defaultAnimator
        animator.addAnimations {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.regionOverviewView.alpha = 1
                }
            }
        }
        return animator
    }

    func winesViewTitleAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        transitionView.winesView.titleLabel.alpha = 0

        let animator = defaultAnimator
        animator.addAnimations {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                    transitionView.winesView.titleLabel.alpha = 1
                }
            }
        }
        return animator
    }

    func winesAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
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

}
