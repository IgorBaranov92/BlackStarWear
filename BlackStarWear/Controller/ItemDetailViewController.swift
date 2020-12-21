import UIKit

class ItemDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ItemChooserDelegate {
    
    var item: Item!
    var relatedItems = [Item]()
    var cart = Cart()
    
    
    @IBOutlet var spacings: [NSLayoutConstraint]!
    @IBOutlet var outlets: [UIView]!

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var priceLabel: PriceLabel!
    @IBOutlet weak var costLabel: CostLabel!
    @IBOutlet weak var itemNameLabel: ItemNameLabel!
    @IBOutlet weak var itemDescriptionLabel: ItemDescriptionLabel!
    @IBOutlet weak var addToCartLabel: AddToCartLabel!
    @IBOutlet weak var addToCartButton: AddToCartButton!
    @IBOutlet weak var cartCounterView: CartCounterView!
    @IBOutlet weak var pageControl: UIPageControl! { didSet {
        pageControl.numberOfPages = item.images.count
    }}
    @IBOutlet weak var cartView: UIView! { didSet {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToCart(_:)))
        cartView.addGestureRecognizer(tapGesture)
    }}
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var background: UIView! { didSet {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissTable(_:)))
        background.addGestureRecognizer(tapGesture)
    }}
 
    @IBOutlet private weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var labelWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var labelOffsetConstraint: NSLayoutConstraint!
    private let tableViewHeight: CGFloat = 300.0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
        updateCart()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        labelWidthConstraint.constant = view.bounds.width - labelOffsetConstraint.constant*2
        
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
        containerView.isHidden = false
        containerView.frame = CGRect(x: 0, y: view.bounds.height, width: view.bounds.width, height: 300)
        background.backgroundColor = #colorLiteral(red: 0.8316103232, green: 0.8316103232, blue: 0.8316103232, alpha: 0.6971973141)
        background.isUserInteractionEnabled = true
        SizeChooserAnimator.popUp(containerView, by: tableViewHeight)
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
    
    func itemChoosedWith(size: String, color: String) {
        SizeChooserAnimator.popDown(containerView, by: tableViewHeight) { [unowned self] in
            self.updateTableView()
            CartViewAnimator.animate(self.cartView)
            cart.append(CartItem(imageData: item.backupImageData ?? Data(), name: item.name, size: size, color: color, price: item.price))
            self.saveCart()
            self.cartCounterView.counter = self.cart.items.count
        }
    }
  
    private func updateTableView() {
        background.backgroundColor = .clear
        background.isUserInteractionEnabled = false
        sizeChooserVC?.tableView.reloadData()
    }
    
    private var sizeChooserVC: SizeChooserViewController?
}

extension ItemDetailViewController {
    
    fileprivate func updateUI() {
        itemNameLabel.text = item.name
        itemDescriptionLabel.text = item.description
        priceLabel.text = String(item.price)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sizeChooser", let destination = segue.destination as? SizeChooserViewController {
                destination.delegate = self
                destination.items = relatedItems
                self.sizeChooserVC = destination
        }
    }
    
    @objc fileprivate func dismissTable(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            SizeChooserAnimator.popDown(containerView, by: tableViewHeight) { [unowned self] in
                self.updateTableView()
            }
        }
    }
    
    @objc fileprivate func goToCart(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            performSegue(withIdentifier: "cartVC", sender: self)
        }
    }
    
    fileprivate func updateCart() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("cart"),let data = try? Data(contentsOf: url), let cart = Cart(json: data) {
            self.cart = cart
            cartCounterView.counter = cart.items.count
            saveCart()
        }
    }
    
    fileprivate func saveCart() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("cart"), let json = cart.json {
            try? json.write(to: url)
        }
    }
}
