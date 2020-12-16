import UIKit

class CostLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        font = UIFont(name: "AkzidenzGroteskPro-Regular", size: 16)!
        text = "Стоимость:"
    }
    
}
