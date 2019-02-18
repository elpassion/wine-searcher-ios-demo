import UIKit

class CardsDataSource: CardsDataSourceProtocol {

    // MARK: - CardsDataSourceProtocol

    var items: [CardViewModel] {
        return [.firstCard, .secondCard, .firstCard]
    }

}
