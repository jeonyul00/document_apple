import UIKit

class Shoe:CustomStringConvertible {
    var description: String { return "shoe color : \(color), size : \(size), hasLaces : \(hasLaces)" }
    let color: String
    let size: Int
    let hasLaces:Bool
    
    init(color: String, size: Int, hasLaces: Bool) {
        self.color = color
        self.size = size
        self.hasLaces = hasLaces
    }
}

let shoe1 = Shoe(color: "red", size: 240, hasLaces: true)
let shoe2 = Shoe(color: "blue", size: 260, hasLaces: false)

print(shoe1)
print(shoe2)
