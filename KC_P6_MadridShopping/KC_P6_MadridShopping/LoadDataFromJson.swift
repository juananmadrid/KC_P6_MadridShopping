import Foundation
import UIKit
import CoreData


enum JSONErrors : Error{
    case noData(name:String)
    case invalidData(name: String, value: String)
    case wrongURLFormatForJSONResource
    
    case emptyJSONObject
    case emptyJSONArray
}


// Cargamos datos en CoreData desde tienda (dicccionario)
public func uploadShop(dict: JsonDictionary, context: NSManagedObjectContext) throws -> Void {
    
    // Validamos datos
    
    try validate(dictionary: dict)
    
    guard let urlString_image = dict["img"] as? String,
        let urlString_logo = dict["logo_img"] as? String
            else{
            throw JSONErrors.wrongURLFormatForJSONResource
    }
    
    // Obtenemos datos
    
    let id = dict["id"] as! String
    let name = dict["name"] as! String
    let address = dict["address"] as! String
    let gps_lon = dict["gps_lon"] as! String
    let gps_lat = dict["gps_lat"] as! String
    let description_es = dict["description_es"] as! String
    let description_en = dict["description_en"] as! String
    

    // Descargamos imagenes
    
    downloadImage(urlString: urlString_image, completion: { (image) in
        
        let img = image
        
        downloadImage(urlString: urlString_logo, completion: { (logo) in
            let img_logo = logo
            
            // Cargamos datos en Core Data
            let shop = Shop(context: context)
            shop.id = id
            shop.name = name
            shop.address = address
            shop.gps_lon = gps_lon
            shop.gps_lat = gps_lat
            shop.description_es = description_es
            shop.description_en = description_en
            shop.image = img
            shop.logo = img_logo
            
        })
    })
    
}



// Cargamos datos en CoreData desde array de tiendas
public func uploadJson(jsonArray: JsonArray, context: NSManagedObjectContext) throws -> Void {
    
    for shop in jsonArray {
        try uploadShop(dict: shop , context: context)
    }
    
}




private
func validate(dictionary dict: JsonDictionary) throws{
    
    func noData() throws{
        for key in dict.keys{
            guard let value = dict[key] as? String else{          // clave vacia
                throw JSONErrors.noData(name: key)
            }
            guard value.characters.count > 0  else {   // clave no válida
                throw JSONErrors.invalidData(name: key, value: value)
            }
        }
    }
    
    try noData()
    
}

