import UIKit

extension SearchViewController {

    var titleLabelFrame: CGRect {
        guard let cardView = cardsViewController.currentViewController?.view as? CardView else { return .zero }
        let titleLabel = cardView.titleLabel
        return titleLabel.superview?.convert(titleLabel.frame, to: view) ?? .zero
    }

    var subtitleLabelFrame: CGRect {
        guard let cardView = cardsViewController.currentViewController?.view as? CardView else { return .zero }
        let subtitleLabel = cardView.subtitleLabel
        return subtitleLabel.superview?.convert(subtitleLabel.frame, to: view) ?? .zero
    }

    var firstCardFrame: CGRect {
        guard let cardView = cardsViewController.currentViewController?.view as? CardView else { return .zero }
        return cardView.convert(cardsViewController.firstItemRect ?? .zero, to: view)
    }

    var topNavIconFrame: CGRect {
        let navImageView = searchView.headerView.navImageView
        return navImageView.superview?.convert(navImageView.frame, to: view) ?? .zero
    }

    var navTitleLabelFrame: CGRect {
        let navTitleLabel = searchView.headerView.titleLabel
        return navTitleLabel.superview?.convert(navTitleLabel.frame, to: view) ?? .zero
    }

}
