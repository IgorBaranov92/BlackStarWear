import UIKit

class ItemDetailViewController: UIViewController {

    var item: Item!
    
    @IBOutlet var heightConstraints: [NSLayoutConstraint]!
    @IBOutlet var outlets: [UIView]!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var priceLabel: PriceLabel!
    @IBOutlet weak var costLabel: CostLabel!
    @IBOutlet weak var itemNameLabel: ItemNameLabel!
    @IBOutlet weak var itemDescriptionLabel: ItemDescriptionLabel!
    @IBOutlet weak var addToCartLabel: AddToCartLabel!
    @IBOutlet weak var addToCartView: AddToCartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
        print(scrollView.contentSize)
    }
    
    private var totalHeight: CGFloat {
        return heightConstraints.reduce(heightConstraints.first!.constant, {$0 + $1.constant} ) + outlets.reduce(outlets.first!.bounds.height, { $0 + $1.bounds.size.height})
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
