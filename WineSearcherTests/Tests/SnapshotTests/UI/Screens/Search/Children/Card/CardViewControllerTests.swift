@testable import WineSearcher
import FBSnapshotTestCase

class CardViewControllerTests: FBSnapshotTestCase {

    var sut: CardViewController!

    override func setUp() {
        super.setUp()

        fileNameOptions = [.device, .OS, .screenSize]
        recordMode = SnapshotsConfiguration.recordMode

        sut = .snapshotFixture
        sut.view.frame = UIScreen.main.bounds
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
    }

    func testCardViewControllerMatchesSnapshot() {
        FBSnapshotVerifyView(sut.view)
    }

}
