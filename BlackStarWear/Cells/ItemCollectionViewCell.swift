import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var buyButton: BuyButton!
    
    @IBOutlet private(set) weak var descriptionLabel: UILabel! { didSet {
        descriptionLabel.font = UIFont(name: "SFProDisplay-Medium", size: 11)!
        descriptionLabel.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
    }}
    
    @IBOutlet private(set) weak var itemImageView: UIImageView! { didSet {
        itemImageView.transform3D = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0, c: 0, d: 0.83, tx: 0, ty: 0.08))
        itemImageView.setPlaceholderIfNeeded()
        itemImageView.contentMode = .scaleAspectFit
    }}
    
    @IBOutlet private(set) weak var priceLabel: UILabel! { didSet {
        priceLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)!
    }}
    
    var price = 0 { didSet {
        priceLabel.attributedText = NSMutableAttributedString(string: "\(price) ₽", attributes: [.kern: 0.19])
    }}
    
    var name = "" { didSet {
        descriptionLabel.attributedText = NSMutableAttributedString(string: name, attributes: [.kern: 0.13])
        
    }}
    
    func fetch(_ url:URL?,backupData:Data?, competion: @escaping (Data,URL) -> Void) {
        if let imageData = backupData {
            itemImageView.image = UIImage(data: imageData)
        } else {
            ImageFetcher.fetch(url) { (data, foundURL) in
                if let image = UIImage(data: data), foundURL == url {
                    self.itemImageView.image = image
                    competion(data,foundURL)
                }
            }
        }
    }
    
}
