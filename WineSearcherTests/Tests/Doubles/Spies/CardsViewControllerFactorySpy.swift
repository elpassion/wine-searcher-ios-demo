@testable import WineSearcher
import UIKit

class CardsViewControllerFactorySpy: CardsViewControllerFactoryProtocol {

    var viewControllerStub: UIViewController & CardsViewControlling = CardsViewControllerStub()
    private(set) var caughtDataSource: CardsDataSourceProtocol?

    // MARK: - CardsViewControllerFactoryProtocol

    func viewController(dataSource: CardsDataSourceProtocol) -> UIViewController & CardsViewControlling {
        caughtDataSource = dataSource

        return viewControllerStub
    }

}
