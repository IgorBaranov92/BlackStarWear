import Foundation


struct Cart: Codable {
    
    private(set) var items = [Item]() 
    
    var json:Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json:Data) {
        if let newValue = try? JSONDecoder().decode(Cart.self, from: json) {
            self = newValue
        }
    }
    
    mutating func addNew(_ item:Item) {
        items.append(item)
        save()
    }
    
    private func save() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("items"), let json = self.json {
            try? json.write(to: url)
        }
    }
    
}
