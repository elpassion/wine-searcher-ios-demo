import UIKit

class Animator {

    typealias AnimationClosure = (_ localProgress: CGFloat) -> Void

    init(startProgress: CGFloat, endProgress: CGFloat, animation: @escaping AnimationClosure) {
        self.startProgress = startProgress
        self.endProgress = endProgress
        self.animation = animation
    }

    func animate(progress: CGFloat) {
        let range = startProgress > endProgress ? (endProgress..<startProgress) : (startProgress..<endProgress)
        guard range.contains(progress) else { return }
        let minimum = range.lowerBound
        let maxmium = range.upperBound
        let normalized = (progress - minimum) / (maxmium - minimum)
        var localProgress: CGFloat = 0
        switch progress {
        case 0:
            localProgress = 0
        case 0...1:
            localProgress = normalized
        case -1...0:
            localProgress = 1 - normalized
        default:
            break
        }
        animation(localProgress)
    }

    private let startProgress: CGFloat
    private let endProgress: CGFloat
    private let animation: AnimationClosure

}
