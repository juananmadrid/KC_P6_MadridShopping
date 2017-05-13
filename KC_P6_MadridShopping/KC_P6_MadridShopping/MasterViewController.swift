import UIKit
import CoreData


class MasterViewController: UIViewController {

    // MARK: - Properties
    
    // Inyecto contexto desde AppDelegate
    var context: NSManagedObjectContext?
    
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
        
        /// flag en Desarrollo
        if downloadEndFlag { }
        // defaults.set(false, forKey: "ShopsDownloadEnd")
        
        ShopsInteractor().execute(completion: { (jsonArray: JsonArray) in
            
            // Cargamos datos en CORE DATA
            do{
                try uploadJson(jsonArray: jsonArray, context: self.context!)
            } catch {
                print("Error cargando Json. \(error)")
            }
            
            
        })
        
        
        
        
        
        
    }
    

    
    
    


    
    
    
    
    // MARK: - Utils
    
    func paintAppLogo() {
        
        assert(Thread.current == Thread.main)
        
        appLogo.image = UIImage(named: "AppLogo.png")
    }
    


}
