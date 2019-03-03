import UIKit

class CardsViewControllerFactory: CardsViewControllerFactoryProtocol {

    func viewController(dataSource: CardsDataSourceProtocol) -> CardsViewController {
        return CardsViewController(dataSource: dataSource)
    }

}
