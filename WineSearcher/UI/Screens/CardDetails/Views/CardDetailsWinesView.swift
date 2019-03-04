import UIKit

class CardDetailsWinesView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let titleLabel = Subviews.titleLabel
    let scrollView = Subviews.scrollView
    let contentStackView = Subviews.stackView

    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(scrollView)
        scrollView.addSubview(contentStackView)
    }

    // MARK: - Layout

    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -18)
        ])

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 18),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -18),
            contentStackView.widthAnchor.constraint(greaterThanOrEqualTo: scrollView.widthAnchor),
            contentStackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

private extension CardDetailsWinesView {

    struct Subviews {
        static var titleLabel: UILabel {
            let titleLabel = UILabel(frame: .zero)
            titleLabel.font = UIFont(font: .nocturneSerifBold, size: 16)
            titleLabel.textColor = .black
            titleLabel.text = "Wines from this region"
            return titleLabel
        }

        static var scrollView: UIScrollView {
            let scrollView = UIScrollView(frame: .zero)
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.clipsToBounds = false
            return scrollView
        }

        static var stackView: UIStackView {
            let stackView = UIStackView(frame: .zero)
            stackView.axis = .horizontal
            stackView.distribution = .equalSpacing
            stackView.spacing = 12
            return stackView
        }
    }

}
