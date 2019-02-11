import UIKit

struct CardsConfiguration {
    let size: CGSize
    let horizontalInset: CGFloat
    let spacing: CGFloat

    init(size: CGSize = CGSize(width: 325, height: 520),
         horizontalInset: CGFloat = 15,
         spacing: CGFloat = 15) {
        self.size = size
        self.horizontalInset = horizontalInset
        self.spacing = spacing
    }

}
