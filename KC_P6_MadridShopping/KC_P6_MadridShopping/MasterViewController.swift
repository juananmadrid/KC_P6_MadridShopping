import UIKit
import CoreData


class MasterViewController: UIViewController {
    
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
        
        // Flag para no descargar si ya está descargado antes
         if !downloadEndFlag {
        
            ShopsInteractor().execute(completion: { (jsonArray: JsonArray) in
                
                // Cargamos datos en CORE DATA
                do{
                    try uploadJson(jsonArray: jsonArray, context: self.context!)
                } catch {
                    print("Error cargando Json. \(error)")
                }
                
                self.performSegue(withIdentifier: "ShopViewControllerSegue", sender: sender)
            })
        
         }
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            if identifier == "ShopViewControllerSegue" {
                let vc = segue.destination as! ShopController
                vc.context = self.context
            }
            
        }
        
    }
    
    
    
    
    // MARK: - Utils
    
    func paintAppLogo() {
        
        assert(Thread.current == Thread.main)
        
        appLogo.image = UIImage(named: "AppLogo.png")
    }
    

}
