import Foundation

struct Card {
    
    // VARIABLES - ATTRIBUTES
    var isFaceUp = false
    var isMatched = false
    var id: Int
    
    static var num = 0
    
    
    // CONSTRUCTOR
    init() {
        self.id = Card.getUniqueID()
    }
    
    
    // FUNCTIONS
    static func getUniqueID() -> Int {
        num += 1
        return num;
    }
    
}
