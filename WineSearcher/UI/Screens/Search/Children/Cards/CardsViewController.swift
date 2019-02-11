import UIKit

class CardsViewController: UIViewController, UIScrollViewDelegate {

    init(dataSource: CardsDataSource = CardsDataSource(),
         configuration: CardsConfiguration = CardsConfiguration()) {
        self.dataSource = dataSource
        self.configuration = configuration
        super.init(nibName: nil, bundle: nil)
    }

    var cardsView: CardsView! {
        return view as? CardsView
    }

    override func loadView() {
        view = CardsView(horizontalInset: configuration.horizontalInset)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cardsView.scrollView.delegate = self
        setupDataSource()
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let targetContentOffsetCetner = scrollView.transformToCenter(offset: targetContentOffset.pointee.x)
        guard let nearestPageCenter = viewsCenters.nearest(value: targetContentOffsetCetner) else { return }
        let targetOffset = nearestPageCenter - configuration.horizontalInset - configuration.size.width / 2
        targetContentOffset.pointee.x = targetOffset

    }

    // MARK: - Private

    private let dataSource: CardsDataSource
    private let configuration: CardsConfiguration

    private lazy var viewControllers: [CardViewController] = {
        dataSource.items.map(CardViewController.init)
    }()

    private var viewsCenters: [CGFloat] {
        return viewControllers.map { $0.view.center.x + configuration.horizontalInset }
    }

    private func setupDataSource() {
        viewControllers.forEach {
            embed($0) { cardsView.contentStackView.addArrangedSubview($0) }
            $0.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                $0.view.widthAnchor.constraint(equalToConstant: configuration.size.width),
                $0.view.heightAnchor.constraint(equalToConstant: configuration.size.height)
            ])
        }
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
