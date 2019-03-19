import UIKit

extension CardDetailsWineView {

    func wineCardInitialFrame(in view: UIView) -> CGRect {
        return backgroundView.superview?.convert(backgroundView.frame, to: view) ?? .zero
    }

    func wineCardTitleLabelFrame(in view: UIView) -> CGRect {
        return titleLabel.superview?.convert(titleLabel.frame, to: view) ?? .zero
    }

    func wineCardSubtitleLabelFrame(in view: UIView) -> CGRect {
        return subtitleLabel.superview?.convert(subtitleLabel.frame, to: view) ?? .zero
    }

    func wineCardImageViewFrame(in view: UIView) -> CGRect {
        return wineImageView.superview?.convert(wineImageView.frame, to: view) ?? .zero
    }

}
