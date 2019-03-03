import UIKit

extension CardDetailsViewController {

    var topNavIconFrame: CGRect {
        let topIconImageView = cardDetailsView.headerView.topIconImageView
        return topIconImageView.superview?.convert(topIconImageView.frame, to: view) ?? .zero
    }

    var navTitleLabelFrame: CGRect {
        let navTitleLabel = cardDetailsView.headerView.topNavLabel
        return navTitleLabel.superview?.convert(navTitleLabel.frame, to: view) ?? .zero
    }

    var topTitleLabelFrame: CGRect {
        let topTitleLabel = cardDetailsView.headerView.topTitleLabel
        return topTitleLabel.superview?.convert(topTitleLabel.frame, to: view) ?? .zero
    }

    var topSubtitleLabelFrame: CGRect {
        let topSubtitleLabel = cardDetailsView.headerView.topSubtitleLabel
        return topSubtitleLabel.superview?.convert(topSubtitleLabel.frame, to: view) ?? .zero
    }

    var ratingImageViewFrame: CGRect {
        let ratingImageView = cardDetailsView.headerView.ratingImageView
        return ratingImageView.superview?.convert(ratingImageView.frame, to: view) ?? .zero
    }

    var separatorViewFrame: CGRect {
        let separator = cardDetailsView.headerView.separator
        return separator.superview?.convert(separator.frame, to: view) ?? .zero
    }

    var flagImageViewFrame: CGRect {
        let flagImageView = cardDetailsView.flagImageView
        return flagImageView.superview?.convert(flagImageView.frame, to: view) ?? .zero
    }

}
