@testable import WineSearcher
import FBSnapshotTestCase

class WineDetailsViewControllerTests: FBSnapshotTestCase {

    var sut: WineDetailsViewController!

    override func setUp() {
        super.setUp()

        agnosticOptions = [.device, .OS, .screenSize]
        recordMode = SnapshotsConfiguration.recordMode

        sut = .snapshotFixture
        sut.view.frame = UIScreen.main.bounds
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
    }

    func testWineDetailsViewControllerMatchesSnapshot() {
        FBSnapshotVerifyView(sut.view)
    }

}
