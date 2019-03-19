import UIKit

class SearchViewController: UIViewController, UIViewControllerTransitioningDelegate {

    init(cardsViewControllerFactory: CardsViewControllerFactoryProtocol = CardsViewControllerFactory(),
         cardsDataSource: CardsDataSourceProtocol = CardsDataSource(),
         cardDetailsFactory: CardDetailsViewControllerFactoryProtocol = CardDetailsViewControllerFactory()) {
        self.cardsViewController = cardsViewControllerFactory.viewController(dataSource: cardsDataSource)
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
    var tappedView: CardView?

    // MARK: - UIViewControllerTransitioningDelegate

    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let cardView = tappedView else { return nil }
        return CardDetailsPresentTransition(cardView: cardView)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let cardView = tappedView else { return nil }
        return CardDetailsDismissTransition(cardView: cardView)
    }

    // MARK: - Private

    private let cardsDataSource: CardsDataSourceProtocol
    private let cardDetailsFactory: CardDetailsViewControllerFactoryProtocol

    private func embedChildViewControllers() {
        embed(cardsViewController, in: searchView.cardsView)
    }

    private func setupActions() {
        cardsViewController.cardTapped = { [weak self] view, inputs in
            self?.tappedView = view
            self?.presentCardDetailsViewController(inputs: inputs)
        }
    }

    private func presentCardDetailsViewController(inputs: CardDetailsInputs) {
        let viewController = cardDetailsFactory.viewController(inputs: inputs)
        viewController.transitioningDelegate = self
        present(viewController, animated: true)
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
