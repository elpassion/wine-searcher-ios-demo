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

        transitionView.firstCardView.backgroundImageView.image = inputs.cardImage
        transitionView.firstCardView.frame = fromViewController.firstCardFrame
        transitionView.firstCardView.layoutIfNeeded()

        transitionView.titleLabel.text = inputs.cardTitle
        transitionView.titleLabel.frame = fromViewController.titleLabelFrame

        transitionView.subtitleLabel.attributedText = inputs.cardSubtitle
        transitionView.subtitleLabel.frame = fromViewController.subtitleLabelFrame

        transitionView.fromTopIconView.frame = fromViewController.topNavIconFrame
        transitionView.toTopIconView.frame = toViewController.topNavIconFrame

        transitionView.fromNavTopTitleLabel.frame = fromViewController.navTitleLabelFrame
        transitionView.toNavTopTitleLabel.frame = toViewController.navTitleLabelFrame

        transitionView.ratingImageView.frame = toViewController.cardDetailsView.ratingImageView.frame

        transitionView.cardDetailsIconImageView.frame = toViewController.cardDetailsView.cardDetailsIconImageView.frame

        transitionView.separator.frame = toViewController.cardDetailsView.separator.frame

        return transitionView
    }

}

extension SearchViewController {

    var titleLabelFrame: CGRect {
        guard let titleLabel = cardsViewController.currentViewController?.cardView.titleLabel else { return .zero }
        return titleLabel.superview?.convert(titleLabel.frame, to: view) ?? .zero
    }

    var subtitleLabelFrame: CGRect {
        guard let subtitleLabel = cardsViewController.currentViewController?.cardView.subtitleLabel else {
            return .zero
        }
        return subtitleLabel.superview?.convert(subtitleLabel.frame, to: view) ?? .zero
    }

    var firstCardFrame: CGRect {
        guard let card = cardsViewController.currentViewController?.cardView else { return .zero }
        return card.convert(cardsViewController.firstItemRect ?? .zero, to: view)
    }

    var topNavIconFrame: CGRect {
        let navImageView = searchView.headerView.navImageView
        return navImageView.superview?.convert(navImageView.frame, to: view) ?? .zero
    }

    var navTitleLabelFrame: CGRect {
        let navTitleLabel = searchView.headerView.titleLabel
        return navTitleLabel.superview?.convert(navTitleLabel.frame, to: view) ?? .zero
    }

}

extension CardDetailsViewController {

    var topNavIconFrame: CGRect {
        let topIconImageView = cardDetailsView.topIconImageView
        return topIconImageView.superview?.convert(topIconImageView.frame, to: view) ?? .zero
    }

    var navTitleLabelFrame: CGRect {
        let navTitleLabel = cardDetailsView.topNavLabel
        return navTitleLabel.superview?.convert(navTitleLabel.frame, to: view) ?? .zero
    }

}
