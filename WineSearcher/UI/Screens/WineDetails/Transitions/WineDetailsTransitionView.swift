import UIKit

class WineDetailsTransitionView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
    }

    // MARK: - Subviews

    let cardDetailsTitleLabel = UILabel.cardDetailsWineCardTitleLabel
    let cardDetailsSubtitleLabel = UILabel.cardDetailsWineCardSubtitleLabel
    let cardDetailsWineImageView = UIImageView.cardDetailsWineImageView
    let cardDetailsWineBackgroundView = UIView.cardDetailsWineBackgroundView
    let wineDetailsRatingImageView = UIImageView(image: #imageLiteral(resourceName: "rating"))
    let wineDetailsFlagImageView = UIImageView(image: #imageLiteral(resourceName: "flag_icon"))
    let wineDetailsDescriptionTitleLabel = UILabel.wineDetailsDescriptionTitleLabel
    let wineDetailsDescriptionSubtitleLabel = UILabel.wineDetailsDescriptionSubtitleLabel
    let wineDetailsScrollableView = WineDetailsScrollableView()

    private func addSubviews() {
        addSubview(cardDetailsWineBackgroundView)
        addSubview(cardDetailsWineImageView)
        addSubview(cardDetailsSubtitleLabel)
        addSubview(cardDetailsTitleLabel)
        addSubview(cardDetailsSubtitleLabel)
        addSubview(wineDetailsRatingImageView)
        addSubview(wineDetailsFlagImageView)
        addSubview(wineDetailsDescriptionTitleLabel)
        addSubview(wineDetailsDescriptionSubtitleLabel)
        addSubview(wineDetailsScrollableView)
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
