import Foundation

class ItemParser {
    
    //working in background
    
    class func parse(_ json:[String:Any],completion: @escaping ( ([Item]) -> Void)) {
        var items = [Item]()
        print(json)
        json.forEach { (key,_) in
            if let dict = json[key] as? [String:Any],
               let name = dict["name"] as? String,
               let mainImage = dict["mainImage"] as? String
                {
                items.append(Item(name: name, price: 0, mainImage: mainImage))
            }
        }
        completion(items)
    }
}
