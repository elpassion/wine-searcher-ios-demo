import UIKit

protocol CardsSizesProviding {
    var cardSize: CGSize { get }
    var spacing: CGFloat { get }
    var insets: UIEdgeInsets { get }
}
