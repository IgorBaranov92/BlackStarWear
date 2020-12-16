import UIKit

@IBDesignable
class LineLabel: UILabel {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1).setFill()
        path.fill()
    }

}
