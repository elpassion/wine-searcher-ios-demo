@testable import WineSearcher

class CardsDataSourceStub: CardsDataSourceProtocol {

    // MARK: - CardsDataSourceProtocol

    let items: [CardViewModel] = [.firstCard, .secondCard, .firstCard]

}
