import UIKit

class CardDetailsPresentTransitionView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .green
        addSubviews()
    }

    let titleLabel = UILabel.cardTitleLabel
    let subtitleLabel = UILabel.multilineLabel
    let firstCardView = CardParalaxView()
    let fromTopIconView = UIImageView(image: #imageLiteral(resourceName: "nav_image"))
    let toTopIconView = UIImageView(image: #imageLiteral(resourceName: "black_arrow"))
    let fromNavTopTitleLabel = UILabel.navTitleLable(title: "Learn Wine")
    let toNavTopTitleLabel = UILabel.navTitleLable(title: "Europe, Italy")
    let ratingImageView = UIImageView(image: #imageLiteral(resourceName: "rating"))
    let flagImageView = UIImageView(image: #imageLiteral(resourceName: "card_details_icon"))
    let separator = UIView.coloredView(color: .white)
    let bottomSection = SearchBottomSectionView()
    let learnMoreButton = UIButton.learnMoreButton
    let otherInSeriesButton = UIButton.otherInSeriesButton
    let regionOverviewView = CardDetailsRegionOverviewView()

    // MARK: - Subviews

    private func addSubviews() {
        addSubview(firstCardView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(fromTopIconView)
        addSubview(toTopIconView)
        addSubview(fromNavTopTitleLabel)
        addSubview(toNavTopTitleLabel)
        addSubview(ratingImageView)
        addSubview(flagImageView)
        addSubview(separator)
        addSubview(bottomSection)
        addSubview(learnMoreButton)
        addSubview(otherInSeriesButton)
        addSubview(regionOverviewView)
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
