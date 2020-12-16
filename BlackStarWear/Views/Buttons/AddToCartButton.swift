import UIKit

@IBDesignable
class AddToCartButton: UIButton {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 8)
        UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).setFill()
        path.fill()
    }

}
