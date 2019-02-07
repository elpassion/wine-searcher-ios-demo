import UIKit

class CardViewController: UIViewController {

    init(viewModel: CardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    var cardView: CardView! {
        return view as? CardView
    }

    override func loadView() {
        view = CardView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private

    private let viewModel: CardViewModel

    private func setupView() {
        cardView.backgroundImageView.image = viewModel.backgroundImage
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
