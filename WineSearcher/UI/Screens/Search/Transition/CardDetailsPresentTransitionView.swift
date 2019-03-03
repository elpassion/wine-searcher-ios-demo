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
    let cardDetailsIconImageView = UIImageView(image: #imageLiteral(resourceName: "card_details_icon"))
    let separator = UIView.coloredView(color: .white)

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
        addSubview(cardDetailsIconImageView)
        addSubview(separator)
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
