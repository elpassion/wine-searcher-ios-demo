@testable import WineSearcher
import UIKit

class CardsViewControllerFactorySpy: CardsViewControllerFactoryProtocol {

    private(set) var caughtDataSource: CardsDataSourceProtocol?
    var viewControllerResult = UIViewController()

    // MARK: - CardsViewControllerFactoryProtocol

    func viewController(dataSource: CardsDataSourceProtocol) -> UIViewController {
        caughtDataSource = dataSource

        return viewControllerResult
    }

}
