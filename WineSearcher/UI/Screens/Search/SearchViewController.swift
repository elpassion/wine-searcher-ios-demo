import UIKit

class SearchViewController: UIViewController {

    init(cardsViewController: UIViewController = CardsViewController()) {
        self.cardsViewController = cardsViewController
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
    }

    // MARK: - Private

    private let cardsViewController: UIViewController

    private func embedChildViewControllers() {
        embed(cardsViewController, in: searchView.cardsView)
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
