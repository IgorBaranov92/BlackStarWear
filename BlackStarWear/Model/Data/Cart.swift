import Foundation


struct Cart: Codable {
    
    private(set) var items = [CartItem]()
    
    var totalPrice: Int {
        return items.reduce(0) { $0 + $1.price}
    }
    
    var json:Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json:Data) {
        if let newValue = try? JSONDecoder().decode(Cart.self, from: json) {
            self = newValue
        }
    }

    mutating func append(_ item:CartItem) {
        self.items.append(item)
    }
    
    init() { }
}
