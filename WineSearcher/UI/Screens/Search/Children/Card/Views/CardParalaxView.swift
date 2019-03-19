import UIKit

class CardParalaxView: UIControl {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
        setupAppearance()
    }

    // MARK: - Subviews

    let backgroundImageView = Subviews.backgroundImageView

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

    // MARK: - Animations

    var animationProgress: CGFloat = 0 {
        didSet {
            animateBackground()
            setNeedsLayout()
        }
    }

    private var maxBackgroundParalax: CGFloat {
        return (backgroundImageView.frame.width - frame.width) * 0.35
    }

    private func animateBackground() {
        let backgroundTransform = CGAffineTransform(translationX: maxBackgroundParalax * animationProgress, y: 0)
        backgroundImageView.transform = backgroundTransform
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

private extension CardParalaxView {

    struct Subviews {
        static var backgroundImageView: UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .scaleAspectFill
            return imageView
        }
    }

}
