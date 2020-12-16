import Foundation
import UIKit

protocol CartViewDelegate: class {
    func cartViewTouched()
}

protocol AddToCartDelegate: class {
    func addToCart()
}
