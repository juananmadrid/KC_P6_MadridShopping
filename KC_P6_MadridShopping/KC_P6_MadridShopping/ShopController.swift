import UIKit
import CoreData


class ShopController: UIViewController {

    var context: NSManagedObjectContext?
    var _fetchedResultsController: NSFetchedResultsController<Shop>? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
}
