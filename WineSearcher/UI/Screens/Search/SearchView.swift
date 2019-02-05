import UIKit

class SearchView: UIView {

    init() {
        super.init(frame: .zero)
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
            cardsView.rightAnchor.constraint(equalTo: rightAnchor),
            cardsView.heightAnchor.constraint(equalToConstant: 520)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
