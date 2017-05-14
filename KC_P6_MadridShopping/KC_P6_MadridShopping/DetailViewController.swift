import UIKit
import CoreData

class DetailViewController: UIViewController {

    // shop inyectada desde ShopController a partir de indexPath de celda seleccionada
    var shop: Shop!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var descript: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name.text = shop.name
        self.address.text = shop.address
        self.descript.text = shop.description_en

    }

    

}
