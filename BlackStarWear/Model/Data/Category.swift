import Foundation

struct Category {
    
    let name:String
    let iconImage:String
    var backupImageData:Data? = nil
    let sortOrder: Int
    let subCategories: Set<SubCategory>
    
  
}
