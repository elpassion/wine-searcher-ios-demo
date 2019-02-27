import UIKit

protocol CardsViewControllerFactoryProtocol {
    func viewController(dataSource: CardsDataSourceProtocol) -> UIViewController
}
