import UIKit

extension SearchViewController {

    var topNavIconFrame: CGRect {
        let navImageView = searchView.headerView.navImageView
        return navImageView.superview?.convert(navImageView.frame, to: view) ?? .zero
    }

    var navTitleLabelFrame: CGRect {
        let navTitleLabel = searchView.headerView.titleLabel
        return navTitleLabel.superview?.convert(navTitleLabel.frame, to: view) ?? .zero
    }

    var bottomSectionFrame: CGRect {
        let bottomSection = searchView.bottomSection
        return bottomSection.superview?.convert(bottomSection.frame, to: view) ?? .zero
    }

}
