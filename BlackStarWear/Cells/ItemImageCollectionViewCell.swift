import UIKit

class ItemImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView! { didSet {
        let layer0 = CALayer()
        layer0.compositingFilter = "multiplyBlendMode"
        layer0.bounds = imageView.bounds
        layer0.position = imageView.center
        imageView.layer.addSublayer(layer0)
        
    }}
    
    
    func fetch(_ url:URL?,backupData:Data?, competion: @escaping (Data,URL) -> Void) {
        if let imageData = backupData {
            imageView.image = UIImage(data: imageData)
        } else {
            ImageFetcher.fetch(url) { (data, foundURL) in
                if let image = UIImage(data: data), foundURL == url {
                    self.imageView.image = image
                    competion(data,foundURL)
                }
            }
        }
    }
}
