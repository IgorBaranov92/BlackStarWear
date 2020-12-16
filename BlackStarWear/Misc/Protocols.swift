import Foundation
import UIKit

protocol CartViewDelegate: class {
    func cartViewTouched()
}

protocol ItemRemoveDelegate: class {
    func remove()
    func cancel()
}
