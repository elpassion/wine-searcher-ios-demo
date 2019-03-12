import UIKit

class WineDetailsDescriptionView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let titleLabel = UILabel.wineDetailsDescriptionTitleLabel
    let subtitleLabel = UILabel.wineDetailsDescriptionSubtitleLabel
    let wineDetailsScrollableView = WineDetailsScrollableView()

    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(wineDetailsScrollableView)
    }

    // MARK: - Layout

    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        wineDetailsScrollableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wineDetailsScrollableView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 14),
            wineDetailsScrollableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            wineDetailsScrollableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            wineDetailsScrollableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
