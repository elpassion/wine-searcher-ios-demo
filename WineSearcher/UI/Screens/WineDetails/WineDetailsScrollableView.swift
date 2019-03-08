import UIKit

class WineDetailsScrollableView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let scrollView = Subviews.scrollView
    let contentView = UIView(frame: .zero)
    let tableImageView = UIImageView(image: #imageLiteral(resourceName: "wine_table"))
    let aboutWineLabel = Subviews.aboutWineLabel
    let aboutWineDescriptionLabel = Subviews.aboutWineDescriptionLabel
    let wineSpecyficationImageView = UIImageView(image: #imageLiteral(resourceName: "wine_specification"))

    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(tableImageView)
        contentView.addSubview(aboutWineLabel)
        contentView.addSubview(aboutWineDescriptionLabel)
        contentView.addSubview(wineSpecyficationImageView)
    }

    // MARK: - Layout

    private func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        tableImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            tableImageView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 20),
            tableImageView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20),
            tableImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        aboutWineLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutWineLabel.topAnchor.constraint(equalTo: tableImageView.bottomAnchor, constant: 19),
            aboutWineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            aboutWineLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20)
        ])

        aboutWineDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutWineDescriptionLabel.topAnchor.constraint(equalTo: aboutWineLabel.bottomAnchor, constant: 8),
            aboutWineDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            aboutWineDescriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor,
                                                                constant: -20)
        ])

        wineSpecyficationImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wineSpecyficationImageView.topAnchor.constraint(equalTo: aboutWineDescriptionLabel.bottomAnchor,
                                                            constant: 17),
            wineSpecyficationImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            wineSpecyficationImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,
                                                               constant: -19),
            wineSpecyficationImageView.heightAnchor.constraint(equalToConstant: 103)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

private extension WineDetailsScrollableView {

    struct Subviews {
        static var scrollView: UIScrollView {
            let scrollView = UIScrollView(frame: .zero)
            scrollView.showsVerticalScrollIndicator = false
            return scrollView
        }

        static var aboutWineLabel: UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont(font: .nocturneSerifBold, size: 16)
            label.text = "About this wine"
            return label
        }

        static var aboutWineDescriptionLabel: UILabel {
            let label = UILabel(frame: .zero)
            label.numberOfLines = 0
            label.attributedText = aboutWineDescription
            return label
        }

        // MARK: - Private

        private static var aboutWineDescription: NSAttributedString {
            let text = "Brilliant ruby red.  Lovely fragrances of ripe fruit and menthol hints invade the nose. " +
            "Round, pleasant, nice freshness on the mouth.  Easy to drink."
            return NSAttributedString(string: text, attributes: aboutWineDescriptionAttributes)
        }

        private static var aboutWineDescriptionAttributes: [NSAttributedString.Key: Any] {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            return [
                .font: UIFont(font: .montserratLight, size: 12),
                .paragraphStyle: paragraphStyle,
                .foregroundColor: UIColor(hex: "A7A7A7") as Any
            ]
        }
    }

}
