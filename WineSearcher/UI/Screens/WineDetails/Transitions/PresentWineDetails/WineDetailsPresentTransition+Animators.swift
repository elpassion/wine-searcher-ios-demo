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
            headerView.topSubtitleLabel.movementAnimator(duration: duration, movementY: -100, relativeDuration: 0.43),
            headerView.topSubtitleLabel.hideAnimator(duration: duration, relativeDuration: 0.43)
        ]
    }

    private func wineDetailsAnimators(transitionView: WineDetailsTransitionView) -> [UIViewPropertyAnimator] {
        return [
            transitionView.wineDetailsRatingImageView.showAnimator(duration: duration,
                                                                   relativeStartTime: 0.36,
                                                                   relativeDuration: 0.64),
            transitionView.wineDetailsRatingImageView.enterAnimator(duration: duration,
                                                                    enterY: -40,
                                                                    relativeStartTime: 0.36,
                                                                    relativeDuration: 0.64),
            transitionView.wineDetailsFlagImageView.showAnimator(duration: duration,
                                                                 relativeStartTime: 0.57,
                                                                 relativeDuration: 0.29),
            transitionView.wineDetailsDescriptionTitleLabel.showAnimator(duration: duration,
                                                                         relativeStartTime: 0.16,
                                                                         relativeDuration: 0.47),
            transitionView.wineDetailsDescriptionSubtitleLabel.showAnimator(duration: duration,
                                                                            relativeStartTime: 0.16,
                                                                            relativeDuration: 0.47),
            transitionView.wineDetailsDescriptionTitleLabel.enterAnimator(duration: duration,
                                                                          enterY: 30,
                                                                          relativeStartTime: 0.16,
                                                                          relativeDuration: 0.47),
            transitionView.wineDetailsDescriptionSubtitleLabel.enterAnimator(duration: duration,
                                                                             enterY: 30,
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
        let contentCardCornerRadious = contentCardView.layer.cornerRadius
        return [
            transitionView.cardDetailsWineBackgroundView.frameAnimator(duration: duration,
                                                                       toFrame: contentCardView.frame,
                                                                       relativeStartTime: 0.08,
                                                                       relativeDuration: 0.43),
            transitionView.cardDetailsWineBackgroundView.cornerRadiousAnimator(duration: duration,
                                                                               toValue: contentCardCornerRadious,
                                                                               relativeStartTime: 0.08,
                                                                               relativeDuration: 0.43),
            transitionView.cardDetailsWineImageView.frameAnimator(duration: duration,
                                                                  toFrame: toViewController.wineImageViewFrame,
                                                                  relativeDuration: 0.43),
            transitionView.cardDetailsTitleLabel.movementAnimator(duration: duration,
                                                                  movementY: 200,
                                                                  relativeDuration: 0.21),
            transitionView.cardDetailsSubtitleLabel.movementAnimator(duration: duration,
                                                                     movementY: 200,
                                                                     relativeDuration: 0.21),
            transitionView.cardDetailsTitleLabel.hideAnimator(duration: duration, relativeDuration: 0.21),
            transitionView.cardDetailsSubtitleLabel.hideAnimator(duration: duration, relativeDuration: 0.21)
        ]
    }

}
