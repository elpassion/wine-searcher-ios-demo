import UIKit

extension CardDetailsPresentTransition {

    func animators(transitionView: CardDetailsPresentTransitionView,
                   toViewController: CardDetailsViewController) -> [UIViewPropertyAnimator] {
        return [
            cardAnimator(transitionView: transitionView, toViewController: toViewController),
            titleAnimator(transitionView: transitionView, toViewController: toViewController),
            subtitleAnimator(transitionView: transitionView, toViewController: toViewController),
            topIconChangeAnimator(transitionView: transitionView, toViewController: toViewController),
            topNavTitleAnimator(transitionView: transitionView),
            ratingImageAnimation(transitionView: transitionView),
            flagIconAnimator(transitionView: transitionView),
            separatorAnimator(transitionView: transitionView),
            bottomSectionAnimator(transtionView: transitionView),
            cardButtonsAnimator(transitionView: transitionView),
            winesViewTitleAnimator(transitionView: transitionView),
            winesAnimator(transitionView: transitionView)
        ]
    }

    var defaultAnimator: UIViewPropertyAnimator {
        return UIViewPropertyAnimator.defaultAnimator(duration: duration)
    }

}
