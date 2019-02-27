@testable import WineSearcher

extension SearchViewController {

    static var snapshotFixture: SearchViewController {
        let cardsViewControllerFactorySpy = CardsViewControllerFactorySpy()
        cardsViewControllerFactorySpy.viewControllerResult = CardsViewController.snapshotFixture
        return SearchViewController(
            cardsViewControllerFactory: cardsViewControllerFactorySpy,
            viewControllerPresnter: ViewControllerPresnterSpy(),
            cardsDataSource: CardsDataSourceStub()
        )
    }

}
