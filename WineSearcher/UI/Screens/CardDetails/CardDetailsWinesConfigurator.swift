import UIKit

class CardDetailsWinesConfigurator: CardDetailsWinesConfiguring {

    // MARK: - CardDetailsWineConfiguring

    func configure(wines: [CardDetailsWineViewModel],
                   stackView: UIStackView,
                   action: ((CardDetailsWineViewModel) -> Void)?) {
        wines.forEach { wine in
            let view = CardDetailsWineView()
            view.wineImageView.image = wine.wineImage
            view.titleLabel.text = wine.title
            view.subtitleLabel.text = wine.subtitle
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 140)
            ])

            view.touchUpInsideAction = {
                action?(wine)
            }

            stackView.addArrangedSubview(view)
        }
    }

}
