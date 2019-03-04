import UIKit

extension CardDetailsWineViewModel {

    static var wines: [CardDetailsWineViewModel] {
        return [
            .chiantiBaroneRicasoli,
            .magdalenaTosso,
            .rieslingErsteNeue
        ]
    }

    // MARK: - Private

    private static var chiantiBaroneRicasoli: CardDetailsWineViewModel {
        return CardDetailsWineViewModel(wineImage: #imageLiteral(resourceName: "wine_1"), title: "Chianti Barone Ricasoli", subtitle: "BARONE RICASOLI")
    }

    private static var magdalenaTosso: CardDetailsWineViewModel {
        return CardDetailsWineViewModel(wineImage: #imageLiteral(resourceName: "wine_2"), title: "Magdalena Tosso", subtitle: "BARONE RICASOLI")
    }

    private static var rieslingErsteNeue: CardDetailsWineViewModel {
        return CardDetailsWineViewModel(wineImage: #imageLiteral(resourceName: "wine_2"), title: "Riesling Erste + Neue", subtitle: "SUDITROL-ALTO ADIGE")
    }

}
