import UIKit

class CardView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let contentView = CardParalaxView()
    let learnMoreButton = UIButton.searchLearnMoreButton
    let otherInSeriesButton = UIButton.searchOtherInSeriesButton
    let titleLabel = UILabel.searchCardTitleLabel
    let subtitleLabel = UILabel.multilineLabel

    private func addSubviews() {
        addSubview(contentView)
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

private extension CardView {

    struct Factory {
        static var backgroundImageView: UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .scaleAspectFit
            return imageView
        }

        static var contentView: UIControl {
            let control = UIControl(frame: .zero)
            control.clipsToBounds = true
            control.layer.cornerRadius = 16
            return control
        }
    }

}
