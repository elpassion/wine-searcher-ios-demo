import UIKit

protocol CardDetailsWinesConfiguring {
    func configure(wines: [CardDetailsWineViewModel],
                   stackView: UIStackView,
                   action: ((CardDetailsWineViewModel) -> Void)?)
}
