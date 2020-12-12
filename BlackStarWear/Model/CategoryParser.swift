import Foundation


class CategoryParser {
    
    class func parse(_ json:[String:Any],completion: @escaping ( ([Category]) -> Void)) {
        let categories = [Category]()
        completion(categories)
    }
    
}
