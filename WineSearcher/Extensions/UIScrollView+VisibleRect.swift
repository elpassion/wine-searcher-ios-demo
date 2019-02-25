import UIKit

extension UIScrollView {

    var visibleRect: CGRect {
        return CGRect(x: contentOffset.x, y: contentOffset.y, width: visibleSize.width, height: visibleSize.height)
    }

}
