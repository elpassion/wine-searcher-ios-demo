import UIKit

class CardDetailsViewController: UIViewController, UIViewControllerTransitioningDelegate {

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

    // MARK: - UIViewControllerTransitioningDelegate

    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let view = presentedView else { return nil }
        return WineDetailsPresentTransition(tappedView: view)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let view = presentedView else { return nil }
        return WineDetailsDismissTransition(tappedView: view)
    }

    // MARK: - Private

    private let inputs: CardDetailsInputs
    private let winesConfigurator: CardDetailsWinesConfiguring
    private var presentedView: CardDetailsWineView?

    private func setupView() {
        cardDetailsView.headerView.topImageView.image = inputs.topImage
        cardDetailsView.headerView.topTitleLabel.text = inputs.title
        cardDetailsView.headerView.topSubtitleLabel.attributedText = inputs.subtitle
    }

    private func setupWines() {
        let wines = CardDetailsWineViewModel.wines
        let action: (CardDetailsWineViewModel, CardDetailsWineView) -> Void = { [weak self] viewModel, view in
            self?.presentWineDetails(inputs: viewModel.inputs, view: view)
        }
        winesConfigurator.configure(wines: wines,
                                    stackView: cardDetailsView.winesView.contentStackView,
                                    action: action)
    }

    private func setupAction() {
        cardDetailsView.headerView.navControl.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
    }

    @objc
    private func dismissSelf() {
        self.dismiss(animated: true)
    }

    private func presentWineDetails(inputs: WineDetailsInputs, view: CardDetailsWineView) {
        let viewController = WineDetailsViewController(inputs: inputs)
        presentedView = view
        viewController.transitioningDelegate = self
        present(viewController, animated: true)
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

private extension CardDetailsWineViewModel {

    var inputs: WineDetailsInputs {
        return WineDetailsInputs(wineImage: wineImage, wineName: title)
    }

}
