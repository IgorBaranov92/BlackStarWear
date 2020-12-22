import UIKit

class SizeChooserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    weak var delegate: ItemChooserDelegate?
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].offers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sizeCell", for: indexPath)
        if let sizeCell = cell as? SizeChooserTableViewCell {
            sizeCell.color = items[indexPath.section].offers[indexPath.row].color
            let euSize = items[indexPath.section].offers[indexPath.row].size
            let rusSize = SizeConverter[euSize]
            if let size = rusSize {
                sizeCell.size = "\(size) RUS \(euSize)"
            } else {
                sizeCell.size = euSize
            }
            sizeCell.doneImageView.image = nil
            return sizeCell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let sizeCell = tableView.cellForRow(at: indexPath) as? SizeChooserTableViewCell {
            sizeCell.doneImageView.image = UIImage(named: "Done")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [unowned self] in
                let size = items[indexPath.section].offers[indexPath.row].size
                let color = items[indexPath.section].offers[indexPath.row].color
                delegate?.itemChoosedWith(size: size, color: color)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}
