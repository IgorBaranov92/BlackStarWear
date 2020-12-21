import UIKit

class SizeChooserTableViewCell: UITableViewCell {

    var color = "" { didSet {
        colorLabel.text = color
    }}
    
    var size = "" { didSet {
        sizeLabel.text = size
    }}
    
    @IBOutlet private(set) weak var colorLabel: UILabel! { didSet {
        colorLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        colorLabel.font = UIFont(name: "AkzidenzGroteskPro-Regular", size: 17)!
    }}
    
    @IBOutlet private(set) weak var sizeLabel: UILabel! { didSet {
        sizeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        sizeLabel.font = UIFont(name: "AkzidenzGroteskPro-Regular", size: 17)!
    }}
    
    @IBOutlet weak var doneImageView: UIImageView!
    

}
