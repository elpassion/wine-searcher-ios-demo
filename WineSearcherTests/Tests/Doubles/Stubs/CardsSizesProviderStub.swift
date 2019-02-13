@testable import WineSearcher
import UIKit

class CardsSizesProviderStub: CardsSizesProviding {

    var cardSizeValue: CGSize = CGSize(width: 100, height: 100)
    var spacingValue: CGFloat = 0
    var insetsValue = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    // MARK: - CardsSizesProviding

    var cardSize: CGSize {
        return cardSizeValue
    }

    var spacing: CGFloat {
        return spacingValue
    }

    var insets: UIEdgeInsets {
        return insetsValue
    }

}
