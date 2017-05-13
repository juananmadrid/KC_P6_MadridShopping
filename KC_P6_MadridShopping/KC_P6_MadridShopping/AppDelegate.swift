import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // Core Data
    // let coreDataManager = CoreDataManager() // Si usáramos clase CoreDataManager como class
    var context : NSManagedObjectContext?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        
        
        
        // CORE DATA STACK
        
        // Persisten Container
        let container = persistentContainer(dbName: "KC_P6_MadridShopping") { (error: NSError) in
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        
        // Contexto
        self.context = container.viewContext
        
        // Sin meter MasterViewController en un Navigation
        // let controller = self.window?.rootViewController as! MasterViewController
        // Inyecto contexto en MasterViewController
        // controller.context = self.context
        
        // Con MasterViewController en un Navigation
        if let navController = window?.rootViewController as? UINavigationController,
            let initialViewController = navController.topViewController as? MasterViewController
        {
            initialViewController.context = self.context
        }
        
        return true
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        guard let context = self.context else { return }
        saveContext(context: context)
    }
    


    

}

