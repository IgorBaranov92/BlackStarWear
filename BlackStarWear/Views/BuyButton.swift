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
        backgroundColor = .buyButtonColor
        setTitle("КУПИТЬ", for: .normal)
        titleLabel!.font = UIFont(name: "Roboto-Bold", size: 8)!
        titleLabel!.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
}
