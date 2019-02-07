import UIKit

class CardView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
        setupAppearance()
    }

    // MARK: - Subviews

    let backgroundImageView = Factory.backgroundImageView

    private func addSubviews() {
        addSubview(backgroundImageView)
    }

    // MARK: - Layout

    private func setupLayout() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    // MARK: - Appearance

    private func setupAppearance() {
        clipsToBounds = true
        layer.cornerRadius = 16
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

extension CardView {

    struct Factory {
        static var backgroundImageView: UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .scaleAspectFill
            return imageView
        }
    }

}
