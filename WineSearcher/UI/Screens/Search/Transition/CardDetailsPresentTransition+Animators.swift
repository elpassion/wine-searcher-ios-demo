import UIKit

extension CardDetailsPresentTransition {

    func animators(transitionView: CardDetailsPresentTransitionView,
                   toViewController: CardDetailsViewController) -> [UIViewPropertyAnimator] {
        return [
            cardAnimator(transitionView: transitionView),
            titleAnimator(transitionView: transitionView, toViewController: toViewController),
            subtitleAnimator(transitionView: transitionView, toViewController: toViewController),
            topIconChangeAnimator(transitionView: transitionView, toViewController: toViewController),
            topTitleAnimator(transitionView: transitionView),
            ratingImageAnimation(transitionView: transitionView),
            cardDetailsIconAnimator(transitionView: transitionView),
            separatorAnimator(transitionView: transitionView)
        ]
    }

    // MARK: - Private

    private func cardAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, dampingRatio: 0.75) {
            let cardView = transitionView.firstCardView
            cardView.frame = CGRect(x: 0, y: 0, width: transitionView.frame.width, height: 350)
            cardView.layer.cornerRadius = 0
            cardView.layoutIfNeeded()
            transitionView.firstCardView.backgroundImageView.contentMode = .scaleAspectFit
        }
    }

    private func titleAnimator(transitionView: CardDetailsPresentTransitionView,
                               toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, curve: .easeOut) { [unowned self] in
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                    transitionView.titleLabel.frame = toViewController.topTitleLabelFrame
                }
            }
        }
    }

    private func subtitleAnimator(transitionView: CardDetailsPresentTransitionView,
                                  toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, curve: .easeInOut) { [unowned self] in
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.7) {
                    transitionView.subtitleLabel.frame = toViewController.topSubtitleLabelFrame
                }
            }
        }
    }

    private func topIconChangeAnimator(transitionView: CardDetailsPresentTransitionView,
                                       toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        transitionView.toTopIconView.alpha = 0
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.toTopIconView.alpha = 1
                    transitionView.fromTopIconView.center.x -= 50
                }
            }
        }
    }

    private func topTitleAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        transitionView.toNavTopTitleLabel.alpha = 0
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.toNavTopTitleLabel.alpha = 1
                    transitionView.fromNavTopTitleLabel.alpha = 0
                }
            }
        }
    }

    private func ratingImageAnimation(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        let movment: CGFloat = 50
        transitionView.ratingImageView.alpha = 0
        transitionView.ratingImageView.center.y -= movment
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.ratingImageView.alpha = 1
                    transitionView.ratingImageView.center.y += movment
                }
            }
        }
    }

    private func cardDetailsIconAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        transitionView.flagImageView.alpha = 0
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.flagImageView.alpha = 1
                }
            }
        }
    }

    private func separatorAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        transitionView.separator.alpha = 0
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.separator.alpha = 1
                }
            }
        }
    }

}
