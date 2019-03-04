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
    let contentView = UIView(frame: .zero)
    let scrollView = Subviews.scrollView
    let headerView = SearchTopHeaderView()
    let bottomSection = SearchBottomSectionView()
    let searchIconImageView = UIImageView(image: #imageLiteral(resourceName: "search_icon"))

    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerView)
        contentView.addSubview(cardsView)
        contentView.addSubview(bottomSection)
        contentView.addSubview(searchIconImageView)
    }

    // MARK: - Layout

    private func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
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
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.bottomAnchor.constraint(equalTo: cardsView.topAnchor, constant: -16),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])

        cardsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardsView.bottomAnchor.constraint(equalTo: bottomSection.topAnchor, constant: -30),
            cardsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        bottomSection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomSection.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -11)
        ])

        searchIconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -21),
            searchIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19)
        ])
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

private extension SearchView {

    struct Subviews {
        static var scrollView: UIScrollView {
            let scrollView = UIScrollView(frame: .zero)
            scrollView.showsVerticalScrollIndicator = false
            return scrollView
        }
    }

}
