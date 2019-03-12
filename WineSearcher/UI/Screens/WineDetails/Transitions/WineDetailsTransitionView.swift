import UIKit

class WineDetailsTransitionView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: - Subviews

    let cardDetailsTitleLabel = UIView.wineCardTitleLabel
    let cardDetailsSubtitleLabel = UIView.wineCardSubtitleLabel
    let cardDetailsWineImageView = UIView.wineImageView
    let cardDetailsWineBackgroundView = UIView.wineBackgroundView
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

}
