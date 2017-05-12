import Foundation


public class ShopsInteractor {
    
    let manager: ShopAPIManager
    
    init(manager: ShopAPIManager) {
        self.manager = manager
    }
    
    public convenience init() {
        self.init(manager: ShopAPIManager())
    }

    public func execute(completion: @escaping (JsonArray) -> Void) {
        manager.downloadJsonArray(completion: {(jsonArray) in
            assert(Thread.current == Thread.main)
        })
    }
        
    
    
}
