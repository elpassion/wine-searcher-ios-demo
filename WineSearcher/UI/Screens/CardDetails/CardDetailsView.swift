import UIKit

class CardDetailsView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .red
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let topImageView = Subviews.imageView
    let topTitleLabel = UILabel.cardTitleLabel
    let topSubtitleLabel = UILabel.multilineLabel
    let topIconImageView = UIImageView(image: #imageLiteral(resourceName: "black_arrow"))
    let topNavLabel = UILabel.navTitleLable(title: "Europe, Italy")
    let ratingImageView = UIImageView(image: #imageLiteral(resourceName: "rating"))
    let cardDetailsIconImageView = UIImageView(image: #imageLiteral(resourceName: "card_details_icon"))
    let separator = UIView.coloredView(color: .white)

    private func addSubviews() {
        addSubview(topImageView)
        addSubview(topTitleLabel)
        addSubview(topSubtitleLabel)
        addSubview(topIconImageView)
        addSubview(topNavLabel)
        addSubview(ratingImageView)
        addSubview(cardDetailsIconImageView)
        addSubview(separator)
    }

    // MARK: - Layout

    private func setupLayout() {
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: topAnchor),
            topImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            topImageView.heightAnchor.constraint(equalToConstant: 350)
        ])

        topSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topSubtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            topSubtitleLabel.bottomAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: -36),
            topSubtitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -15)
        ])

        topTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            topTitleLabel.bottomAnchor.constraint(equalTo: topSubtitleLabel.topAnchor, constant: -6),
            topTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -15)
        ])

        topIconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topIconImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            topIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19)
        ])

        topNavLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topNavLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 0),
            topNavLabel.leadingAnchor.constraint(equalTo: topIconImageView.trailingAnchor, constant: 24),
            topNavLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 0),
            topNavLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            topNavLabel.centerYAnchor.constraint(equalTo: topIconImageView.centerYAnchor)
        ])

        ratingImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ratingImageView.topAnchor.constraint(equalTo: topIconImageView.bottomAnchor, constant: 26)
        ])

        cardDetailsIconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardDetailsIconImageView.centerYAnchor.constraint(equalTo: topImageView.bottomAnchor),
            cardDetailsIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18)
        ])

        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 2),
            separator.widthAnchor.constraint(equalToConstant: 30),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            separator.bottomAnchor.constraint(equalTo: topTitleLabel.topAnchor, constant: -11)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

private extension CardDetailsView {

    struct Subviews {
        static var imageView: UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            return imageView
        }
    }

}
