import UIKit

class CardsSizesProvider: CardsSizesProviding {

    init(configuration: CardsConfiguration = CardsConfiguration(),
         screenSizeProvider: ScreenSizeProviding = UIScreen.main) {
        self.configuration = configuration
        self.screenSizeProvider = screenSizeProvider
    }

    // MARK: - CardsSizesProviding

    var cardSize: CGSize {
        let cardWidth = screenSizeProvider.bounds.width * configuration.cardWidthRatio
        return CGSize(width: cardWidth, height: cardWidth * configuration.cardAspectRatio)
    }

    var spacing: CGFloat {
        return configuration.spacing
    }

    var insets: UIEdgeInsets {
        return UIEdgeInsets(
            top: 0,
            left: 15,
            bottom: 0,
            right: screenSizeProvider.bounds.width - spacing - cardSize.width
        )
    }

    // MARK: - Private

    private let configuration: CardsConfiguration
    private let screenSizeProvider: ScreenSizeProviding

}
