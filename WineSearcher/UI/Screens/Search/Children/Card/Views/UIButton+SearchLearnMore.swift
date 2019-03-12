import UIKit

extension UIButton {

    static var searchLearnMoreButton: UIButton {
        let button = UIButton(frame: .zero)
        button.setTitle("LEARN MORE", for: .normal)
        button.titleLabel?.font = UIFont(font: .tungstenSemiBold, size: 14)
        button.backgroundColor = UIColor(hex: "D0B58A")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        return button
    }

}
