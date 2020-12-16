import UIKit

class TotalLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        font = UIFont(name: "SFProDisplay-Medium", size: 16)!
        attributedText = NSMutableAttributedString(string: "Итого:", attributes: [.kern: 0.19])
    }

}
