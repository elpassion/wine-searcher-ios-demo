import UIKit

extension CardViewModel {

    static var firstCard: CardViewModel {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(hex: "CFB489") as Any,
            .font: UIFont(font: .tungstenMedium, size: 15)
        ]
        let subtitle = NSAttributedString(string: "WINE GUIDES SERIES", attributes: attributes)
        return CardViewModel(title: "Rose Wine 101: Food paring",
                             subtitle: subtitle,
                             backgroundImage: #imageLiteral(resourceName: "wines"))
    }

    static var secondCard: CardViewModel {
        let firstPhaseAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white as Any,
            .font: UIFont(font: .tungstenMedium, size: 15)
        ]

        let secondPhaseAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(hex: "7F7F7F") as Any,
            .font: UIFont(font: .tungstenMedium, size: 15)
        ]

        let subtitle = NSMutableAttributedString(string: "")
        let firstPhase = NSMutableAttributedString(string: "Region Overview: ", attributes: firstPhaseAttributes)
        let secondPhase = NSAttributedString(string: "It's not only about Chianti", attributes: secondPhaseAttributes)
        subtitle.append(firstPhase)
        subtitle.append(secondPhase)

        return CardViewModel(title: "Tuscany: a Pearl in the Crown",
                             subtitle: subtitle as NSAttributedString,
                             backgroundImage: #imageLiteral(resourceName: "tusc"))
    }

}
