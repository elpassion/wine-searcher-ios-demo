@testable import WineSearcher

extension SearchViewController {

    static var snapshotFixture: SearchViewController {
        let cardsViewControllerFactorySpy = CardsViewControllerFactorySpy()
        cardsViewControllerFactorySpy.viewControllerStub = CardsViewController.snapshotFixture
        return SearchViewController(
            cardsViewControllerFactory: cardsViewControllerFactorySpy,
            viewControllerPresnter: ViewControllerPresnterSpy(),
            cardsDataSource: CardsDataSourceStub()
        )
    }

}
