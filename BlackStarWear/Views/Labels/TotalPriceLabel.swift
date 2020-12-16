import UIKit

class TotalPriceLabel: UILabel {

    override var text: String? { didSet { setupWith(text ?? "" )}}
    
    private func setupWith(_ newText:String) {
        alpha = 0.4
        textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        font = UIFont(name: "SFProDisplay-Medium", size: 16)!
        textAlignment = .right
        attributedText = NSMutableAttributedString(string: newText, attributes: [.kern: 0.19])
    }

}
