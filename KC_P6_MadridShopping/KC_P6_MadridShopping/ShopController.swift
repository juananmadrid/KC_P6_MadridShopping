import UIKit
import CoreData


class ShopController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var map: UIImageView!
    
    var context: NSManagedObjectContext?
    var _fetchedResultsController: NSFetchedResultsController<Shop>? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        map.image = UIImage(named: "madrid.png")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "ShopDetailSegue" {
                
                // Preguntamos al collection por el indesPatch seleccionado
                let indexPath = collectionView.indexPathsForSelectedItems?.first
                
                // Preguntamos al feteched fetchedResultsController por la shop seleccionada
                let shop = fetchedResultsController.object(at: indexPath!)
                
                let vc = segue.destination as! DetailViewController
                vc.shop = shop
                
                
            }
            
        }
    }
    
    
}
