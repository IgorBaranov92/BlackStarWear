import Foundation


class CategoryParser {
    
    class func parse(_ json:[String:Any],completion: @escaping ( ([Category]) -> Void)) {
        var categories = [Category]()
        print(json)
        json.forEach { (key, _) in
            if let category = json[key] as? [String:Any] {
                if let name = category["name"] as? String,
                   let sortOrder = category["sortOrder"] as? String,
                   let order = Int(sortOrder),
                   let iconImage = category["image"] as? String,
                   let subcategories = category["subcategories"] as? [[String:Any]] {
                    var sCategories = Set<SubCategory>()
                    subcategories.forEach {
                        let dict = $0
                        dict.forEach { subKey,subValue in
                            if let iconImage = dict["iconImage"] as? String,
                               let id = dict["id"] as? String,
                               let name = dict["name"] as? String,
                               let sortOrder = dict["sortOrder"] as? String {
                                sCategories.insert(SubCategory(iconImage: iconImage, id: Int(id)!, name: name, sortOrder: Int(sortOrder)!))
                            }
                        }
                    }
                    categories.append(Category(name: name, iconImage: iconImage, sortOrder: order, subCategories: sCategories))
                }
            }
        }
        
        completion(categories.sorted(by: { $0.sortOrder < $1.sortOrder})
                             .filter { $0.subCategories.count > 0})
    }
    
}
