import UIKit

class PriceLabel: UILabel {

    override var text: String? { didSet {
        setupWith(text ?? "")
    }}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupWith("")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupWith("")
    }
    
    private func setupWith(_ newText:String) {
        alpha = 0.5
        textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        font = UIFont(name: "HelveticaNeueCyr-Bold", size: 18)!
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.95
        textAlignment = .right
        attributedText = NSMutableAttributedString(string: "\(newText) ₽", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

}
