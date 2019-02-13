@testable import WineSearcher

extension CardsViewController {

    static var snapshotFixture: CardsViewController {
        return CardsViewController(
            dataSource: CardsDataSource.snapshotFixture,
            sizesProvider: CardsSizesProvider()
        )
    }

}
