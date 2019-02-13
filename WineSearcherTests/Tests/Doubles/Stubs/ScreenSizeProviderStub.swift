@testable import WineSearcher
import UIKit

class ScreenSizeProviderStub: ScreenSizeProviding {

    var boundsValue = CGRect(x: 0, y: 0, width: 100, height: 100)

    // MARK: - ScreenSizeProviding

    var bounds: CGRect {
        return boundsValue
    }

}
