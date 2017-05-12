import UIKit

public typealias JsonDictionary = Dictionary<String, Any>
public typealias ArrayShops = [JsonDictionary]
public typealias ShopArray = [Shop]

public typealias ErrorClosure = (Error) -> Void

class ShopAPIManager {

    public func downloadJsonArray(completion: @escaping (ShopArray) -> Void, onError: ErrorClosure? = nil) {
        
        let urlString = "http://madrid-shops.com/json_new/getShops.php"
        
        DispatchQueue.global().async {
            if let url = URL(string: urlString) {
                do {
                    let data = try Data(contentsOf: url)
                    let shopJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as!ArrayShops
                    
                    let shopArray = conversJsonDictArrayToShopArray(shopJson)
                
                    DispatchQueue.main.async {
                        completion(shopArray)
                    }
                    
                } catch {
                    print("Download Error" + error.localizedDescription)
                    if let ErrorClosure = onError {
                        ErrorClosure(error)
                    }
                }
                                
            }
        }
        
    }
    
    
        
}
