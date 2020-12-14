import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var buyButton: BuyButton!
    
    @IBOutlet private(set) weak var descriptionLabel: UILabel! { didSet {
        descriptionLabel.font = UIFont(name: "SFProDisplay-Medium", size: 11)!
        descriptionLabel.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
    }}
    
    @IBOutlet private(set) weak var itemImageView: UIImageView!
    @IBOutlet private(set) weak var priceLabel: UILabel! { didSet {
        priceLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)!
    }}
    
    var price = 0 { didSet {
        priceLabel.attributedText = NSMutableAttributedString(string: "\(price) ₽", attributes: [NSAttributedString.Key.kern: 0.19])
    }}
    
    var name = "" { didSet {
        descriptionLabel.attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.kern: 0.13])
        
    }}
    
    
}
