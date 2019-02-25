@testable import WineSearcher
import FBSnapshotTestCase

class CardsViewControllerTests: FBSnapshotTestCase {

    var sut: CardsViewController!
    var sizesProvider: CardsSizesProviding!

    override func setUp() {
        super.setUp()

        agnosticOptions = [.device, .OS, .screenSize]
        recordMode = SnapshotsConfiguration.recordMode

        sizesProvider = CardsSizesProvider()
        sut = CardsViewController(
            dataSource: CardsDataSource.snapshotFixture,
            sizesProvider: sizesProvider
        )
        sut.view.frame = UIScreen.main.bounds
    }

    override func tearDown() {
        super.tearDown()

        sizesProvider = nil
        sut = nil
    }

    func testCardsViewControllerMatchesSnapshot() {
        FBSnapshotVerifyView(sut.view)
    }

}
