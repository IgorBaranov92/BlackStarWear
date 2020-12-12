import Foundation

struct Category {
    
    let name:String
    let imageKey:String
    let backupImageData:Data?
    let sortOrder: Int
    let subCategories: [SubCategory]
    
}
