import UIKit

class CategoryTableViewController: UITableViewController {

    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if categories.isEmpty {
            CategoriesFetcher.fetch { [weak self] in
                self?.categories = $0
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell",for: indexPath)
        if let categoryCell = cell as? CategoryTableViewCell {
            categoryCell.category = categories[indexPath.row].name
            categoryCell.fetch(URLS.getIconURLBasedOn(iconName: categories[indexPath.row].iconImage), backupData: categories[indexPath.row].backupImageData) { [weak self] (data, url) in
                self?.categories[indexPath.row].backupImageData = data
            }
            return categoryCell
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "subcategories", sender: cell)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "subcategories",
           let destination = segue.destination as? SubcategoryTableViewController,
           let cell = sender as? CategoryTableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            destination.subcategories = categories[indexPath.row].subCategories.sorted(by: {$0.sortOrder > $1.sortOrder }) 
        }
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {}

}
