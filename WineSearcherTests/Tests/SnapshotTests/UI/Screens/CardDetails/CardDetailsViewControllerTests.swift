@testable import WineSearcher
import UIKit
import FBSnapshotTestCase

class CardDetailsViewControllerTests: FBSnapshotTestCase {

    var sut: CardDetailsViewController!

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

    func testCardDetailsViewControllerMatchesSnapshot() {
        FBSnapshotVerifyView(sut.view)
    }

}
