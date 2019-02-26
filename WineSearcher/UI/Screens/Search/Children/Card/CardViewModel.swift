import UIKit

protocol CardViewModelProtocol: class {
    var title: String { get }
    var subtitle: NSAttributedString { get }
    var backgroundImage: UIImage { get }
    var cardTapAction: (() -> Void)? { get set }
}

class CardViewModel: CardViewModelProtocol {

    init(title: String, subtitle: NSAttributedString, backgroundImage: UIImage) {
        self.title = title
        self.subtitle = subtitle
        self.backgroundImage = backgroundImage
    }

    // MARK: - CardViewModelProtocol

    let title: String
    let subtitle: NSAttributedString
    let backgroundImage: UIImage
    var cardTapAction: (() -> Void)?

}
