import UIKit

class CardDetailsHeaderView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let topImageView = Subviews.imageView
    let topTitleLabel = UILabel.searchCardTitleLabel
    let topSubtitleLabel = UILabel.multilineLabel
    let navControl = UIControl(frame: .zero)
    let navIconImageView = UIImageView(image: #imageLiteral(resourceName: "black_arrow"))
    let topNavLabel = UILabel.navTitleLable(title: "Europe, Italy")
    let ratingImageView = UIImageView(image: #imageLiteral(resourceName: "rating"))
    let separator = UIView.coloredView(color: .white)

    private func addSubviews() {
        addSubview(topImageView)
        addSubview(topTitleLabel)
        addSubview(topSubtitleLabel)
        addSubview(navControl)
        navControl.addSubview(navIconImageView)
        addSubview(topNavLabel)
        addSubview(ratingImageView)
        addSubview(separator)
    }

    // MARK: - Layout

    private func setupLayout() {
        setupNavControlLayout()

        topImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: topAnchor),
            topImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            topImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
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

        topNavLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topNavLabel.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            topNavLabel.leadingAnchor.constraint(equalTo: navControl.trailingAnchor, constant: 24),
            topNavLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 0),
            topNavLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            topNavLabel.centerYAnchor.constraint(equalTo: navControl.centerYAnchor)
        ])

        ratingImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ratingImageView.topAnchor.constraint(equalTo: navControl.bottomAnchor, constant: 26)
        ])

        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 2),
            separator.widthAnchor.constraint(equalToConstant: 30),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            separator.bottomAnchor.constraint(equalTo: topTitleLabel.topAnchor, constant: -11)
        ])
    }

    private func setupNavControlLayout() {
        navControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11),
            navControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])

        navIconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navIconImageView.topAnchor.constraint(equalTo: navControl.topAnchor),
            navIconImageView.leadingAnchor.constraint(equalTo: navControl.leadingAnchor),
            navIconImageView.trailingAnchor.constraint(equalTo: navControl.trailingAnchor),
            navIconImageView.bottomAnchor.constraint(equalTo: navControl.bottomAnchor)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

private extension CardDetailsHeaderView {

    struct Subviews {
        static var imageView: UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            return imageView
        }
    }

}
