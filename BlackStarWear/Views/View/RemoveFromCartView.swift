import UIKit

class RemoveFromCartView: UIView {

    weak var delegate: ItemRemoveDelegate?

    @IBOutlet private weak var yesLabel: UILabel! { didSet {
        yesLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        yesLabel.font = UIFont(name: "SFProDisplay-Regular", size: 15)!
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.89
        paragraphStyle.alignment = .center
        yesLabel.attributedText = NSMutableAttributedString(string: "ДА", attributes: [.kern: -0.22, .paragraphStyle: paragraphStyle])
    }}
    
    @IBOutlet private weak var noLabel: UILabel!{ didSet {
        noLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        noLabel.font = UIFont(name: "SFProDisplay-Regular", size: 15)!
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.89
        paragraphStyle.alignment = .center
        noLabel.attributedText = NSMutableAttributedString(string: "НЕТ", attributes: [.kern: -0.22, .paragraphStyle: paragraphStyle])
    }}
    
    @IBOutlet private weak var titleLabel: UILabel!{ didSet {
        titleLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        titleLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 18)!
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.74
        paragraphStyle.alignment = .center
        titleLabel.attributedText = NSMutableAttributedString(string: "Удалить товар из корзины?", attributes: [.kern: -0.27,.paragraphStyle: paragraphStyle])
    }}
    
    @IBAction private func removeItem(_ sender: YesButton) {
        
    }
    
    @IBAction private func cancel(_ sender: NoButton) {
        delegate?.cancel()
    }
    
}
