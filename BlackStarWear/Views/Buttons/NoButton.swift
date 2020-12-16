import UIKit

@IBDesignable
class NoButton: UIButton {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect.insetBy(dx: 2.0, dy: 2.0), cornerRadius: 8)
        path.lineWidth = 1
        UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1).setStroke()
        path.stroke()
    }

}
