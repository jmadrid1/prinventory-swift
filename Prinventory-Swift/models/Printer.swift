
import UIKit

class Printer: NSObject {
    
    var id: Int
    var make: String
    var model: String
    var tmodel: String
    var serial: String
    var status: String
    var color: String
    var owner: String
    var department: String
    var location: String
    var floor: String
    var ip: String
    
    
    init(id: Int, make: String, model: String, tmodel: String, serial: String, status: String, color: String, owner: String, department: String, location: String, floor: String, ip: String) {
        
        self.id = id
        self.make = make
        self.model = model
        self.tmodel = tmodel
        self.serial = serial
        self.status = status
        self.color = color
        self.owner = owner
        self.department = department
        self.location = location
        self.floor = floor
        self.ip = ip
    }

}
