import UIKit

extension CGFloat {

    func normalizeToOne(minValue: CGFloat, maxValue: CGFloat) -> CGFloat {
        return normalize(minValue: minValue, maxValue: maxValue, targetMin: 0, targetMax: 1)
    }

    func normalize(minValue: CGFloat, maxValue: CGFloat, targetMin: CGFloat, targetMax: CGFloat) -> CGFloat {
        return (targetMax - targetMin) * ((self - minValue) / (maxValue - minValue)) + targetMin
    }

}
