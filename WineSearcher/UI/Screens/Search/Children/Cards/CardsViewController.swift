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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
    }

    // MARK: - Private

    private let dataSource: CardsDataSource

    private func setupDataSource() {
        let viewControllers = dataSource.items.map(CardViewController.init)
        viewControllers.forEach {
            embed($0) { cardsView.contentStackView.addArrangedSubview($0) }
            $0.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                $0.view.widthAnchor.constraint(equalToConstant: cardSize.width),
                $0.view.heightAnchor.constraint(equalToConstant: cardSize.height)
            ])
        }
    }

    private let cardSize = CGSize(width: 325, height: 520)

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
