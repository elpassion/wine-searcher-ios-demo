@testable import WineSearcher

extension CardViewController {

    static var snapshotFixture: CardViewController {
        return CardViewController(viewModel: .firstCard)
    }

}
