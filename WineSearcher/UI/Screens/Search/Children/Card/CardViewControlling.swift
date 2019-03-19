import UIKit

protocol CardViewControlling: class {
    var animationProgress: CGFloat { get set }
    var cardTapped: (() -> Void)? { get set }
}
