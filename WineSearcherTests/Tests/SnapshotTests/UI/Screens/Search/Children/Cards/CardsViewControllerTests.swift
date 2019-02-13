@testable import WineSearcher
import FBSnapshotTestCase

class CardsViewControllerTests: FBSnapshotTestCase {

    var sut: CardsViewController!
    var sizesProvider: CardsSizesProviding!

    override func setUp() {
        super.setUp()

        recordMode = SnapshotsConfiguration.recordMode

        sizesProvider = CardsSizesProvider()
        sut = CardsViewController(
            dataSource: CardsDataSource.snapshotFixture,
            sizesProvider: sizesProvider
        )
        sut.view.frame = UIScreen.main.bounds
        sut.view.layoutSubviews()
        sut.cardsView.contentStackView.layoutSubviews()
    }

    override func tearDown() {
        super.tearDown()

        sizesProvider = nil
        sut = nil
    }

    func testCardsViewControllerMatchesSnapshot() {
        FBSnapshotVerifyView(sut.view)
    }

    func testCardsViewControllerNextPageMatchesSnapshot() {
        var targetPoint = CGPoint(x: sizesProvider.cardSize.width, y: 0)
        sut.scrollViewWillEndDragging(sut.cardsView.scrollView,
                                      withVelocity: CGPoint(x: 0, y: 0),
                                      targetContentOffset: &targetPoint)
        sut.cardsView.scrollView.contentOffset = targetPoint

        FBSnapshotVerifyView(sut.view)
    }

}
