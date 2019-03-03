import UIKit

protocol CardsViewControlling {
    var firstItemRect: CGRect? { get }
    var currentViewController: (UIViewController & CardViewControlling)? { get }
}
