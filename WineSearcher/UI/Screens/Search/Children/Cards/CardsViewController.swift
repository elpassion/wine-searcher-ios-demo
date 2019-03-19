import UIKit

class CardsViewController: UIViewController, UIScrollViewDelegate, CardsViewControlling {

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
        view = CardsView(insets: sizesProvider.insets, spacing: sizesProvider.spacing)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cardsView.scrollView.delegate = self
        setupDataSource()
        setupHeight()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cardsView.contentStackView.layoutSubviews()
        updateChildViewContrllersAnimationProgress()
    }

    // MARK: - CardsViewControlling

    var cardTapped: ((CardView, CardDetailsInputs) -> Void)?

    // MARK: - UIScrollViewDelegate

    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let nearestPage = pagesOffsets.nearest(value: targetContentOffset.pointee.x) else { return }
        targetContentOffset.pointee.x = nearestPage
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateChildViewContrllersAnimationProgress()
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updateChildViewContrllersAnimationProgress()
    }

    // MARK: - Private

    private let dataSource: CardsDataSourceProtocol
    private let sizesProvider: CardsSizesProviding

    private lazy var viewControllers: [CardViewController] = {
        dataSource.items.map { cardViewController(for: $0) }
    }()

    private func cardViewController(for viewModel: CardViewModel) -> CardViewController {
        let viewController = CardViewController(viewModel: viewModel)
        viewController.cardTapped = { [weak self] in
            self?.cardTapped?(viewController.cardView, viewModel.cardDetailsInput)
        }
        return viewController
    }

    private var pagesOffsets: [CGFloat] {
        return viewControllers.map { $0.view.frame.minX }
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

    private func setupHeight() {
        NSLayoutConstraint.activate([view.heightAnchor.constraint(equalToConstant: sizesProvider.cardSize.height)])
    }

    private func updateChildViewContrllersAnimationProgress() {
        viewControllers.forEach {
            let minPoint = CGPoint(x: $0.view.frame.minX + sizesProvider.insets.left, y: 0)
            let maxPoint = CGPoint(x: $0.view.frame.maxX + sizesProvider.insets.left, y: 0)
            let scrollView = cardsView.scrollView
            guard scrollView.visibleRect.contains(minPoint) || scrollView.visibleRect.contains(maxPoint) else { return }
            let offset = minPoint.x - scrollView.contentOffset.x - sizesProvider.spacing
            let animationProgress = offset / (sizesProvider.cardSize.width + sizesProvider.spacing)
            if (-1...1).contains(animationProgress) {
                $0.animationProgress = animationProgress
            } else if animationProgress > 1 {
                $0.animationProgress = 1
            } else if animationProgress < -1 {
                $0.animationProgress = 0
            }
        }
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

private extension CardViewModel {

    var cardDetailsInput: CardDetailsInputs {
        return CardDetailsInputs(title: title, subtitle: subtitle, topImage: backgroundImage)
    }

}
