import UIKit

protocol CardsViewControlling: class {
    var cardTapped: ((CardView, CardDetailsInputs) -> Void)? { get set }
}
