import UIKit

class CardsViewControllerFactory: CardsViewControllerFactoryProtocol {

    func viewController(dataSource: CardsDataSourceProtocol) -> UIViewController {
        return CardsViewController(dataSource: dataSource)
    }

}
