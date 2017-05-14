import UIKit
import CoreData

class DetailViewController: UIViewController {

    // shop inyectada desde ShopController a partir de indexPath de celda seleccionada
    var shop: Shop!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var descript: UILabel!
    @IBOutlet weak var imageLocation: UIImageView!
    
    let preferredLanguaje = NSLocale.preferredLanguages[0] as String
    
    let urlString = "http://maps.googleapis.com/maps/api/staticmap? center=40.431598,-3.707008&zoom=17&size=320x220&scale=2&markers=%7Ccolor:0x9C7B14%7C40.431598,-3.707008"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name.text = shop.name
        self.address.text = shop.address
        
        if preferredLanguaje == "es" {
            self.descript.text = shop.description_es
        } else {
            self.descript.text = shop.description_en
        }
        
        let imageLoc = shop.imageLocation as? Data ?? UIImagePNGRepresentation(UIImage(named: "madrid.png")!)
        imageLocation.image = UIImage(data: imageLoc!)
        
        
    }

    

}
