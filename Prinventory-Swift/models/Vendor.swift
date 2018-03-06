
import UIKit

class Vendor: NSObject {

    var id: Int
    var name: String
    var phone: String
    var email: String
    var street: String
    var city: String
    var state: String
    var zipcode: String
    
    init(id: Int, name: String, phone: String, email: String, street: String, city: String, state: String, zipcode: String) {
        
        self.id = id
        self.name = name
        self.phone = phone
        self.email = email
        self.street = street
        self.city = city
        self.state = state
        self.zipcode = zipcode
    }
    
}
