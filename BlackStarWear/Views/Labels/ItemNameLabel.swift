import UIKit

class ItemNameLabel: UILabel {
   
    override var text: String? { didSet { setupWith(text ?? "")}}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupWith("")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupWith("")
    }
    
    private func setupWith(_ newText:String) {
        textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        font = UIFont(name: "AkzidenzGroteskPro-BoldCn", size: 36)!
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        attributedText = NSMutableAttributedString(string: newText, attributes: [.paragraphStyle: paragraphStyle])
    }

}
