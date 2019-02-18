@testable import WineSearcher
import FBSnapshotTestCase

class ViewControllerTests: FBSnapshotTestCase {

    var sut: UIViewController!

    override func setUp() {
        super.setUp()

        agnosticOptions = [.device, .OS, .screenSize]
        recordMode = SnapshotsConfiguration.recordMode

        sut = UIViewController()
        sut.view.backgroundColor = .red
        sut.view.frame = UIScreen.main.bounds
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
    }

    func testViewControllerMatchesSnapshot() {
        FBSnapshotVerifyView(sut.view)
    }

}
