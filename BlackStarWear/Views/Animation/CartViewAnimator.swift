import UIKit


class CartViewAnimator {
    
    static private let duration = 0.4
    
    static func animate(_ view:UIView, completion: ( () -> Void )? = nil  ) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: duration,
            delay: 0,
            options: .curveLinear,
            animations: { view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)},
            completion: { if $0 == .end {
                UIViewPropertyAnimator.runningPropertyAnimator(
                    withDuration: duration,
                    delay: 0,
                    options: .curveLinear,
                    animations: { view.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)},
                    completion: { if $0 == .end {
                        UIViewPropertyAnimator.runningPropertyAnimator(
                            withDuration: duration,
                            delay: 0,
                            options: .curveLinear,
                            animations: {view.transform = .identity },
                            completion: { if $0 == .end { completion?()}})
                    }})
            }})
    }
    
}
