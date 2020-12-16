import UIKit

class MakeOrderLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        font = UIFont(name: "SFProDisplay-Semibold", size: 15)!
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.89
        paragraphStyle.alignment = .center
        attributedText = NSMutableAttributedString(string: "Оформить заказ", attributes: [.kern: -0.22, .paragraphStyle: paragraphStyle])
    }

}
