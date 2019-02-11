@testable import WineSearcher

extension CardsViewController {

    static var snapshotFixture: CardsViewController {
        return CardsViewController(
            dataSource: .snapshotFixture,
            configuration: CardsConfiguration()
        )
    }

}
