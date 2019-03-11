import UIKit

extension WineDetailsPresentTransition {

    func animators(transitionView: WineDetailsTransitionView,
                   fromViewController: CardDetailsViewController,
                   toViewController: WineDetailsViewController) -> [UIViewPropertyAnimator] {
        return headerAnimators(fromViewController: fromViewController) +
            wineDetailsAnimators(transitionView: transitionView) +
            cardAnimators(transitionView: transitionView, toViewController: toViewController)
    }

    // MARK: - Private

    private func headerAnimators(fromViewController: CardDetailsViewController) -> [UIViewPropertyAnimator] {
        let headerView = fromViewController.cardDetailsView.headerView
        return [
            headerView.topTitleLabel.movementAnimator(duration: duration, movementX: -400, relativeDuration: 0.43),
            headerView.separator.hideAnimator(duration: duration, relativeDuration: 0.43),
            headerView.separator.movementAnimator(duration: duration, movementY: 20, relativeDuration: 0.43),
            headerView.topSubtitleLabel.movementAnimator(duration: duration, movementY: -100, relativeDuration: 0.43),
            headerView.topSubtitleLabel.hideAnimator(duration: duration, relativeDuration: 0.43)
        ]
    }

    private func wineDetailsAnimators(transitionView: WineDetailsTransitionView) -> [UIViewPropertyAnimator] {
        return [
            transitionView.ratingImageView.showAnimator(duration: duration,
                                                        relativeStartTime: 0.36,
                                                        relativeDuration: 0.64),
            transitionView.ratingImageView.enterAnimator(duration: duration,
                                                         enterY: -40,
                                                         relativeStartTime: 0.36,
                                                         relativeDuration: 0.64),
            transitionView.flagImageView.showAnimator(duration: duration,
                                                      relativeStartTime: 0.57,
                                                      relativeDuration: 0.29),
            transitionView.wineDetailsDescriptionTitleLabel.showAnimator(duration: duration,
                                                                         relativeStartTime: 0.16,
                                                                         relativeDuration: 0.47),
            transitionView.wineDetailsDescriptionSubtitleLabel.showAnimator(duration: duration,
                                                                            relativeStartTime: 0.16,
                                                                            relativeDuration: 0.47),
            transitionView.wineDetailsDescriptionTitleLabel.enterAnimator(duration: duration,
                                                                          enterY: -30,
                                                                          relativeStartTime: 0.16,
                                                                          relativeDuration: 0.47),
            transitionView.wineDetailsDescriptionSubtitleLabel.enterAnimator(duration: duration,
                                                                             enterY: -30,
                                                                             relativeStartTime: 0.16,
                                                                             relativeDuration: 0.47),
            transitionView.wineDetailsScrollableView.enterAnimator(duration: duration,
                                                                   enterY: -50,
                                                                   relativeStartTime: 0.25,
                                                                   relativeDuration: 0.43),
            transitionView.wineDetailsScrollableView.showAnimator(duration: duration,
                                                                  relativeStartTime: 0.25,
                                                                  relativeDuration: 0.43)
        ]
    }

    private func cardAnimators(transitionView: WineDetailsTransitionView,
                               toViewController: WineDetailsViewController) -> [UIViewPropertyAnimator] {
        let contentCardView = toViewController.wineDetailsView.contentCardView
        return [
            transitionView.wineBackgroundView.frameAnimator(duration: duration,
                                                            toFrame: contentCardView.frame,
                                                            relativeStartTime: 0.08,
                                                            relativeDuration: 0.43),
            transitionView.wineBackgroundView.cornerRadiousAnimator(duration: duration,
                                                                    toValue: contentCardView.layer.cornerRadius,
                                                                    relativeStartTime: 0.08,
                                                                    relativeDuration: 0.43),
            transitionView.wineCardImageView.frameAnimator(duration: duration,
                                                           toFrame: toViewController.wineImageViewFrame,
                                                           relativeDuration: 0.43),
            transitionView.wineCardTitleLabel.movementAnimator(duration: duration,
                                                               movementY: 200,
                                                               relativeDuration: 0.21),
            transitionView.wineCardSubtitleLabel.movementAnimator(duration: duration,
                                                                  movementY: 200,
                                                                  relativeDuration: 0.21),
            transitionView.wineCardTitleLabel.hideAnimator(duration: duration, relativeDuration: 0.21),
            transitionView.wineCardSubtitleLabel.hideAnimator(duration: duration, relativeDuration: 0.21)
        ]
    }

}
