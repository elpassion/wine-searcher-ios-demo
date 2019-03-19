import UIKit

extension UIView {

    static func navTitleLable(title: String) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = title
        label.font = UIFont(font: .tungstenMedium, size: 20)
        return label
    }

}
