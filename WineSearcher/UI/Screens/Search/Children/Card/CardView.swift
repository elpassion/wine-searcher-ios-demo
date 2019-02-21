import UIKit

class CardView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let contentView = Factory.contentView
    let backgroundImageView = Factory.backgroundImageView
    let learnMoreButton = Factory.learnMoreButton
    let otherInSeriesButton = Factory.otherInSeriesButton
    let titleLabel = Factory.titleLabel
    let subtitleLabel = Factory.subtitleLabel

    private func addSubviews() {
        addSubview(contentView)
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(learnMoreButton)
        contentView.addSubview(otherInSeriesButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
    }

    // MARK: - Layout

    private func setupLayout() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])

        learnMoreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            learnMoreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            learnMoreButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 14),
            learnMoreButton.widthAnchor.constraint(equalToConstant: 109),
            learnMoreButton.heightAnchor.constraint(equalToConstant: 40)
        ])

        otherInSeriesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            otherInSeriesButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            otherInSeriesButton.leftAnchor.constraint(equalTo: learnMoreButton.rightAnchor, constant: 8),
            otherInSeriesButton.widthAnchor.constraint(equalToConstant: 124),
            otherInSeriesButton.heightAnchor.constraint(equalToConstant: 40)
        ])

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -22),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            titleLabel.rightAnchor.constraint(lessThanOrEqualTo: contentView.rightAnchor, constant: -15)
        ])

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.bottomAnchor.constraint(equalTo: learnMoreButton.topAnchor, constant: -15),
            subtitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            subtitleLabel.rightAnchor.constraint(lessThanOrEqualTo: contentView.rightAnchor, constant: -15)
        ])
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

        static var titleLabel: UILabel {
            let label = UILabel(frame: .zero)
            label.textColor = .white
            label.font = UIFont(font: Font.nocturnSerifExtraBold, size: 30)
            label.numberOfLines = 0
            return label
        }

        static var subtitleLabel: UILabel {
            let label = UILabel(frame: .zero)
            label.numberOfLines = 0
            return label
        }

        static var contentView: UIView {
            let view = UIView(frame: .zero)
            view.clipsToBounds = true
            view.layer.cornerRadius = 16
            return view
        }
    }

}
