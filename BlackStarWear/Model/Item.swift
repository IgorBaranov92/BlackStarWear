import Foundation

struct Item: Codable {
    
    let name: String
    let price: Int
    let mainImage: String
    var backupImageData: Data? = nil
    let description: String
    let images: [String]
   // let offers: [Offer]
    
    struct Offer: Codable {
        let size: String
        let quantity: Int
    }
}
