@testable import WineSearcher
import UIKit

class CardsViewControllerStub: UIViewController, CardsViewControlling {

    // MARK: - CardsViewControlling

    var firstItemRect: CGRect? {
        return nil
    }

    var currentViewController: (UIViewController & CardViewControlling)? {
        return nil
    }

}
