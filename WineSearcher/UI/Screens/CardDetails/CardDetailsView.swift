import UIKit

class CardDetailsView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(hex: "FFFDFA")
        addSubviews()
        setupLayout()
    }

    // MARK: - Subviews

    let scrollView = Subviews.scrollView
    let contentView = UIView(frame: .zero)
    let headerView = CardDetailsHeaderView()
    let flagImageView = UIImageView(image: #imageLiteral(resourceName: "card_details_icon"))
    let regionOverviewView = CardDetailsRegionOverviewView()
    let winesView = CardDetailsWinesView()

    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerView)
        contentView.addSubview(flagImageView)
        contentView.addSubview(regionOverviewView)
        contentView.addSubview(winesView)
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

        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(greaterThanOrEqualTo: scrollView.widthAnchor)
        ])

        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            headerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 350)
        ])

        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            flagImageView.centerYAnchor.constraint(equalTo: headerView.bottomAnchor),
            flagImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19)
        ])

        regionOverviewView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            regionOverviewView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 26),
            regionOverviewView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            regionOverviewView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])

        winesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            winesView.topAnchor.constraint(lessThanOrEqualTo: regionOverviewView.bottomAnchor, constant: 24.5),
            winesView.leadingAnchor.constraint(equalTo: leadingAnchor),
            winesView.trailingAnchor.constraint(equalTo: trailingAnchor),
            winesView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

private extension CardDetailsView {

    struct Subviews {
        static var scrollView: UIScrollView {
            let scrollView = UIScrollView(frame: .zero)
            scrollView.showsVerticalScrollIndicator = false
            return scrollView
        }
    }

}
