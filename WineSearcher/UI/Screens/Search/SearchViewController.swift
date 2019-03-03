import UIKit

class CardDetailsPresentTransitionView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .green
        addSubviews()
    }

    let titleLabel = UILabel.cardTitleLabel
    let subtitleLabel = UILabel.multilineLabel
    let firstCardView = CardParalaxView()
    let fromTopIconView = UIImageView(image: #imageLiteral(resourceName: "nav_image"))
    let toTopIconView = UIImageView(image: #imageLiteral(resourceName: "black_arrow"))
    let fromNavTopTitleLabel = UILabel.navTitleLable(title: "Learn Wine")
    let toNavTopTitleLabel = UILabel.navTitleLable(title: "Europe, Italy")
    let ratingImageView = UIImageView(image: #imageLiteral(resourceName: "rating"))
    let cardDetailsIconImageView = UIImageView(image: #imageLiteral(resourceName: "card_details_icon"))
    let separator = UIView.coloredView(color: .white)

    // MARK: - Subviews

    private func addSubviews() {
        addSubview(firstCardView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(fromTopIconView)
        addSubview(toTopIconView)
        addSubview(fromNavTopTitleLabel)
        addSubview(toNavTopTitleLabel)
        addSubview(ratingImageView)
        addSubview(cardDetailsIconImageView)
        addSubview(separator)
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

struct CardDetailsPresentTransitionInputs {
    let cardImage: UIImage
    let cardTitle: String
    let cardSubtitle: NSAttributedString
}

class CardDetailsPresentTransition: NSObject, UIViewControllerAnimatedTransitioning {

    init(inputs: CardDetailsPresentTransitionInputs) {
        self.inputs = inputs
    }

    let duration = 10.0

    private let inputs: CardDetailsPresentTransitionInputs

    // MARK: - UIViewControllerAnimatedTransitioning

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let toViewController = transitionContext.viewController(forKey: .to) as? CardDetailsViewController,
            let fromViewController = transitionContext.viewController(forKey: .from) as? SearchViewController else {
                transitionContext.completeTransition(true)
                return
        }

        containerView.addSubview(toViewController.view)
        toViewController.view.frame = fromViewController.view.frame
        toViewController.view.layoutSubviews()

        guard let transitionView = createTransitionView(toViewController: toViewController,
                                                        fromViewController: fromViewController) else {
            transitionContext.completeTransition(true)
            return
        }

        containerView.addSubview(transitionView)
        transitionView.frame = fromViewController.view.frame

        let animators = [
            cardAnimator(transitionView: transitionView),
            titleAnimator(transitionView: transitionView, toViewController: toViewController),
            subtitleAnimator(transitionView: transitionView, toViewController: toViewController),
            topIconChangeAnimator(transitionView: transitionView, toViewController: toViewController),
            topTitleAnimator(transitionView: transitionView),
            ratingImageAnimation(transitionView: transitionView),
            cardDetailsIconAnimator(transitionView: transitionView),
            separatorAnimator(transitionView: transitionView)
        ]

        animators.forEach { $0.startAnimation() }

        animators.first?.addCompletion { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            transitionView.removeFromSuperview()
        }
    }

    private func cardAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, dampingRatio: 0.75) {
            let cardView = transitionView.firstCardView
            cardView.frame = CGRect(x: 0, y: 0, width: transitionView.frame.width, height: 350)
            cardView.layer.cornerRadius = 0
            cardView.layoutIfNeeded()
            transitionView.firstCardView.backgroundImageView.contentMode = .scaleAspectFit
        }
    }

    private func titleAnimator(transitionView: CardDetailsPresentTransitionView,
                               toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, curve: .easeOut) { [unowned self] in
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                    transitionView.titleLabel.frame = toViewController.cardDetailsView.topTitleLabel.frame
                }
            }
        }
    }

    private func subtitleAnimator(transitionView: CardDetailsPresentTransitionView,
                                  toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, curve: .easeInOut) { [unowned self] in
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.7) {
                    transitionView.subtitleLabel.frame = toViewController.cardDetailsView.topSubtitleLabel.frame
                }
            }
        }
    }

    private func topIconChangeAnimator(transitionView: CardDetailsPresentTransitionView,
                                       toViewController: CardDetailsViewController) -> UIViewPropertyAnimator {
        transitionView.toTopIconView.alpha = 0
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.toTopIconView.alpha = 1
                    transitionView.fromTopIconView.center.x -= 50
                }
            }
        }
    }

    private func topTitleAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        transitionView.toNavTopTitleLabel.alpha = 0
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.toNavTopTitleLabel.alpha = 1
                    transitionView.fromNavTopTitleLabel.alpha = 0
                }
            }
        }
    }

    private func ratingImageAnimation(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        let movment: CGFloat = 50
        transitionView.ratingImageView.alpha = 0
        transitionView.ratingImageView.center.y -= movment
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.ratingImageView.alpha = 1
                    transitionView.ratingImageView.center.y += movment
                }
            }
        }
    }

    private func cardDetailsIconAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        transitionView.cardDetailsIconImageView.alpha = 0
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.cardDetailsIconImageView.alpha = 1
                }
            }
        }
    }

    private func separatorAnimator(transitionView: CardDetailsPresentTransitionView) -> UIViewPropertyAnimator {
        transitionView.separator.alpha = 0
        return UIViewPropertyAnimator(duration: duration, curve: .linear) {
            UIView.keyframeAnimation(duration: self.duration) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    transitionView.separator.alpha = 1
                }
            }
        }
    }

    private func createTransitionView(toViewController: CardDetailsViewController,
                                      fromViewController: SearchViewController) -> CardDetailsPresentTransitionView? {
        let transitionView = CardDetailsPresentTransitionView()
        guard let firstCardRect = fromViewController.cardsViewController.firstItemRect,
            let card = fromViewController.cardsViewController.currentViewController?.cardView else { return nil }
        transitionView.firstCardView.backgroundImageView.image = inputs.cardImage
        transitionView.firstCardView.frame = card.convert(firstCardRect, to: fromViewController.view)
        transitionView.firstCardView.layoutIfNeeded()

        transitionView.titleLabel.text = inputs.cardTitle
        transitionView.titleLabel.frame = card.convert(card.titleLabel.frame, to: fromViewController.view)

        transitionView.subtitleLabel.attributedText = inputs.cardSubtitle
        transitionView.subtitleLabel.frame = card.convert(card.subtitleLabel.frame, to: fromViewController.view)

        let topFromIconImageView = fromViewController.searchView.headerView.navImageView
        let topToIconImageView = toViewController.cardDetailsView.topIconImageView
        let topFromIconPosition = fromViewController.searchView.headerView.convert(topFromIconImageView.frame,
                                                                                   to: toViewController.view)
        let topToIconPosition = toViewController.cardDetailsView.convert(topToIconImageView.frame,
                                                                         to: toViewController.view)
        transitionView.fromTopIconView.frame = topFromIconPosition
        transitionView.toTopIconView.frame = topToIconPosition

        let fromNavTitleLabel = fromViewController.searchView.headerView.titleLabel
        let toNavTitleLabel = toViewController.cardDetailsView.topNavLabel
        let fromNavTitleLabelPosition = fromViewController.searchView.headerView.convert(fromNavTitleLabel.frame,
                                                                                         to: fromViewController.view)
        let toNavTitleLabelPosition = toViewController.cardDetailsView.convert(toNavTitleLabel.frame,
                                                                               to: toViewController.view)
        transitionView.fromNavTopTitleLabel.frame = fromNavTitleLabelPosition
        transitionView.toNavTopTitleLabel.frame = toNavTitleLabelPosition

        transitionView.ratingImageView.frame = toViewController.cardDetailsView.ratingImageView.frame

        transitionView.cardDetailsIconImageView.frame = toViewController.cardDetailsView.cardDetailsIconImageView.frame

        transitionView.separator.frame = toViewController.cardDetailsView.separator.frame

        return transitionView
    }

}

