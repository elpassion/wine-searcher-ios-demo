import UIKit

extension UILabel {

    static var searchCardTitleLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.font = UIFont(font: Font.nocturnSerifExtraBold, size: 30)
        label.numberOfLines = 0
        return label
    }

}
