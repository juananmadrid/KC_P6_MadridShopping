import UIKit

class ShopCell: UICollectionViewCell {
    
    
    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var image_logo: UIImageView!
    @IBOutlet weak var image: UIImageView!
    
    private var _shop: Shop? = nil
    
    var shop: Shop {
        get {
            return _shop!
        }
        set {
            _shop = newValue
            
            name.text = newValue.name
            // image_logo.image = newValue.logo
            // image.image = newValue.image
        }
    }
    
}

