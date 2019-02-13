@testable import WineSearcher
import UIKit

extension CardsConfiguration {

    static func testData(cardsAspectRatio: CGFloat = 1,
                         cardWdithRatio: CGFloat = 1,
                         spacing: CGFloat = 0) -> CardsConfiguration {
        return CardsConfiguration(cardAspectRatio: cardsAspectRatio,
                                  cardWidthRatio: cardWdithRatio,
                                  spacing: spacing)
    }

}
