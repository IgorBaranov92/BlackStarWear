import Foundation

class ItemParser {
    
    //working in background
    
    class func parse(_ json:[String:Any],completion: @escaping ( ([Item]) -> Void)) {
        var items = [Item]()
        print(json)
        json.forEach { (key,_) in
            if let dict = json[key] as? [String:Any],
               let name = dict["name"] as? String,
               let mainImage = dict["mainImage"] as? String,
               let price = dict["price"] as? String ,
               let doublePrice = Double(price),
               let description = dict["description"] as? String,
               let offers = dict["offers"] as? [[String:Any]],
               let productImages = dict["productImages"] as? [[String:Any]] {
                var images = [String]()
                productImages.forEach { (key) in
                    if let imageURL = key["imageURL"] as? String {
                        images.append(imageURL)
                    }
                }
                items.append(Item(name: name, price: Int(doublePrice), mainImage: mainImage, description: description, images: images))
                
            }
        }
        completion(items)
    }
}
