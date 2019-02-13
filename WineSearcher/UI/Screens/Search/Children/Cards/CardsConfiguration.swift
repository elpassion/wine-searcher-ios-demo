import UIKit

struct CardsConfiguration {
    let cardAspectRatio: CGFloat
    let cardWidthRatio: CGFloat
    let spacing: CGFloat

    init(cardAspectRatio: CGFloat = 1.615,
         cardWidthRatio: CGFloat = 0.859,
         spacing: CGFloat = 15) {
        self.cardAspectRatio = cardAspectRatio
        self.cardWidthRatio = cardWidthRatio
        self.spacing = spacing
    }
}
