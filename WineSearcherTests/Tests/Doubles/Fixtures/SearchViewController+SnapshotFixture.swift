@testable import WineSearcher

extension SearchViewController {

    static var snapshotFixture: SearchViewController {
        return SearchViewController(cardsViewController: CardsViewController.snapshotFixture)
    }

}
