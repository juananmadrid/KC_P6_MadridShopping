import UIKit

public typealias JsonDictionary = Dictionary<String, Any>
public typealias JsonArray = [JsonDictionary]
public typealias ShopArray = [Shop]

public typealias ErrorClosure = (Error) -> Void

class ShopAPIManager {

    public func downloadJsonArray(completion: @escaping (JsonArray) -> Void, onError: ErrorClosure? = nil) {
        
        let urlString = "http://madrid-shops.com/json_new/getShops.php"
        
        DispatchQueue.global().async {
            if let url = URL(string: urlString) {
                do {
                    let data = try Data(contentsOf: url)
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as!Dictionary<String, Any>
                    
                    let jsonArray = json["result"]! as! JsonArray
                    
                    self.flagShopsDownloadEnd(true)
                    
                    DispatchQueue.main.async {
                        completion(jsonArray)
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
    
    func flagShopsDownloadEnd(_ flag: Bool){
        let defaults = UserDefaults.standard
        defaults.set(flag, forKey: "ShopsDownloadEnd")
    }
    
        
}
