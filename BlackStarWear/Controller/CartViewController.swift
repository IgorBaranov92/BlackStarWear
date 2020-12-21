import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPriceLabel: TotalPriceLabel!
    
    var cart: Cart!
    
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
//            cartCell.resignationHandler = { [unowned cartCell, weak self] in
//
//            }
            return cartCell
        }
        return cell
    }
    
    
    @IBAction func dismiss(_ sender: CancelButton) {
        dismiss(animated: true)
    }

    @IBAction func makeOrder(_ sender: MakeOrderButton) {
        
    }
    
    private func updateCart() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("cart"),let data = try? Data(contentsOf: url),let cart = Cart(json: data) {
                self.cart = cart
                tableView.reloadData()
                updateTotal()
        }
    }
    
    private func updateTotal() {
        totalPriceLabel.text = "\(cart.totalPrice) руб."
    }
}
