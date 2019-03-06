import UIKit

class SearchViewController: UIViewController, UIViewControllerTransitioningDelegate {

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

    let cardsViewController: UIViewController & CardsViewControlling
    var inputs: CardDetailsInputs?

    // MARK: - UIViewControllerTransitioningDelegate

    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let inputs = self.inputs else { return nil }
        return CardDetailsPresentTransition(inputs: inputs)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let inputs = self.inputs else { return nil }
        return CardDetailsDismissTransition(inputs: inputs)
    }

    // MARK: - Private

    private let viewControllerPresnter: ViewControllerPresenting
    private let cardsDataSource: CardsDataSourceProtocol
    private let cardDetailsFactory: CardDetailsViewControllerFactoryProtocol

    private func embedChildViewControllers() {
        embed(cardsViewController, in: searchView.cardsView)
    }

    private func setupActions() {
        cardsDataSource.items.forEach { card in
            let inputs = card.cardDetailsInput
            card.cardTapAction = { [weak self] in
                self?.inputs = inputs
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
