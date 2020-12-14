import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet private(set) weak var categoryImageView: UIImageView!
    @IBOutlet private(set) weak var categoryLabel: UILabel!

    var category = "" { didSet {
        categoryLabel?.attributedText = NSMutableAttributedString(string: category, attributes: [NSAttributedString.Key.kern: 0.19])
        categoryLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)!
    }}
    
    func fetch(_ url:URL?,backupData:Data?, competion: @escaping (Data,URL) -> Void) {
        if let imageData = backupData {
            categoryImageView.image = UIImage(data: imageData)
        } else {
            ImageFetcher.fetch(url) { (data, foundURL) in
                if let image = UIImage(data: data), foundURL == url {
                    self.categoryImageView.image = image
                    competion(data,foundURL)
                }
            }
        }
    }
    
}
