@testable import WineSearcher

class CardsDataSourceStub: CardsDataSourceProtocol {

    // MARK: - CardsDataSourceProtocol

    var items: [CardViewModel] {
        return [
            .firstCard,
            .secondCard,
            .firstCard
        ]
    }

}
