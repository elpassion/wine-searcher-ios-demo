import UIKit

extension CardDetailsPresentTransition {

    func cardButtonsAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        let animator = defaultAnimator
        animator.addAnimations {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                    transitionView.learnMoreButton.alpha = 0
                    transitionView.otherInSeriesButton.alpha = 0
                }
            }
        }
        return animator
    }

    func bottomSectionAnimator(transtionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        let animator = defaultAnimator
        animator.addAnimations {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6) {
                    transtionView.bottomSection.alpha = 0
                    transtionView.bottomSection.center.y += 300
                }
            }
        }
        return animator
    }

}
