import UIKit
import CoreData

class MasterViewController: UIViewController {

    // MARK: - Properties
    
    var jsonArray: JsonArray!
    
    // Inyecto contexto desde AppDelegate
    var managedObjectContext: NSManagedObjectContext? = nil
    
    @IBOutlet weak var appLogo: UIImageView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paintAppLogo()
    }

    
    // MARK: - Actions
    

    @IBAction func goButton(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        let downloadEndFlag = defaults.bool(forKey: "ShopsDownloadEnd")
        
        if downloadEndFlag {
            ShopsInteractor().execute(completion: { (jsonArray: JsonArray) in
                self.jsonArray = jsonArray
            })
        
        
        /// Reseteamos flag en Desarrollo
        defaults.set(false, forKey: "ShopsDownloadEnd")
        
        }
        
        /// Cargamos datos en CORE DATA
        
        
    }
    

    
    
    


    
    
    
    
    // MARK: - Utils
    
    func paintAppLogo() {
        
        assert(Thread.current == Thread.main)
        
        appLogo.image = UIImage(named: "AppLogo.png")
    }
    


}
