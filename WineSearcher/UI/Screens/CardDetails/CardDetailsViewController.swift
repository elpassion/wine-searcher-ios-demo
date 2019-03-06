import UIKit

class CardDetailsViewController: UIViewController {

    init(inputs: CardDetailsInputs,
         winesConfigurator: CardDetailsWinesConfiguring = CardDetailsWinesConfigurator()) {
        self.inputs = inputs
        self.winesConfigurator = winesConfigurator
        super.init(nibName: nil, bundle: nil)
    }

    var cardDetailsView: CardDetailsView! {
        return view as? CardDetailsView
    }

    override func loadView() {
        view = CardDetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupWines()
        setupAction()
    }

    // MARK: - Private

    private let inputs: CardDetailsInputs
    private let winesConfigurator: CardDetailsWinesConfiguring

    private func setupView() {
        cardDetailsView.headerView.topImageView.image = inputs.topImage
        cardDetailsView.headerView.topTitleLabel.text = inputs.title
        cardDetailsView.headerView.topSubtitleLabel.attributedText = inputs.subtitle
    }

    private func setupWines() {
        let wines = CardDetailsWineViewModel.wines
        let action: (CardDetailsWineViewModel) -> Void = { [weak self] in self?.presentWineDetails(inputs: $0.inputs) }
        winesConfigurator.configure(wines: wines,
                                    stackView: cardDetailsView.winesView.contentStackView,
                                    action: action)
    }

    private func setupAction() {
        cardDetailsView.headerView.navControl.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
    }

    @objc
    func dismissSelf() {
        self.dismiss(animated: true)
    }

    private func presentWineDetails(inputs: WineDetailsInputs) {

    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

extension CardDetailsWineViewModel {

    var inputs: WineDetailsInputs {
        return WineDetailsInputs(wineImage: wineImage, wineName: title)
    }

}
