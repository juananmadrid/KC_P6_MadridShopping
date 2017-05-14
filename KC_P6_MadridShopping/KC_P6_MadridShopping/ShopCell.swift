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
            
        
            let imageLogo = newValue.image_logo as? Data ?? UIImagePNGRepresentation(UIImage(named: "IconDefault.png")!)
            let imageData = newValue.image_back as? Data ?? UIImagePNGRepresentation(UIImage(named: "BackgroundDefault.jpg")!)
            
            image_logo.image  = UIImage(data: imageLogo!)
            image.image = UIImage(data: imageData!)
            
        }
    }
    
}

