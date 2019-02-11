import UIKit

extension UIScrollView {

    func transformToCenter(offset: CGFloat) -> CGFloat {
        return offset + frame.width / 2
    }

}
