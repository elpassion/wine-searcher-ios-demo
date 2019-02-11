import UIKit

extension Sequence where Iterator.Element == CGFloat {

    func nearest(value: Element) -> Element? {
        let maxNearestElement = sorted().first { $0 >= value } ?? self.max()
        let minNearestElement = sorted().last { $0 <= value } ?? self.min()
        guard let max = maxNearestElement, let min = minNearestElement else { return nil }
        let maxDiff = max - value
        let minDiff = value - min
        return maxDiff < minDiff ? max : min
    }

}
