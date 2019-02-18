import UIKit

extension UIFont {

    convenience init(font: Font, size: CGFloat = UIFont.systemFontSize) {
        self.init(name: font.rawValue, size: size)! // swiftlint:disable:this force_unwrapping
    }

}
