@testable import WineSearcher

extension CardDetailsViewController {

    static var snapshotFixture: CardDetailsViewController {
        let inputs = CardViewModel.secondCard.cardDetailsInput
        return CardDetailsViewController(inputs: inputs)
    }

}
