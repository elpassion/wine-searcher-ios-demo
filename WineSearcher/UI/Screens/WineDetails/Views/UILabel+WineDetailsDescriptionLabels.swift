import UIKit

extension UILabel {

    static var wineDetailsDescriptionTitleLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.font = UIFont(font: .nocturnSerifExtraBold, size: 20)
        return label
    }

    static var wineDetailsDescriptionSubtitleLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.font = UIFont(font: .tungstenMedium, size: 16)
        label.textColor = UIColor(hex: "B7B7B7")
        label.text = "BARONE RICASOLI"
        return label
    }

}
