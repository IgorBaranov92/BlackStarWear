import UIKit

class ItemDetailViewController: UIViewController {

    var item: Item!
    
    @IBOutlet var spacings: [NSLayoutConstraint]!
    @IBOutlet var outlets: [UIView]!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var priceLabel: PriceLabel!
    @IBOutlet weak var costLabel: CostLabel!
    @IBOutlet weak var itemNameLabel: ItemNameLabel!
    @IBOutlet weak var itemDescriptionLabel: ItemDescriptionLabel!
    @IBOutlet weak var addToCartLabel: AddToCartLabel!
    @IBOutlet weak var addToCartView: AddToCartView!
    @IBOutlet weak var pageControl: UIPageControl! { didSet {
        pageControl.numberOfPages = item.images.count
    }}
    
    @IBOutlet private weak var imageHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
        imageScrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(item.images.count), height: imageHeightConstraint.constant)
    }
    
    
    private var totalHeight: CGFloat {
        return spacings.reduce(0, {$0 + $1.constant} ) + outlets.reduce(0, { $0 + $1.bounds.size.height})
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        
    }
    
}

extension ItemDetailViewController {
    func updateUI() {
        itemNameLabel.text = item.name
        itemDescriptionLabel.text = item.description
        priceLabel.text = String(item.price)
    }
}
