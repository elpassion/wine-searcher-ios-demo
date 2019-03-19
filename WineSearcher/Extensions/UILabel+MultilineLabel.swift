import UIKit

extension UILabel {

    static var multilineLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        return label
    }

}
