import UIKit

extension UIView {

    static var cardDetailsWineBackgroundView: UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.isUserInteractionEnabled = false
        let shadow = SketchShadow(color: UIColor(hex: "422B0A")?.withAlphaComponent(0.05),
                                  x: 0,
                                  y: 12,
                                  blur: 32,
                                  spread: 0)
        view.layer.apply(shadow)
        return view
    }

}
