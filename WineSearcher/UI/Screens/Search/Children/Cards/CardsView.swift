import UIKit

class CardsView: UIView {

    init(insets: UIEdgeInsets, spacing: CGFloat) {
        self.insets = insets
        contentStackView = Factory.stackView(spacing: spacing)

        super.init(frame: .zero)
        backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    let insets: UIEdgeInsets

    // MARK: - Subviews

    let scrollView = Factory.scrollView
    let contentStackView: UIStackView

    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentStackView)
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

        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: insets.left),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -insets.right),
            contentStackView.widthAnchor.constraint(greaterThanOrEqualTo: scrollView.widthAnchor)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

extension CardsView {

    enum Factory {
        static var scrollView: UIScrollView {
            let scrollView = UIScrollView(frame: .zero)
            scrollView.showsHorizontalScrollIndicator = false
            return scrollView
        }

        static func stackView(spacing: CGFloat) -> UIStackView {
            let stackView = UIStackView(frame: .zero)
            stackView.axis = .horizontal
            stackView.spacing = spacing
            stackView.distribution = .equalSpacing
            return stackView
        }
    }

}
