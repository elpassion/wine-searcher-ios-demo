import UIKit

class CardsViewControllerFactory: CardsViewControllerFactoryProtocol {

    // MARK: - CardsViewControllerFactoryProtocol

    func viewController(dataSource: CardsDataSourceProtocol) -> UIViewController & CardsViewControlling {
        return CardsViewController(dataSource: dataSource)
    }

}
