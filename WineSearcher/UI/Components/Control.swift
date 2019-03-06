import UIKit

class Control: UIControl {

    var touchUpInsideAction: (() -> Void)? {
        didSet {
            if touchUpInsideAction != nil {
                addTarget(self, action: #selector(tapped), for: .touchUpInside)
            } else {
                removeTarget(self, action: #selector(tapped), for: .touchUpInside)
            }
        }
    }

    // MARK: - Private

    @objc
    private func tapped() {
        touchUpInsideAction?()
    }

}
