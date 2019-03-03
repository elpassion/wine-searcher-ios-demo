import UIKit

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
