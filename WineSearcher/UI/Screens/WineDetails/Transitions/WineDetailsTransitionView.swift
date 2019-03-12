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

    let wineCardTitleLabel = UIView.wineCardTitleLabel
    let wineCardSubtitleLabel = UIView.wineCardSubtitleLabel
    let wineCardImageView = UIView.wineImageView
    let wineBackgroundView = UIView.wineBackgroundView
    let ratingImageView = UIImageView(image: #imageLiteral(resourceName: "rating"))
    let flagImageView = UIImageView(image: #imageLiteral(resourceName: "flag_icon"))
    let wineDetailsDescriptionTitleLabel = UIView.wineDetailsDescriptionTitleLabel
    let wineDetailsDescriptionSubtitleLabel = UIView.wineDetailsDescriptionSubtitleLabel
    let wineDetailsScrollableView = WineDetailsScrollableView()

    private func addSubviews() {
        addSubview(wineBackgroundView)
        addSubview(wineCardSubtitleLabel)
        addSubview(wineCardTitleLabel)
        addSubview(wineCardImageView)
        addSubview(ratingImageView)
        addSubview(flagImageView)
        addSubview(wineDetailsDescriptionTitleLabel)
        addSubview(wineDetailsDescriptionSubtitleLabel)
        addSubview(wineDetailsScrollableView)
    }

}
