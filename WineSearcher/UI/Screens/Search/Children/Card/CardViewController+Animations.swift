import UIKit

extension CardViewController {

    // MARK: - Animations

    func animate() {
        animateButtonsRightSwipe()
        animateButtonsLeftSwipe()
        animateLabelsRightSwipe()
        animateLabelsLeftSwipe()
        animateCard()
        animateBackground()
    }

    // MARK: - Private

    private func animateBackground() {
        cardView.contentView.animationProgress = animationProgress
    }

    private func animateButtonsRightSwipe() {
        let startProgress: CGFloat = 0
        let endProgress: CGFloat = -0.27
        if animationProgress <= startProgress && animationProgress > endProgress {
            let normalized = abs(animationProgress).normalizeToOne(minValue: abs(startProgress),
                                                                   maxValue: abs(endProgress))
            cardView.learnMoreButton.layer.opacity = Float(1 - normalized)
            cardView.otherInSeriesButton.layer.opacity = Float(1 - normalized)
            let buttonTransform = CGAffineTransform(translationX: -200 * normalized, y: 0)
            cardView.learnMoreButton.transform = buttonTransform
            cardView.otherInSeriesButton.transform = buttonTransform
        } else if animationProgress < endProgress {
            hideButtons()
        }
    }

    private func animateButtonsLeftSwipe() {
        let startProgress: CGFloat = 0
        let endProgress: CGFloat = 0.73
        let isAfterAnimation = animationProgress > endProgress
        if animationProgress > startProgress && animationProgress < endProgress {
            let normalized = animationProgress.normalizeToOne(minValue: startProgress, maxValue: endProgress)
            cardView.learnMoreButton.layer.opacity = Float(1 - normalized)
            cardView.otherInSeriesButton.layer.opacity = Float(1 - normalized)
            let buttonTransform = CGAffineTransform(translationX: 200 * normalized, y: 0)
            cardView.learnMoreButton.transform = buttonTransform
            cardView.otherInSeriesButton.transform = buttonTransform
        } else if isAfterAnimation {
            hideButtons()
        }
    }

    private func animateLabelsRightSwipe() {
        let startProgress: CGFloat = -0.16
        let endProgress: CGFloat = -0.89
        let isAfterAnimation = animationProgress < endProgress
        let isBeforeAnimation = animationProgress > startProgress
        if animationProgress <= startProgress && animationProgress > endProgress {
            let normalized = abs(animationProgress).normalizeToOne(minValue: abs(startProgress),
                                                                   maxValue: abs(endProgress))
            cardView.titleLabel.layer.opacity = Float(1 - normalized)
            cardView.subtitleLabel.layer.opacity = Float(1 - normalized)
            let labelsTransform = CGAffineTransform(translationX: -150 * normalized, y: 0)
            cardView.titleLabel.transform = labelsTransform
            cardView.subtitleLabel.transform = labelsTransform
        } else if isAfterAnimation {
            hideLabels()
        } else if isBeforeAnimation {
            showLabels()
        }
    }

    private func animateLabelsLeftSwipe() {
        let startProgress: CGFloat = 0.1
        let endProgress: CGFloat = 0.36
        let isBeforeAnimation = animationProgress > 0 && animationProgress < startProgress
        let isAfterAnimation = animationProgress > endProgress
        if animationProgress > startProgress && animationProgress < endProgress {
            let normalized = animationProgress.normalizeToOne(minValue: startProgress, maxValue: endProgress)
            cardView.titleLabel.layer.opacity = Float(1 - normalized)
            cardView.subtitleLabel.layer.opacity = Float(1 - normalized)
            let labelsTransform = CGAffineTransform(translationX: 150 * normalized, y: 0)
            cardView.titleLabel.transform = labelsTransform
            cardView.subtitleLabel.transform = labelsTransform
        } else if isAfterAnimation {
            hideLabels()
        } else if isBeforeAnimation {
            showLabels()
        }
    }

    private func animateCard() {
        var transform = CGAffineTransform.identity
        if animationProgress > 0.5 && animationProgress < 1 {
            transform = CGAffineTransform(translationX: (1 - abs(animationProgress)) * 70, y: 0)
        } else if animationProgress > 0 && animationProgress < 0.5 {
            transform = CGAffineTransform(translationX: animationProgress * 70, y: 0)
        }
        cardView.contentView.transform = transform
    }

    private func showLabels() {
        cardView.titleLabel.layer.opacity = 1
        cardView.subtitleLabel.layer.opacity = 1
        cardView.titleLabel.transform = CGAffineTransform.identity
        cardView.subtitleLabel.transform = CGAffineTransform.identity
    }

    private func hideLabels() {
        cardView.titleLabel.layer.opacity = 0
        cardView.subtitleLabel.layer.opacity = 0
    }

    private func hideButtons() {
        cardView.learnMoreButton.layer.opacity = 0
        cardView.otherInSeriesButton.layer.opacity = 0
    }

}
