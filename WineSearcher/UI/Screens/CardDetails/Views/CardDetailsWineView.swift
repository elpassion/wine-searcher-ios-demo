import UIKit

class CardDetailsWineView: Control {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let wineImageView = UIImageView.cardDetailsWineImageView
    let titleLabel = UILabel.cardDetailsWineCardTitleLabel
    let subtitleLabel = UILabel.cardDetailsWineCardSubtitleLabel
    let backgroundView = UIView.cardDetailsWineBackgroundView

    private func addSubviews() {
        addSubview(backgroundView)
        addSubview(wineImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }

    // MARK: - Layout

    private func setupLayout() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        wineImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wineImageView.topAnchor.constraint(equalTo: topAnchor),
            wineImageView.heightAnchor.constraint(equalToConstant: 138),
            wineImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: wineImageView.bottomAnchor, constant: 13),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 10),
            subtitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -10),
            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
