import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPriceLabel: TotalPriceLabel!
    
    @IBAction func dismiss(_ sender: CancelButton) {
        dismiss(animated: true)
    }

    @IBAction func makeOrder(_ sender: MakeOrderButton) {
        
    }
}
