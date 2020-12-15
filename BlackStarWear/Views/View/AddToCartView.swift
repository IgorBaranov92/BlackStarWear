import UIKit

class AddToCartView: UIView {

    weak var delegate: CartViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        layer.cornerRadius = 10.0
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cartViewTouched(_:)))
        addGestureRecognizer(tapGesture)
    }

    @objc private func cartViewTouched(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            delegate?.cartViewTouched()
        }
    }
}
