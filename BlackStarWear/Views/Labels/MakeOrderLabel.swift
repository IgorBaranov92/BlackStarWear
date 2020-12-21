import UIKit

class MakeOrderLabel: UILabel {

    override var text: String? { didSet { setupWith(text ?? " ") }}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupWith("Оформить заказ")
    }
    
    private func setupWith(_ newText:String) {
        textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        font = UIFont(name: "SFProDisplay-Semibold", size: 15)!
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.89
        paragraphStyle.alignment = .center
        attributedText = NSMutableAttributedString(string: newText, attributes: [.kern: -0.22, .paragraphStyle: paragraphStyle])
    }

}
