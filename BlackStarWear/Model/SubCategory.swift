import Foundation

struct SubCategory: Hashable {
    
    let iconImage:String
    let id: Int
    let name: String
    let sortOrder: Int
    var backupImageData: Data? = nil
}
