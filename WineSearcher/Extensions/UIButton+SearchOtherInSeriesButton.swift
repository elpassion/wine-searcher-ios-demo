import UIKit

extension UIButton {

    static var searchOtherInSeriesButton: UIButton {
        let button = UIButton(frame: .zero)
        button.setTitle("OTHER IN SERIES", for: .normal)
        button.titleLabel?.font = UIFont(font: .tungstenSemiBold, size: 14)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 4
        button.layer.borderColor = UIColor(hex: "D0B58A")?.cgColor
        button.layer.borderWidth = 2
        return button
    }

}
