import UIKit

class MasterViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var appLogo: UIImageView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paintAppLogo()
    }

    
    // MARK: - Actions
    

    @IBAction func goButton(_ sender: Any) {
        
        ShopsInteractor()
    }
    
    



    
    
    
    
    // MARK: - Utils
    
    func paintAppLogo() {
        
        assert(Thread.current == Thread.main)
        
        appLogo.image = UIImage(named: "AppLogo")
    }
    
}

