import UIKit

class SearchBottomSectionRowView: UIView {

    init(title: NSAttributedString, isArrowHidden: Bool) {
        arrowImageView.isHidden = isArrowHidden
        titleLabel.attributedText = title
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    let titleLabel = UILabel(frame: .zero)
    let separator = Subviews.separatorView
    let arrowImageView = UIImageView(image: #imageLiteral(resourceName: "arrow-right-grey"))

    // MARK: - Subviews

    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(separator)
        addSubview(arrowImageView)
    }

    // MARK: - Layout

    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14.5),
            titleLabel.bottomAnchor.constraint(equalTo: separator.topAnchor, constant: -14.5),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: arrowImageView.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])

        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            arrowImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])

        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

private extension SearchBottomSectionRowView {

    struct Subviews {
        static var separatorView: UIView {
            let view = UIView(frame: .zero)
            view.backgroundColor = UIColor(hex: "E4E4E4")
            return view
        }
    }

}
