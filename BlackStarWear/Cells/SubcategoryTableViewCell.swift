import UIKit

class SubcategoryTableViewCell: UITableViewCell {

    @IBOutlet private(set) weak var subcategoryImageView: UIImageView! { didSet {
        subcategoryImageView.setPlaceholderIfNeeded()
        subcategoryImageView.contentMode = .scaleAspectFit
    }}
    
    @IBOutlet private(set) weak var subcategoryLabel: UILabel!

    var subcategory = "" { didSet {
        subcategoryLabel?.attributedText = NSMutableAttributedString(string: subcategory, attributes: [NSAttributedString.Key.kern: 0.19])
        subcategoryLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)!
    }}

    func fetch(_ url:URL?,backupData:Data?, competion: @escaping (Data,URL) -> Void) {
        if let imageData = backupData {
            subcategoryImageView.image = UIImage(data: imageData)
        } else {
            ImageFetcher.fetch(url) { (data, foundURL) in
                if let image = UIImage(data: data), foundURL == url {
                    self.subcategoryImageView.image = image
                    competion(data,foundURL)
                }
            }
        }
    }
}
