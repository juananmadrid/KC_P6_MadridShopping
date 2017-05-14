import CoreData

extension Shop {
    
    // Criterios de búsqueda según requisitos
    class func fetchRequestOrderedByName() -> NSFetchRequest<Shop> {
        
        let fetchRequest: NSFetchRequest<Shop> = Shop.fetchRequest()
        fetchRequest.fetchBatchSize = 30
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return fetchRequest
    }
    
    
}
