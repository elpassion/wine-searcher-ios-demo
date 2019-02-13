@testable import WineSearcher

class CardsDataSourceStub: CardsDataSourceProtocol {

    // MARK: - CardsDataSourceProtocol

    var items: [CardViewModel] {
        return [
            CardViewModel(backgroundImage: #imageLiteral(resourceName: "tusc")),
            CardViewModel(backgroundImage: #imageLiteral(resourceName: "wines")),
            CardViewModel(backgroundImage: #imageLiteral(resourceName: "tusc"))
        ]
    }

}
