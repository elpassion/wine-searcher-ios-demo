import UIKit

class WineDetailsView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let transparentView = Subviews.transparentView
    let contentCardView = Subviews.contentCardView
    let wineImageView = Subviews.wineImageView
    let ratingImageView = UIImageView(image: #imageLiteral(resourceName: "rating"))
    let flagImageView = UIImageView(image: #imageLiteral(resourceName: "flag_icon"))
    let wineDetailsDescriptionView = WineDetailsDescriptionView()

    private func addSubviews() {
        addSubview(transparentView)
        addSubview(contentCardView)
        contentCardView.addSubview(wineImageView)
        contentCardView.addSubview(ratingImageView)
        contentCardView.addSubview(flagImageView)
        contentCardView.addSubview(wineDetailsDescriptionView)
    }

    // MARK: - Layout

    private func setupLayout() {
        transparentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            transparentView.topAnchor.constraint(equalTo: topAnchor),
            transparentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            transparentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            transparentView.bottomAnchor.constraint(equalTo: contentCardView.topAnchor)
        ])

        contentCardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentCardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentCardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentCardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentCardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.68)
        ])

        wineImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wineImageView.centerYAnchor.constraint(equalTo: contentCardView.topAnchor),
            wineImageView.leadingAnchor.constraint(greaterThanOrEqualTo: contentCardView.leadingAnchor),
            wineImageView.trailingAnchor.constraint(lessThanOrEqualTo: contentCardView.trailingAnchor),
            wineImageView.centerXAnchor.constraint(equalTo: contentCardView.centerXAnchor),
            wineImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.41)
        ])

        ratingImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingImageView.topAnchor.constraint(equalTo: contentCardView.topAnchor, constant: 32),
            ratingImageView.leadingAnchor.constraint(equalTo: contentCardView.leadingAnchor, constant: 23)
        ])

        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: contentCardView.topAnchor, constant: 33),
            flagImageView.trailingAnchor.constraint(equalTo: contentCardView.trailingAnchor, constant: -30)
        ])

        wineDetailsDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wineDetailsDescriptionView.topAnchor.constraint(equalTo: wineImageView.bottomAnchor),
            wineDetailsDescriptionView.leadingAnchor.constraint(equalTo: contentCardView.leadingAnchor),
            wineDetailsDescriptionView.trailingAnchor.constraint(equalTo: contentCardView.trailingAnchor),
            wineDetailsDescriptionView.bottomAnchor.constraint(equalTo: contentCardView.bottomAnchor)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

private extension WineDetailsView {

    struct Subviews {
        static var transparentView: Control {
            let control = Control()
            control.backgroundColor = .clear
            return control
        }

        static var contentCardView: UIView {
            let view = UIView(frame: .zero)
            view.backgroundColor = .white
            view.layer.cornerRadius = 38
            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            return view
        }

        static var wineImageView: UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .scaleAspectFit
            return imageView
        }
    }

}
