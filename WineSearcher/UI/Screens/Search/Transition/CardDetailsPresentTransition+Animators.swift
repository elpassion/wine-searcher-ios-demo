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
            separatorAnimator(transitionView: transitionView),
            searchBottomSectionAnimator(transtionView: transitionView),
            cardButtonsAnimator(transitionView: transitionView),
            winesViewTitleAnimator(transitionView: transitionView),
            winesAnimator(transitionView: transitionView)
        ]
    }

    // MARK: - Private

    private typealias TransitionView = CardDetailsPresentTransitionView

    private func cardAnimator(transitionView: TransitionView) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, dampingRatio: 0.75) {
            let cardView = transitionView.firstCardView
            cardView.frame = CGRect(x: 0, y: 0, width: transitionView.frame.width, height: 350)
            cardView.layer.cornerRadius = 0
            cardView.layoutIfNeeded()
            transitionView.firstCardView.backgroundImageView.contentMode = .scaleAspectFit
        }
    }

    private func titleAnimator(transitionView: TransitionView,
                               toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, curve: .easeOut) { [unowned self] in
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                    transitionView.titleLabel.frame = toViewController.topTitleLabelFrame
                }
            }
        }
    }

    private func subtitleAnimator(transitionView: TransitionView,
                                  toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, curve: .easeInOut) { [unowned self] in
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.7) {
                    transitionView.subtitleLabel.frame = toViewController.topSubtitleLabelFrame
                }
            }
        }
    }

    private func topIconChangeAnimator(transitionView: TransitionView,
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

    private func topTitleAnimator(transitionView: TransitionView) -> UIViewPropertyAnimator {
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

    private func ratingImageAnimation(transitionView: TransitionView) -> UIViewPropertyAnimator {
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

    private func cardDetailsIconAnimator(transitionView: TransitionView) -> UIViewPropertyAnimator {
        transitionView.flagImageView.alpha = 0
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.flagImageView.alpha = 1
                }
            }
        }
    }

    private func separatorAnimator(transitionView: TransitionView) -> UIViewPropertyAnimator {
        transitionView.separator.alpha = 0
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.separator.alpha = 1
                }
            }
        }
    }

    private func searchBottomSectionAnimator(transtionView: TransitionView) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transtionView.bottomSection.alpha = 0
                    transtionView.bottomSection.center.y += 300
                }
            }
        }
    }

    private func cardButtonsAnimator(transitionView: TransitionView) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.learnMoreButton.alpha = 0
                    transitionView.otherInSeriesButton.alpha = 0
                }
            }
        }
    }

    private func regionOverviewAnimator(transitionView: TransitionView) -> UIViewPropertyAnimator {
        transitionView.regionOverviewView.alpha = 0
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.regionOverviewView.alpha = 1
                }
            }
        }
    }

    private func winesViewTitleAnimator(transitionView: TransitionView) -> UIViewPropertyAnimator {
        transitionView.winesView.titleLabel.layer.opacity = 0
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.winesView.titleLabel.layer.opacity = 1
                }
            }
        }
    }

    private func winesAnimator(transitionView: TransitionView) -> UIViewPropertyAnimator {
        let wines = transitionView.winesView.contentStackView.subviews
        wines.forEach { element in
            element.layer.opacity = 0
            element.center.y += 300
        }
        return UIViewPropertyAnimator(duration: self.duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                wines.enumerated().forEach { index, element in
                    UIView.addKeyframe(withRelativeStartTime: 0.3 * Double(index), relativeDuration: 0.3) {
                        element.layer.opacity = 1
                        element.center.y -= 300
                    }
                }
            }
        }
    }

}
