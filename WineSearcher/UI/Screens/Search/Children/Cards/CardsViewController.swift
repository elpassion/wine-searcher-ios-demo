import UIKit

class CardsViewController: UIViewController, UIScrollViewDelegate {

    init(dataSource: CardsDataSourceProtocol = CardsDataSource(),
         sizesProvider: CardsSizesProviding = CardsSizesProvider()) {
        self.dataSource = dataSource
        self.sizesProvider = sizesProvider
        super.init(nibName: nil, bundle: nil)
    }

    var cardsView: CardsView! {
        return view as? CardsView
    }

    override func loadView() {
        view = CardsView(insets: sizesProvider.insets)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cardsView.scrollView.delegate = self
        setupDataSource()
        setupHeight()
    }

    private func setupHeight() {
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: sizesProvider.cardSize.height)
        ])
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let targetContentOffsetCetner = scrollView.transformToCenter(offset: targetContentOffset.pointee.x)
        guard let nearestPageCenter = viewsCenters.nearest(value: targetContentOffsetCetner) else { return }
        let targetOffset = nearestPageCenter - sizesProvider.spacing - sizesProvider.cardSize.width / 2
        targetContentOffset.pointee.x = targetOffset
    }

    // MARK: - Private

    private let dataSource: CardsDataSourceProtocol
    private let sizesProvider: CardsSizesProviding

    private lazy var viewControllers: [CardViewController] = {
        dataSource.items.map(CardViewController.init)
    }()

    private var viewsCenters: [CGFloat] {
        return viewControllers.map { $0.view.center.x + sizesProvider.spacing }
    }

    private func setupDataSource() {
        viewControllers.forEach {
            embed($0) { cardsView.contentStackView.addArrangedSubview($0) }
            $0.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                $0.view.widthAnchor.constraint(equalToConstant: sizesProvider.cardSize.width),
                $0.view.heightAnchor.constraint(equalToConstant: sizesProvider.cardSize.height)
            ])
        }
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
