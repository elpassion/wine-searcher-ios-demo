import UIKit

class CardDetailsWineView: Control {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let wineImageView = UIView.wineImageView
    let titleLabel = UIView.wineCardTitleLabel
    let subtitleLabel = UIView.wineCardSubtitleLabel
    let backgroundView = UIView.wineBackgroundView

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

extension UIView {

    static var wineImageView: UIImageView {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    static var wineBackgroundView: UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.isUserInteractionEnabled = false
        let shadow = SketchShadow(color: UIColor(hex: "422B0A")?.withAlphaComponent(0.05),
                                  x: 0,
                                  y: 12,
                                  blur: 32,
                                  spread: 0)
        view.layer.apply(shadow)
        return view
    }

    static var wineCardTitleLabel: UILabel {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont(font: .nocturneSerifBold, size: 14)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        return titleLabel
    }

    static var wineCardSubtitleLabel: UILabel {
        let subtitleLabel = UILabel(frame: .zero)
        subtitleLabel.font = UIFont(font: .tungstenMedium, size: 14)
        subtitleLabel.textColor = UIColor(hex: "B7B7B7")
        return subtitleLabel
    }

}
