import UIKit

class CardView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
        setupAppearance()
    }

    // MARK: - Subviews

    let backgroundImageView = Factory.backgroundImageView
    let learnMoreButton = Factory.learnMoreButton
    let otherInSeriesButton = Factory.otherInSeriesButton

    private func addSubviews() {
        addSubview(backgroundImageView)
        addSubview(learnMoreButton)
        addSubview(otherInSeriesButton)
    }

    // MARK: - Layout

    private func setupLayout() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        learnMoreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            learnMoreButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            learnMoreButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 14),
            learnMoreButton.widthAnchor.constraint(equalToConstant: 109),
            learnMoreButton.heightAnchor.constraint(equalToConstant: 40)
        ])

        otherInSeriesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            otherInSeriesButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            otherInSeriesButton.leftAnchor.constraint(equalTo: learnMoreButton.rightAnchor, constant: 8),
            otherInSeriesButton.widthAnchor.constraint(equalToConstant: 124),
            otherInSeriesButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    // MARK: - Appearance

    private func setupAppearance() {
        clipsToBounds = true
        layer.cornerRadius = 16
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

extension CardView {

    struct Factory {
        static var backgroundImageView: UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .scaleAspectFill
            return imageView
        }

        static var learnMoreButton: UIButton {
            let button = UIButton(frame: .zero)
            button.setTitle("LEARN MORE", for: .normal)
            button.titleLabel?.font = UIFont(font: .tungstenSemiBold, size: 14)
            button.backgroundColor = UIColor(hex: "D0B58A")
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 4
            return button
        }

        static var otherInSeriesButton: UIButton {
            let button = UIButton(frame: .zero)
            button.setTitle("OTHER IN SERIES", for: .normal)
            button.titleLabel?.font = UIFont(font: .tungstenSemiBold, size: 14)
            button.backgroundColor = .clear
            button.layer.cornerRadius = 4
            button.layer.borderColor = UIColor(hex: "D0B58A")?.cgColor
            button.layer.borderWidth = 2
            return button
        }
    }

}
