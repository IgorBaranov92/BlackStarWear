import UIKit

class SubcategoryTableViewController: UITableViewController {

    var subcategories = [SubCategory]()

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subcategories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subcategotyCell", for: indexPath)
        if let subcategoryCell = cell as? SubcategoryTableViewCell {
            subcategoryCell.subcategory = subcategories[indexPath.row].name
            subcategoryCell.fetch(URLS.getIconURLBasedOn(iconName: subcategories[indexPath.row].iconImage), backupData: subcategories[indexPath.row].backupImageData) { [weak self] (data, url) in
                self?.subcategories[indexPath.row].backupImageData = data
            }
            return subcategoryCell
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}
