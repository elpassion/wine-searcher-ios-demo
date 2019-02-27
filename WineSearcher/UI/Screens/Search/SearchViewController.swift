import UIKit

class SearchViewController: UIViewController {

    init(cardsViewControllerFactory: CardsViewControllerFactoryProtocol = CardsViewControllerFactory(),
         viewControllerPresnter: ViewControllerPresenting = ViewControllerPresenter(),
         cardsDataSource: CardsDataSourceProtocol = CardsDataSource(),
         cardDetailsFactory: @escaping () -> UIViewController = { CardDetailsViewController() }) {
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

    // MARK: - Private

    private let cardsViewController: UIViewController
    private let viewControllerPresnter: ViewControllerPresenting
    private let cardsDataSource: CardsDataSourceProtocol
    private let cardDetailsFactory: () -> UIViewController

    private func embedChildViewControllers() {
        embed(cardsViewController, in: searchView.cardsView)
    }

    private func setupActions() {
        cardsDataSource.items.forEach {
            $0.cardTapAction = { [weak self] in
                self?.presentCardDetailsViewController()
            }
        }
    }

    private func presentCardDetailsViewController() {
        let viewController = cardDetailsFactory()
        viewControllerPresnter.present(viewController: viewController, on: self)
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
