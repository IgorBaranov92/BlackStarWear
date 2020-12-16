import UIKit

@IBDesignable
class CancelButton: UIButton {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 5, y: 5))
        path.addLine(to: CGPoint(x: 19, y: 19))
        path.move(to: CGPoint(x: 5, y: 19))
        path.addLine(to: CGPoint(x: 19, y: 5))
        path.lineWidth = 1.5
        UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1).setStroke()
        path.stroke()
    }

}
