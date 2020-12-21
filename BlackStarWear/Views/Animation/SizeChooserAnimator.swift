import UIKit


class SizeChooserAnimator {
    
    static private let duration = 0.3
    
    static func popUp(_ view:UIView,by value:CGFloat) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: duration,
            delay: 0,
            options: .curveLinear) {
            view.frame.origin.y -= value
        } completion: { if $0 == .end {}
        }

    }
    
    static func popDown(_ view:UIView,by value:CGFloat,completion: @escaping () -> Void) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: duration,
            delay: 0,
            options: .curveLinear) {
            view.frame.origin.y += value
        } completion: { if $0 == .end {
            view.isHidden = true
            completion()
        }
        }

    }
    
}
