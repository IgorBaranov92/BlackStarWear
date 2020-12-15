import UIKit

class PageScrollView: UIScrollView, UIScrollViewDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }

}
