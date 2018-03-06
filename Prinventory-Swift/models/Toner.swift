
import UIKit

class Toner: NSObject {

    var id: Int
    var make: String
    var model: String
    var tmodel: String
    var color: String
    var black: Double
    var cyan: Double
    var yellow: Double
    var magenta: Double
    
    init(id: Int, make: String, model: String, tmodel: String, color: String, black: Double, cyan: Double, yellow: Double, magenta: Double) {
        
        self.id = id
        self.make = make
        self.model = model
        self.tmodel = tmodel
        self.color = color
        self.black = black
        self.cyan = cyan
        self.yellow = yellow
        self.magenta = magenta
    }
    
}
