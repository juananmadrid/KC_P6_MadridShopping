import Foundation
import UIKit

public class Shop {
    
    let _name: String
    let _description_es: String
    let _description_en: String
    let _address: String
    let _logo: UIImage
    let _image: UIImage
    let _gps_lat: String
    let _gps_lon: String
    
    
    init (name: String, description_es: String, description_en: String, address: String, logo: UIImage, image: UIImage, gps_lat: String, gps_lon: String) {
        
        _name = name
        _description_es = description_es
        _description_en = description_en
        _address = address
        _logo = logo
        _image = image
        _gps_lat = gps_lat
        _gps_lon = gps_lon
    }


}
