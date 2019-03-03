extension CardViewModel {

    var cardDetailsPresnetTransitionInputs: CardDetailsPresentTransitionInputs {
        return CardDetailsPresentTransitionInputs(cardImage: backgroundImage, cardTitle: title, cardSubtitle: subtitle)
    }

}
