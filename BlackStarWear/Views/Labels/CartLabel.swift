import UIKit

class CartLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        font = UIFont(name: "SFProDisplay-Medium", size: 16)!
        textAlignment = .center
        attributedText = NSMutableAttributedString(string: "Корзина", attributes: [.kern: 0.19])
    }
    

}