class SearchViewController: UIViewController, UIViewControllerTransitioningDelegate {

    var cardDetailsPresentTransition: CardDetailsPresentTransition?

    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let transition = cardDetailsPresentTransition else { return nil }
        return transition
    }

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

    let cardsViewController: CardsViewController

    // MARK: - Private

    private let viewControllerPresnter: ViewControllerPresenting
    private let cardsDataSource: CardsDataSourceProtocol
    private let cardDetailsFactory: CardDetailsViewControllerFactoryProtocol

    private func embedChildViewControllers() {
        embed(cardsViewController, in: searchView.cardsView)
    }

    private func setupActions() {
        cardsDataSource.items.enumerated().forEach { index, card in
            let inputs = card.cardDetailsPresnetTransitionInputs(items: cardsDataSource.items, index: index)
            card.cardTapAction = { [weak self] in
                self?.cardDetailsPresentTransition = CardDetailsPresentTransition(inputs: inputs)
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

extension CardsViewController {

    var firstItemRect: CGRect? {
        return cardsView.contentStackView.arrangedSubviews.first?.frame
    }

}

extension Collection {

    subscript(safe index: Index) -> Element? {
         return indices.contains(index) ? self[index] : nil
    }

}

extension CardViewModel {

    func cardDetailsPresnetTransitionInputs(items: [CardViewModel], index: Int) -> CardDetailsPresentTransitionInputs {
        return CardDetailsPresentTransitionInputs(cardImage: backgroundImage,
                                                  cardTitle: title,
                                                  cardSubtitle: subtitle)
    }

    var cardDetailsInput: CardDetailsViewControllerInputs {
        return CardDetailsViewControllerInputs(title: title, subtitle: subtitle, topImage: backgroundImage)
    }

}

extension UIView {

    static func keyframeAnimation(duration: TimeInterval, animations: @escaping () -> Void) {
        animateKeyframes(withDuration: duration, delay: 0, animations: animations)
    }

}
