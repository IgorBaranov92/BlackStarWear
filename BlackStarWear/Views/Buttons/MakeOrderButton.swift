import UIKit

@IBDesignable
class MakeOrderButton: UIButton {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 24)
        UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).setFill()
        path.fill()
        
    }

}
