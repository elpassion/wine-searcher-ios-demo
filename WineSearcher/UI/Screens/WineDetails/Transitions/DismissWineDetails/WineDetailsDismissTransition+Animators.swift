import UIKit

extension WineDetailsDismissTransition {

    func animators(transitionView: WineDetailsTransitionView,
                   toViewController: CardDetailsViewController) -> [UIViewPropertyAnimator] {
        return headerViewAnimators(toViewController: toViewController) +
            transitionViewAnimators(transitionView: transitionView, toViewController: toViewController)
    }

    // MARK: - Private

    private func headerViewAnimators(toViewController: CardDetailsViewController) -> [UIViewPropertyAnimator] {
        let headerView = toViewController.cardDetailsView.headerView
        return [
            headerView.topTitleLabel.movementAnimator(duration: duration,
                                                      movementX: 400,
                                                      relativeStartTime: 0.14,
                                                      relativeDuration: 0.86),
            headerView.separator.showAnimator(duration: duration,
                                              relativeStartTime: 0.14,
                                              relativeDuration: 0.86),
            headerView.topSubtitleLabel.movementAnimator(duration: duration,
                                                         movementY: 100,
                                                         relativeStartTime: 0.14,
                                                         relativeDuration: 0.86),
            headerView.topSubtitleLabel.showAnimator(duration: duration,
                                                     relativeStartTime: 0.14,
                                                     relativeDuration: 0.86)
        ]
    }

    private func transitionViewAnimators(transitionView: WineDetailsTransitionView,
                                         toViewController: CardDetailsViewController) -> [UIViewPropertyAnimator] {
        let wineCardInitialFrame = view.wineCardInitialFrame(in: toViewController.view)
        let wineCardImageViewFrame = view.wineCardImageViewFrame(in: toViewController.view)
        return [
            transitionView.cardDetailsWineBackgroundView.frameAnimator(duration: duration,
                                                                       toFrame: wineCardInitialFrame,
                                                                       relativeStartTime: 0.14,
                                                                       relativeDuration: 0.86),
            transitionView.cardDetailsWineImageView.frameAnimator(duration: duration,
                                                                  toFrame: wineCardImageViewFrame,
                                                                  relativeStartTime: 0.14,
                                                                  relativeDuration: 0.86),
            transitionView.cardDetailsTitleLabel.showAnimator(duration: duration,
                                                              relativeStartTime: 0.14,
                                                              relativeDuration: 0.86),
            transitionView.cardDetailsSubtitleLabel.showAnimator(duration: duration,
                                                                 relativeStartTime: 0.14,
                                                                 relativeDuration: 0.86),
            transitionView.cardDetailsTitleLabel.enterAnimator(duration: duration,
                                                               enterY: -200,
                                                               relativeStartTime: 0.14,
                                                               relativeDuration: 0.86),
            transitionView.cardDetailsSubtitleLabel.enterAnimator(duration: duration,
                                                                  enterY: -200,
                                                                  relativeStartTime: 0.14,
                                                                  relativeDuration: 0.86)
        ]
    }

}
