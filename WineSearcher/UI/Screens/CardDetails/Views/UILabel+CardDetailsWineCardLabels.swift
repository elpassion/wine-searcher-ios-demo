import UIKit

extension UILabel {

    static var cardDetailsWineCardTitleLabel: UILabel {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont(font: .nocturneSerifBold, size: 14)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        return titleLabel
    }

    static var cardDetailsWineCardSubtitleLabel: UILabel {
        let subtitleLabel = UILabel(frame: .zero)
        subtitleLabel.font = UIFont(font: .tungstenMedium, size: 14)
        subtitleLabel.textColor = UIColor(hex: "B7B7B7")
        return subtitleLabel
    }

}
