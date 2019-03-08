@testable import WineSearcher

extension WineDetailsViewController {

    static var snapshotFixture: WineDetailsViewController {
        let inputs = WineDetailsInputs(wineImage: #imageLiteral(resourceName: "wine_1"), wineName: "Chianti Barone Ricasoli")
        return WineDetailsViewController(inputs: inputs)
    }

}
