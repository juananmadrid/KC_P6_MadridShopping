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
        
        ShopsInteractor().execute(completion: { (jsonArray: JsonArray) in
            self.jsonArray = jsonArray
        })
    }
    
    



    
    
    
    
    // MARK: - Utils
    
    func paintAppLogo() {
        
        assert(Thread.current == Thread.main)
        
        appLogo.image = UIImage(named: "AppLogo.png")
    }
    
}

