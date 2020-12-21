import UIKit

class RemoveFromCartViewConstraints {
    
    class func activate(_ v1:UIView,_ v2: UIView) {
        v1.translatesAutoresizingMaskIntoConstraints = false
        v1.centerXAnchor.constraint(equalTo: v2.centerXAnchor).isActive = true
        v1.centerYAnchor.constraint(equalTo: v2.centerYAnchor).isActive = true
        v1.trailingAnchor.constraint(equalTo: v2.trailingAnchor, constant: -16).isActive = true
        v1.leadingAnchor.constraint(equalTo: v2.leadingAnchor, constant: 16).isActive = true
        v1.heightAnchor.constraint(equalToConstant: 240).isActive = true
        }
}
