import UIKit

class CardDetailsPresentTransition: NSObject, UIViewControllerAnimatedTransitioning {

    init(inputs: CardDetailsPresentTransitionInputs) {
        self.inputs = inputs
    }

    let duration = 10.0

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
        toViewController.view.layoutSubviews()

        guard let transitionView = createTransitionView(toViewController: toViewController,
                                                        fromViewController: fromViewController) else {
                                                            transitionContext.completeTransition(true)
                                                            return
        }

        containerView.addSubview(transitionView)
        transitionView.frame = fromViewController.view.frame

        let animators = [
            cardAnimator(transitionView: transitionView),
            titleAnimator(transitionView: transitionView, toViewController: toViewController),
            subtitleAnimator(transitionView: transitionView, toViewController: toViewController),
            topIconChangeAnimator(transitionView: transitionView, toViewController: toViewController),
            topTitleAnimator(transitionView: transitionView),
            ratingImageAnimation(transitionView: transitionView),
            cardDetailsIconAnimator(transitionView: transitionView),
            separatorAnimator(transitionView: transitionView)
        ]

        animators.forEach { $0.startAnimation() }

        animators.first?.addCompletion { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            transitionView.removeFromSuperview()
        }
    }

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
                    transitionView.titleLabel.frame = toViewController.cardDetailsView.topTitleLabel.frame
                }
            }
        }
    }

    private func subtitleAnimator(transitionView: CardDetailsPresentTransitionView,
                                  toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, curve: .easeInOut) { [unowned self] in
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.7) {
                    transitionView.subtitleLabel.frame = toViewController.cardDetailsView.topSubtitleLabel.frame
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
        transitionView.cardDetailsIconImageView.alpha = 0
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.cardDetailsIconImageView.alpha = 1
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

    private func createTransitionView(toViewController: CardDetailsViewController,
                                      fromViewController: SearchViewController) -> CardDetailsPresentTransitionView? {
        let transitionView = CardDetailsPresentTransitionView()
        guard let firstCardRect = fromViewController.cardsViewController.firstItemRect,
            let card = fromViewController.cardsViewController.currentViewController?.cardView else { return nil }
        transitionView.firstCardView.backgroundImageView.image = inputs.cardImage
        transitionView.firstCardView.frame = card.convert(firstCardRect, to: fromViewController.view)
        transitionView.firstCardView.layoutIfNeeded()

        transitionView.titleLabel.text = inputs.cardTitle
        transitionView.titleLabel.frame = card.convert(card.titleLabel.frame, to: fromViewController.view)

        transitionView.subtitleLabel.attributedText = inputs.cardSubtitle
        transitionView.subtitleLabel.frame = card.convert(card.subtitleLabel.frame, to: fromViewController.view)

        let topFromIconImageView = fromViewController.searchView.headerView.navImageView
        let topToIconImageView = toViewController.cardDetailsView.topIconImageView
        let topFromIconPosition = fromViewController.searchView.headerView.convert(topFromIconImageView.frame,
                                                                                   to: toViewController.view)
        let topToIconPosition = toViewController.cardDetailsView.convert(topToIconImageView.frame,
                                                                         to: toViewController.view)
        transitionView.fromTopIconView.frame = topFromIconPosition
        transitionView.toTopIconView.frame = topToIconPosition

        let fromNavTitleLabel = fromViewController.searchView.headerView.titleLabel
        let toNavTitleLabel = toViewController.cardDetailsView.topNavLabel
        let fromNavTitleLabelPosition = fromViewController.searchView.headerView.convert(fromNavTitleLabel.frame,
                                                                                         to: fromViewController.view)
        let toNavTitleLabelPosition = toViewController.cardDetailsView.convert(toNavTitleLabel.frame,
                                                                               to: toViewController.view)
        transitionView.fromNavTopTitleLabel.frame = fromNavTitleLabelPosition
        transitionView.toNavTopTitleLabel.frame = toNavTitleLabelPosition

        transitionView.ratingImageView.frame = toViewController.cardDetailsView.ratingImageView.frame

        transitionView.cardDetailsIconImageView.frame = toViewController.cardDetailsView.cardDetailsIconImageView.frame

        transitionView.separator.frame = toViewController.cardDetailsView.separator.frame

        return transitionView
    }

}
