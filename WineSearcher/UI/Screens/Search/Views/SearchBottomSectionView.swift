import UIKit

class SearchBottomSectionView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let titleLabel = Subviews.titleLabel
    let stackView = Subviews.stackView

    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(firstRow)
        stackView.addArrangedSubview(secondRow)
    }

    // MARK: - Layout

    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)
        ])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    // MARK: - Layout

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

private extension SearchBottomSectionView {

    struct Subviews {
        static var stackView: UIStackView {
            let stackView = UIStackView(frame: .zero)
            stackView.alignment = .fill
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            return stackView
        }

        static var titleLabel: UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont(font: .nocturneSerifBold, size: 18)
            label.textColor = .black
            label.text = "Top wines right now"
            return label
        }
    }

}

private extension SearchBottomSectionView {

    var firstRow: SearchBottomSectionRowView {
        let title = NSMutableAttributedString(string: "")
        let titleFirstPhase = NSAttributedString(string: "Best wines under ", attributes: titleFirstPhaseAttributes)
        let titleSecondPhase = NSAttributedString(string: "$15", attributes: titleSecondPhaseAttributes )
        title.append(titleFirstPhase)
        title.append(titleSecondPhase)
        return SearchBottomSectionRowView(title: title, isArrowHidden: false)
    }

    var secondRow: SearchBottomSectionRowView {
        let title = NSMutableAttributedString(string: "")
        let titleFirstPhase = NSAttributedString(string: "Best wines for ", attributes: titleFirstPhaseAttributes)
        let titleSecondPhase = NSAttributedString(string: "Family Dinner", attributes: titleSecondPhaseAttributes )
        title.append(titleFirstPhase)
        title.append(titleSecondPhase)
        return SearchBottomSectionRowView(title: title, isArrowHidden: true)
    }

    // MARK: - Private

    private var titleFirstPhaseAttributes: [NSAttributedString.Key: Any] {
        return [
            .font: UIFont(font: .tungstenMedium, size: 16),
            .foregroundColor: UIColor(hex: "81898F") as Any
        ]
    }

    private var titleSecondPhaseAttributes: [NSAttributedString.Key: Any] {
        return [
            .font: UIFont(font: .tungstenSemiBold, size: 16),
            .foregroundColor: UIColor(hex: "030303") as Any
        ]
    }

}
