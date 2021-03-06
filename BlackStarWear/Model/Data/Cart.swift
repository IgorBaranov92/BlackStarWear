import Foundation

struct Cart: Codable {
    
    private(set) var items = [CartItem]()
    
    var totalPrice: Int { items.reduce(0) { $0 + $1.price} }
    
    var isEmpty: Bool { items.count == 0 }
    
    var json:Data? { try? JSONEncoder().encode(self) }
    
    init?(json:Data) {
        if let newValue = try? JSONDecoder().decode(Cart.self, from: json) {
            self = newValue
        }
    }

    mutating func append(_ item:CartItem) {
        self.items.append(item)
    }
    
    mutating func removeAt(_ index:Int) {
        self.items.remove(at: index)
    }
    
    mutating func buy() {
        self.items.removeAll()
    }
    
    init() { }
}
