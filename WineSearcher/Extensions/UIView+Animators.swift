import UIKit

extension UIView {

    func showAnimator(duration: TimeInterval,
                      relativeStartTime: TimeInterval = 0,
                      relativeDuration: TimeInterval) -> UIViewPropertyAnimator {
        alpha = 0

        let animator = UIViewPropertyAnimator.defaultAnimator(duration: duration)
        animator.addAnimations { [unowned self] in
            UIView.keyframeAnimation(duration: duration) {
                UIView.addKeyframe(withRelativeStartTime: relativeStartTime, relativeDuration: relativeDuration) {
                    self.alpha = 1
                }
            }
        }
        return animator
    }

    func hideAnimator(duration: TimeInterval,
                      relativeStartTime: TimeInterval = 0,
                      relativeDuration: TimeInterval) -> UIViewPropertyAnimator {
        alpha = 1

        let animator = UIViewPropertyAnimator.defaultAnimator(duration: duration)
        animator.addAnimations { [unowned self] in
            UIView.keyframeAnimation(duration: duration) {
                UIView.addKeyframe(withRelativeStartTime: relativeStartTime, relativeDuration: relativeDuration) {
                    self.alpha = 0
                }
            }
        }
        return animator
    }

    func enterAnimator(duration: TimeInterval,
                       enterX: CGFloat = 0,
                       enterY: CGFloat = 0,
                       relativeStartTime: TimeInterval = 0,
                       relativeDuration: TimeInterval) -> UIViewPropertyAnimator {
        center.x -= enterX
        center.y -= enterY

        let animator = UIViewPropertyAnimator.defaultAnimator(duration: duration)
        animator.addAnimations { [unowned self] in
            UIView.keyframeAnimation(duration: duration) {
                UIView.addKeyframe(withRelativeStartTime: relativeStartTime, relativeDuration: relativeDuration) {
                    self.center.x += enterX
                    self.center.y += enterY
                }
            }
        }
        return animator
    }

    func movementAnimator(duration: TimeInterval,
                          movementX: CGFloat = 0,
                          movementY: CGFloat = 0,
                          relativeStartTime: TimeInterval = 0,
                          relativeDuration: TimeInterval) -> UIViewPropertyAnimator {
        let animator = UIViewPropertyAnimator.defaultAnimator(duration: duration)
        animator.addAnimations { [unowned self] in
            UIView.keyframeAnimation(duration: duration) {
                UIView.addKeyframe(withRelativeStartTime: relativeStartTime, relativeDuration: relativeDuration) {
                    self.center.x += movementX
                    self.center.y += movementY
                }
            }
        }
        return animator
    }

    func cornerRadiousAnimator(duration: TimeInterval,
                               toValue: CGFloat = 0,
                               relativeStartTime: TimeInterval = 0,
                               relativeDuration: TimeInterval) -> UIViewPropertyAnimator {
        let animator = UIViewPropertyAnimator.defaultAnimator(duration: duration)
        animator.addAnimations { [unowned self] in
            UIView.keyframeAnimation(duration: duration) {
                UIView.addKeyframe(withRelativeStartTime: relativeStartTime, relativeDuration: relativeDuration) {
                    self.layer.cornerRadius = toValue
                }
            }
        }
        return animator
    }

    func frameAnimator(duration: TimeInterval,
                       toFrame: CGRect,
                       relativeStartTime: TimeInterval = 0,
                       relativeDuration: TimeInterval) -> UIViewPropertyAnimator {
        let animator = UIViewPropertyAnimator.defaultAnimator(duration: duration)
        animator.addAnimations { [unowned self] in
            UIView.keyframeAnimation(duration: duration) {
                UIView.addKeyframe(withRelativeStartTime: relativeStartTime, relativeDuration: relativeDuration) {
                    self.frame = toFrame
                }
            }
        }
        return animator
    }

}
