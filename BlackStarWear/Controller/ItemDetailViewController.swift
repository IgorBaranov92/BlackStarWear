import UIKit

class ItemDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var item: Item!
    
    @IBOutlet var spacings: [NSLayoutConstraint]!
    @IBOutlet var outlets: [UIView]!

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var priceLabel: PriceLabel!
    @IBOutlet weak var costLabel: CostLabel!
    @IBOutlet weak var itemNameLabel: ItemNameLabel!
    @IBOutlet weak var itemDescriptionLabel: ItemDescriptionLabel!
    @IBOutlet weak var addToCartLabel: AddToCartLabel!
    @IBOutlet weak var pageControl: UIPageControl! { didSet {
        pageControl.numberOfPages = item.images.count
    }}
    @IBOutlet weak var cartView: UIView! { didSet {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToCart(_:)))
        cartView.addGestureRecognizer(tapGesture)
    }}
    
    
    @IBOutlet private weak var imageHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: totalHeight + 10)
    }
    
    
    private var totalHeight: CGFloat {
        return spacings.reduce(0, {$0 + $1.constant} ) + outlets.reduce(0, { $0 + $1.bounds.size.height})
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func addToCart(_ sender: AddToCartButton) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemImage", for: indexPath)
        if let itemImageCell = cell as? ItemImageCollectionViewCell {
            
            itemImageCell.fetch(URLS.getIconURLBasedOn(iconName: item.images[indexPath.row]), backupData: item.backup?[indexPath.row]) { [weak self] (data, url) in
                self?.item.backup?[indexPath.row] = data
            }
            return itemImageCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: imageHeightConstraint.constant)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x)/Int(scrollView.bounds.width)
        pageControl.currentPage = page
    }
}

extension ItemDetailViewController {
    func updateUI() {
        itemNameLabel.text = item.name
        itemDescriptionLabel.text = item.description
        priceLabel.text = String(item.price)
    }
    
    @objc
    fileprivate func goToCart(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            performSegue(withIdentifier: "cart", sender: cartView)
        }
    }
}
