import UIKit

extension UIView {

    static func coloredView(color: UIColor?) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = color
        return view
    }

}
