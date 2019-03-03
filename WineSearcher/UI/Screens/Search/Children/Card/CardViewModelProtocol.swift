import UIKit

protocol CardViewModelProtocol: class {
    var title: String { get }
    var subtitle: NSAttributedString { get }
    var backgroundImage: UIImage { get }
    var cardTapAction: (() -> Void)? { get set }
}
