import UIKit

class AddToCartLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        font = UIFont(name: "AkzidenzGroteskPro-Md", size: 13)!
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.12
        paragraphStyle.alignment = .center
        attributedText = NSMutableAttributedString(string: "ДОБАВИТЬ В КОРЗИНУ", attributes: [.paragraphStyle: paragraphStyle])
    }

}
