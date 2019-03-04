import UIKit

extension UIViewPropertyAnimator {

    static func defaultAnimator(duration: TimeInterval) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator(duration: duration, timingParameters: defaultTimingParameters)
    }

    // MARK: - Private

    private static var defaultTimingParameters: UICubicTimingParameters {
        return UICubicTimingParameters(controlPoint1: CGPoint(x: 0.25, y: 0.1), controlPoint2: CGPoint(x: 0.25, y: 1))
    }

}
