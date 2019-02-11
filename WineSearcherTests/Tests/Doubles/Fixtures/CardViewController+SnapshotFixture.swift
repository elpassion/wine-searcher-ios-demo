@testable import WineSearcher

extension CardViewController {

    static var snapshotFixture: CardViewController {
        let viewModel = CardViewModel(backgroundImage: #imageLiteral(resourceName: "wines"))
        return CardViewController(viewModel: viewModel)
    }

}
