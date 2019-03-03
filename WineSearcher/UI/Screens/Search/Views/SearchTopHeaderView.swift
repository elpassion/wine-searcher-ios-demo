import UIKit

class SearchTopHeaderView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let titleLabel = UILabel.navTitleLable(title: "Learn Wine")
    let navImageView = UIImageView(image: #imageLiteral(resourceName: "nav_image"))

    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(navImageView)
    }

    // MARK: - Layout

    private func setupLayout() {
        navImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navImageView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 0),
            navImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            navImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 0),
            navImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: navImageView.trailingAnchor, constant: 24),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

extension UIView {

    static func navTitleLable(title: String) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = title
        label.font = UIFont(font: .tungstenMedium, size: 20)
        return label
    }

}
