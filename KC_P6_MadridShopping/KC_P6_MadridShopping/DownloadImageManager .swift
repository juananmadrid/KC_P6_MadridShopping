import Foundation
import UIKit


public func downloadImage(urlString: String, completion: @escaping (UIImage) -> Void, onError: ErrorClosure? = nil) {
    
    DispatchQueue.global().async {
        
        if let url = URL(string: urlString) {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    completion(image!)
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
    
