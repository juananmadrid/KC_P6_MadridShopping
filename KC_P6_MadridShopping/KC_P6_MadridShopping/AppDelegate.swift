import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // Core Data
    // let coreDataManager = CoreDataManager() // Si usáramos clase CoreDataManager como class
    var context : NSManagedObjectContext?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let controller = MasterViewController()
        
        
        // CORE DATA STACK
        
        // Persisten Container
        let container = persistentContainer(dbName: "MadridShopping") { (error: NSError) in
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        
        // Contexto
        self.context = container.viewContext
        
        // Inyecto contexto en MasterViewController
        controller.managedObjectContext = self.context
        
        
        
        
        return true
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        guard let context = self.context else { return }
        saveContext(context: context)
    }
    


    

}

