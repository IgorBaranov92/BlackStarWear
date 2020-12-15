import UIKit


class ItemsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var itemID = 0
    
    var items = [Item]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url = URL(string:"https://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(itemID)")
        ItemsFetcher.fetch(url) { [weak self] in
            self?.items = $0
            self?.collectionView.reloadData()
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath)
        if let itemCell = cell as? ItemCollectionViewCell {
                itemCell.price = items[indexPath.row].price
                itemCell.name = items[indexPath.row].name
            itemCell.fetch(URLS.getIconURLBasedOn(iconName: items[indexPath.row].mainImage), backupData: items[indexPath.row].backupImageData) { [weak self] (data, url) in
                self?.items[indexPath.row].backupImageData = data
            }
            return itemCell
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - 40)/2, height: 248)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemDetail",
           let destination = segue.destination as? ItemDetailViewController,
           let cell = sender as? ItemCollectionViewCell,
           let indePath = collectionView.indexPath(for: cell) {
            destination.item = items[indePath.row]
        }
    }
}
