import UIKit

class MasterViewController: UIViewController {

    // MARK: - Properties
    
    var jsonArray: JsonArray!
    
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
        
        
        /// Cargamos datos en CORE DATA
        defaults.set(false, forKey: "ShopsDownloadEnd")
        
        }
    }
    



    
    
    
    
    // MARK: - Utils
    
    func paintAppLogo() {
        
        assert(Thread.current == Thread.main)
        
        appLogo.image = UIImage(named: "AppLogo.png")
    }
    


}
