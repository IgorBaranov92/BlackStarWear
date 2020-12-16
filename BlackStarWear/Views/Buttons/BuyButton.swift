import UIKit

class BuyButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = 5.0
        backgroundColor = UIColor(red: 0.967, green: 0.234, blue: 0.41, alpha: 0.85)
        setTitle("КУПИТЬ", for: .normal)
        titleLabel!.font = UIFont(name: "Roboto-Bold", size: 8)!
        titleLabel!.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
}
