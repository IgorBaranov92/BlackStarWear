import UIKit

class CategoryTableViewController: UITableViewController {

    var categories = [Category]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        CategoriesFetcher.fetch { [weak self] in
            self?.categories = $0
            self?.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell",for: indexPath)
        if let categoryCell = cell as? CategoryTableViewCell {
            
            return categoryCell
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
