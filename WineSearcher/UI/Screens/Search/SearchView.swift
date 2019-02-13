import UIKit

class SearchView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let cardsView = UIView(frame: .zero)

    private func addSubviews() {
        addSubview(cardsView)
    }

    // MARK: - Layout

    private func setupLayout() {
        cardsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardsView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            cardsView.leftAnchor.constraint(equalTo: leftAnchor),
            cardsView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
