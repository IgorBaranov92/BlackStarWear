import Foundation
import UIKit

protocol ItemChooserDelegate: class {
    func itemChoosedWith(size:String,color:String)
}

protocol ItemRemoveDelegate: class {
    func remove()
    func cancel()
}
