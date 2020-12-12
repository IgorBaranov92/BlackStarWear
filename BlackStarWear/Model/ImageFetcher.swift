import Foundation
import UIKit


class ImageFetcher {
    
    static func fetch(_ url:URL?,completion: @escaping (Data,URL) -> Void ) {
        if let url = url {
            DispatchQueue.global(qos: .userInitiated).async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        completion(data,url)
                    }
                }
            }
        }
    }
    
}
