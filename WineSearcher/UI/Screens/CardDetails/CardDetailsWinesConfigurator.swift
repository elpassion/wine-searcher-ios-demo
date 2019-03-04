import UIKit

class CardDetailsWinesConfigurator: CardDetailsWinesConfiguring {

    // MARK: - CardDetailsWineConfiguring

    func configure(wines: [CardDetailsWineViewModel], stackView: UIStackView) {
        wines.forEach {
            let view = CardDetailsWineView()
            view.wineImageView.image = $0.wineImage
            view.titleLabel.text = $0.title
            view.subtitleLabel.text = $0.subtitle
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 140)
            ])
            stackView.addArrangedSubview(view)
        }
    }

}
