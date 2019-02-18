@testable import WineSearcher
import FBSnapshotTestCase

class SearchViewControllerTests: FBSnapshotTestCase {

    var sut: SearchViewController!

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

    func testSearchViewControllerMatchesSnapshot() {
        FBSnapshotVerifyView(sut.view)
    }

}
