import UIKit

class CardsViewController: UIViewController {

    init(dataSource: CardsDataSource = CardsDataSource()) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }

    var cardsView: CardsView! {
        return view as? CardsView
    }

    override func loadView() {
        view = CardsView()
    }

    // MARK: - Private

    private let dataSource: CardsDataSource

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
