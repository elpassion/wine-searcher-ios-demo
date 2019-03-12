import UIKit

extension CardDetailsWineView {

    func wineCardInitialFrame(fromView: UIView) -> CGRect {
        return backgroundView.superview?.convert(backgroundView.frame, to: fromView) ?? .zero
    }

    func wineCardTitleLabelFrame(fromView: UIView) -> CGRect {
        return titleLabel.superview?.convert(titleLabel.frame, to: fromView) ?? .zero
    }

    func wineCardSubtitleLabelFrame(fromView: UIView) -> CGRect {
        return subtitleLabel.superview?.convert(subtitleLabel.frame, to: fromView) ?? .zero
    }

    func wineCardImageViewFrame(fromView: UIView) -> CGRect {
        return wineImageView.superview?.convert(wineImageView.frame, to: fromView) ?? .zero
    }

}
