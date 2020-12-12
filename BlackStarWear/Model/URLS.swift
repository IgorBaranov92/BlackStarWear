import Foundation

struct URLS {
    
    static func getCategoryURL() -> URL? {
        return URL(string: "https://blackstarshop.ru/index.php?route=api/v1/categories")
    }
    
    static func getProductURLWith(id:String) -> URL? {
        return URL(string: "https://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(id)")
    }
    
    
}
