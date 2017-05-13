import UIKit

class ShopCell: UICollectionViewCell {
    
    private var _shop: Shop? = nil
    var shop: Shop {
        get {
            return _shop!
        }
        set {
            _shop = newValue
            
         
            
        }
    }
    
}

