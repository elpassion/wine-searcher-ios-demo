import UIKit

class SearchViewController: UIViewController, UIViewControllerTransitioningDelegate {

    var cardDetailsPresentTransition: CardDetailsPresentTransition?

    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let transition = cardDetailsPresentTransition else { return nil }
        return transition
    }

    init(cardsViewControllerFactory: CardsViewControllerFactoryProtocol = CardsViewControllerFactory(),
         viewControllerPresnter: ViewControllerPresenting = ViewControllerPresenter(),
         cardsDataSource: CardsDataSourceProtocol = CardsDataSource(),
         cardDetailsFactory: CardDetailsViewControllerFactoryProtocol = CardDetailsViewControllerFactory()) {
        self.cardsViewController = cardsViewControllerFactory.viewController(dataSource: cardsDataSource)
        self.viewControllerPresnter = viewControllerPresnter
        self.cardsDataSource = cardsDataSource
        self.cardDetailsFactory = cardDetailsFactory
        super.init(nibName: nil, bundle: nil)
    }

    var searchView: SearchView! {
        return view as? SearchView
    }

    override func loadView() {
        view = SearchView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        embedChildViewControllers()
        setupActions()
    }

    let cardsViewController: CardsViewController

    // MARK: - Private

    private let viewControllerPresnter: ViewControllerPresenting
    private let cardsDataSource: CardsDataSourceProtocol
    private let cardDetailsFactory: CardDetailsViewControllerFactoryProtocol

    private func embedChildViewControllers() {
        embed(cardsViewController, in: searchView.cardsView)
    }

    private func setupActions() {
        cardsDataSource.items.forEach { card in
            let inputs = card.cardDetailsPresnetTransitionInputs
            card.cardTapAction = { [weak self] in
                self?.cardDetailsPresentTransition = CardDetailsPresentTransition(inputs: inputs)
                self?.presentCardDetailsViewController(viewModel: card)
            }
        }
    }

    private func presentCardDetailsViewController(viewModel: CardViewModel) {
        let inputs = viewModel.cardDetailsInput
        let viewController = cardDetailsFactory.viewController(inputs: inputs)
        viewController.transitioningDelegate = self
        viewControllerPresnter.present(viewController: viewController, on: self)
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

extension CardsViewController {

    var firstItemRect: CGRect? {
        return cardsView.contentStackView.arrangedSubviews.first?.frame
    }

}

extension UIView {

    static func keyframeAnimation(duration: TimeInterval, animations: @escaping () -> Void) {
        animateKeyframes(withDuration: duration, delay: 0, animations: animations)
    }

}
