import UIKit

extension WineDetailsViewController {

    var wineImageViewFrame: CGRect {
        let wineImageView = wineDetailsView.wineImageView
        return wineImageView.superview?.convert(wineImageView.frame, to: view) ?? .zero
    }

    var ratingImageViewFrame: CGRect {
        let ratingImageView = wineDetailsView.ratingImageView
        return ratingImageView.superview?.convert(ratingImageView.frame, to: view) ?? .zero
    }

    var flagImageViewFrame: CGRect {
        let flagImageView = wineDetailsView.flagImageView
        return flagImageView.superview?.convert(flagImageView.frame, to: view) ?? .zero
    }

    var titleLabelFrame: CGRect {
        let titleLabel = wineDetailsView.wineDetailsDescriptionView.titleLabel
        return titleLabel.superview?.convert(titleLabel.frame, to: view) ?? .zero
    }

    var subtitleLabelFrame: CGRect {
        let subtitleLabel = wineDetailsView.wineDetailsDescriptionView.subtitleLabel
        return subtitleLabel.superview?.convert(subtitleLabel.frame, to: view) ?? .zero
    }

    var scrollableViewFrame: CGRect {
        let scrollableView = wineDetailsView.wineDetailsDescriptionView.wineDetailsScrollableView
        return scrollableView.superview?.convert(scrollableView.frame, to: view) ?? .zero
    }

}
