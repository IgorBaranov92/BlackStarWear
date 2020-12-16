import UIKit

class CartTableViewCell: UITableViewCell {

    var resignationHandler: (() -> Void)?

    @IBOutlet weak var itemImageView: UIImageView!
    
    var itemName = "" { didSet {
        itemNameLabel.attributedText = NSMutableAttributedString(string: itemName, attributes: [.kern: 0.19])
    }}
    
    var size = "" { didSet {
        sizeLabel.attributedText = NSMutableAttributedString(string: "Размер: \(size)", attributes: [.kern: 0.13])
    }}
    
    var color = "" { didSet {
        colorLabel.attributedText = NSMutableAttributedString(string: " Цвет: \(color)", attributes: [.kern: 0.13])
    }}
    
    var price = "" { didSet {
        priceLabel.attributedText = NSMutableAttributedString(string: "\(price) руб.", attributes: [.kern: 0.18])
    }}
    
    @IBOutlet weak private(set) var itemNameLabel: UILabel! { didSet {
        itemNameLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        itemNameLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)!
    }}
    
    @IBOutlet weak private(set) var sizeLabel: UILabel! { didSet {
        sizeLabel.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        sizeLabel.font = UIFont(name: "SFProDisplay-Medium", size: 11)!
    }}
    
    @IBOutlet weak private(set) var colorLabel: UILabel! { didSet {
        colorLabel.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        colorLabel.font = UIFont(name: "SFProDisplay-Medium", size: 11)!
    }}

    @IBOutlet weak private(set) var priceLabel: UILabel! { didSet {
        priceLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        priceLabel.font = UIFont(name: "SFProDisplay-Medium", size: 15)!
    }}
    
    @IBAction private func removeFromCart(_ sender: UIButton) {
        resignationHandler?()
    }
    
}
