import UIKit

extension CardView {

    func cardFrame(in view: UIView) -> CGRect {
        return self.superview?.convert(self.frame, to: view) ?? .zero
    }

    func titleLabelFrame(in view: UIView) -> CGRect {
        return titleLabel.superview?.convert(titleLabel.frame, to: view) ?? .zero
    }

    func subtitleLabelFrame(in view: UIView) -> CGRect {
        return subtitleLabel.superview?.convert(subtitleLabel.frame, to: view) ?? .zero
    }

    func learnMoreButtonFrame(in view: UIView) -> CGRect {
        return learnMoreButton.superview?.convert(learnMoreButton.frame, to: view) ?? .zero
    }

    func otherInSeriesButtonFrame(in view: UIView) -> CGRect {
        return otherInSeriesButton.superview?.convert(otherInSeriesButton.frame, to: view) ?? .zero
    }

}
