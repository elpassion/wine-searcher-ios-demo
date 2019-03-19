import UIKit

class CardDetailsTransitionView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(hex: "FFFDFA")
        addSubviews()
    }

    let titleLabel = UILabel.searchCardTitleLabel
    let subtitleLabel = UILabel.multilineLabel
    let cardView = CardParalaxView()
    let searchTopNavIconView = UIImageView(image: #imageLiteral(resourceName: "nav_image"))
    let detailsTopNavIconView = UIImageView(image: #imageLiteral(resourceName: "black_arrow"))
    let searchTopNavTitleLabel = UILabel.navTitleLable(title: "Learn Wine")
    let detailsTopNavTitleLabel = UILabel.navTitleLable(title: "Europe, Italy")
    let ratingImageView = UIImageView(image: #imageLiteral(resourceName: "rating"))
    let flagImageView = UIImageView(image: #imageLiteral(resourceName: "card_details_icon"))
    let separator = UIView.coloredView(color: .white)
    let bottomSection = SearchBottomSectionView()
    let learnMoreButton = UIButton.searchLearnMoreButton
    let otherInSeriesButton = UIButton.searchOtherInSeriesButton
    let regionOverviewView = CardDetailsRegionOverviewView()
    let winesView = CardDetailsWinesView()

    // MARK: - Subviews

    private func addSubviews() {
        addSubview(cardView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(searchTopNavIconView)
        addSubview(detailsTopNavIconView)
        addSubview(searchTopNavTitleLabel)
        addSubview(detailsTopNavTitleLabel)
        addSubview(ratingImageView)
        addSubview(flagImageView)
        addSubview(separator)
        addSubview(bottomSection)
        addSubview(learnMoreButton)
        addSubview(otherInSeriesButton)
        addSubview(regionOverviewView)
        addSubview(winesView)
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
