import UIKit

protocol ScreenSizeProviding {
    var bounds: CGRect { get }
}

extension UIScreen: ScreenSizeProviding {}
