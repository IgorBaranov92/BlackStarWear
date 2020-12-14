import Foundation

struct ItemsFetcher {
    
    static func fetch(_ url:URL?,completion: @escaping (Data,URL) -> Void ) {
        if let url = url {
            DispatchQueue.global(qos: .userInitiated).async {
                let session = URLSession(configuration: .default)
                let request = URLRequest(url: url)
                let task = session.dataTask(with: request) { (data, responce, error) in
                    if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                        print(json)
                    }
                }
                task.resume()
            }
        }
    }
    
}
