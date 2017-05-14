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
        
        guard let context = self.context else { return }
        
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
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let defaults = UserDefaults.standard
        let downloadEndFlag = defaults.bool(forKey: "ShopsDownloadEnd")
        
        if downloadEndFlag {
            
        } else {
            print("Datos no cargados en Core Data")
        }
        
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
