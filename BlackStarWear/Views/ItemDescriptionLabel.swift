import UIKit

class ItemDescriptionLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        font = UIFont(name: "Roboto-Regular", size: 16)!
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        
    }

    func updateWith(_ newText:String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.07
        attributedText = NSMutableAttributedString(string: newText, attributes: [.kern: -0.27, .paragraphStyle: paragraphStyle])
    }
    
}