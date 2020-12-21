import UIKit

class RemoveFromCartViewAnimator {
    
    static private let duration = 0.25
    
    static func show(_ view:RemoveFromCartView) {
            view.alpha = 0
            view.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            UIViewPropertyAnimator.runningPropertyAnimator(
                withDuration: duration,
                delay: 0.0,
                options: .curveLinear,
                animations: {
                    view.transform = CGAffineTransform.identity
                    view.alpha = 1.0
            })
        }
        
        static func dismiss(_ view:RemoveFromCartView,_ completion:( () -> () )? = nil ) {
            UIViewPropertyAnimator.runningPropertyAnimator(
                       withDuration: duration,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {
                           view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                           view.alpha = 0.0
                   }) {  if $0 == .end {
                        view.removeFromSuperview()
                        completion?()
                       }
                   }
        }
    
}
