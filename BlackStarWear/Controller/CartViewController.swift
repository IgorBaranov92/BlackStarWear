import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ItemRemoveDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPriceLabel: TotalPriceLabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var makeOrderLabel: MakeOrderLabel!
     
    var cart: Cart!
    
    var buyer = Buyer(name: "name", money: 50_000)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCart()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath)
        if let cartCell = cell as? CartTableViewCell {
            cartCell.itemName = cart.items[indexPath.row].name
            cartCell.size = cart.items[indexPath.row].size
            cartCell.price = String(cart.items[indexPath.row].price)
            cartCell.color = cart.items[indexPath.row].color
            cartCell.itemImageView.image = UIImage(data: cart.items[indexPath.row].imageData)
            cartCell.resignationHandler = { [unowned self] in
                self.showRemovalView()
                self.indexToRemove = indexPath.row
            }
            return cartCell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func dismiss(_ sender: CancelButton) {
        dismiss(animated: true)
    }

    @IBAction func makeOrder(_ sender: MakeOrderButton) {
        if cart.totalPrice == 0 {
            dismiss(animated: true)
        } else {
            if buyer.money >= cart.totalPrice {
                buyer.money -= cart.totalPrice
                cart.buy()
                saveCart()
                updateTotal()
                tableView.reloadData()
            } else {
                let alert = UIAlertController(title: "Ошибка", message: "Недостаточно средств", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
        }
    }
    
    private func updateTotal() {
        totalPriceLabel.text = cart.totalPrice == 0 ? "0 руб." : "\(cart.totalPrice) руб."
        makeOrderLabel.text =  cart.totalPrice == 0 ? "На главную" : "Оформить заказ"
    }
    
    private let removalView = RemoveFromCartView.initFromNib()
    private var indexToRemove = 0
    
    private func showRemovalView() {
        containerView.isHidden = false
        containerView.isUserInteractionEnabled = true
        removalView.delegate = self
        view.addSubview(removalView)
        RemoveFromCartViewConstraints.activate(removalView, self.view)
        RemoveFromCartViewAnimator.show(removalView)
    }
    
    func remove() {
        RemoveFromCartViewAnimator.dismiss(removalView) {
            self.cart.removeAt(self.indexToRemove)
            self.saveCart()
            self.updateTotal()
            self.tableView.reloadData()
            self.dismissContainerView()
        }
    }
    
    func cancel() {
        RemoveFromCartViewAnimator.dismiss(removalView) {
            self.dismissContainerView()
        }
    }
    
    private func dismissContainerView() {
        containerView.isHidden = true
        containerView.isUserInteractionEnabled = false
    }
}


extension CartViewController {
    
    fileprivate func updateCart() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("cart"),let data = try? Data(contentsOf: url),let cart = Cart(json: data) {
                self.cart = cart
                tableView.reloadData()
                updateTotal()
        }
    }
    
    fileprivate func saveCart() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("cart"), let json = cart.json {
            try? json.write(to: url)
        }
    }
    
}
