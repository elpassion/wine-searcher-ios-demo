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
        return WineDetailsPresentTransition()
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
        let viewController = WineDetailsViewController(inputs: inputs)
        viewController.transitioningDelegate = self
        present(viewController, animated: true)
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

class WineDetailsPresentTransition: NSObject, UIViewControllerAnimatedTransitioning {

    let duration = 10.0

    // MARK: - UIViewControllerAnimatedTransitioning

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        guard let fromViewController = transitionContext.viewController(forKey: .from) as? CardDetailsViewController,
            let toViewController = transitionContext.viewController(forKey: .to) as? WineDetailsViewController else {
                transitionContext.completeTransition(true)
                return
        }

        toViewController.view.frame = transitionContext.finalFrame(for: toViewController)
        container.addSubview(toViewController.view)


        transitionContext.completeTransition(true)
    }

}
