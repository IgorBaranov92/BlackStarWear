import UIKit

@IBDesignable
class CartCounterView: UIView {

    var counter = 0 { didSet {
        counterLabel.isHidden = counter == 0 ? true : false
        counterLabel.text = "\(counter)"
        setNeedsDisplay()
    }}
    
    @IBOutlet private(set) weak var counterLabel: UILabel! { didSet {
        counterLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        counterLabel.font = UIFont(name: "HelveticaNeueCyr-Black", size: 11)!
        counterLabel.textAlignment = .center
    }}
    
    override func draw(_ rect: CGRect) {
        if counter != 0 {
            let path = UIBezierPath(arcCenter: bounds.center, radius: rect.width/2, startAngle: 0, endAngle: .pi*2, clockwise: false)
            UIColor(red: 0.816, green: 0.008, blue: 0.107, alpha: 1).setFill()
            path.fill()
        }
    }

}


extension CGRect {
    var center: CGPoint { CGPoint(x: midX, y: midY)}
}
