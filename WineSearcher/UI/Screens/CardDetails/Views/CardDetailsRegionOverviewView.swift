import UIKit

class CardDetailsRegionOverviewView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let titleLabel = Subviews.titleLabel
    let descriptionLabel = Subviews.descriptionLabel
    let separator = UIView.coloredView(color: UIColor(hex: "EAEAEA"))

    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(separator)
    }

    // MARK: - Layout

    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)
        ])

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 29.5),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

private extension CardDetailsRegionOverviewView {

    struct Subviews {
        static var titleLabel: UILabel {
            let titleLabel = UILabel(frame: .zero)
            titleLabel.font = UIFont(font: .nocturneSerifBold, size: 16)
            titleLabel.textColor = .black
            titleLabel.text = "Region overview"
            return titleLabel
        }

        static var descriptionLabel: UILabel {
            let titleLabel = UILabel(frame: .zero)
            titleLabel.attributedText = NSAttributedString(string: description, attributes: descriptionAttributes)
            titleLabel.numberOfLines = 0
            return titleLabel
        }

        // MARK: - Private

        private static var descriptionAttributes: [NSAttributedString.Key: Any] {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            return [
                .font: UIFont(font: .montserratLight, size: 12),
                .paragraphStyle: paragraphStyle,
                .foregroundColor: UIColor(hex: "969696") as Any
            ]
        }

        private static var description: String {
            return "Brilliant ruby red.  Lovely fragrances of ripe fruit and menthol hints invade " +
                   "the nose.  Round, pleasant, nice freshness on the mouth.  Easy to drink."
        }
    }

}
