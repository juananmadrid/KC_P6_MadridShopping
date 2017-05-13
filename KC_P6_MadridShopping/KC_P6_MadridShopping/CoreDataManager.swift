import CoreData


// public class CoreDataManager { } Podríamos meterlo dentro de esta clase como public class func
    
    
// MARK: - Core Data stack

public func persistentContainer(dbName: String, onError: ((NSError) -> Void)? = nil) -> NSPersistentContainer {
    
    let container = NSPersistentContainer(name: dbName)
    
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError?,
            let onError = onError {
            onError(error)
        }
        
    })
    return container
}

// MARK: - Core Data Saving support

// Inyectamos dependencias: inyectamos el "contexto" para salvar el que queramos
public func saveContext(context: NSManagedObjectContext, onError: ((NSError) -> Void)? = nil) {
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            if let error = error as NSError?,
                let onError = onError {
                onError(error)
            }
        }
    }
}


    
