import Foundation

class MemoGame {
    
    // VARIABLES - ATTRIBUTES
    var cards = [Card]()
    var indexOfSoloFaceUpCard: Int?
    var countMatched = 0
    var numberFaceUp = 0
    
    
    // CONSTRUCTOR
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        for i in 1...numberOfPairsOfCards {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            let temp_card = cards[i]
            cards[i] = cards[randomIndex]
            cards[randomIndex] = temp_card
        }
    }
    
    
    // FUNCTIONS
    func chooseCard(index: Int) {
        if !(cards[index].isMatched) {
            if let i = indexOfSoloFaceUpCard, i != index {
                if cards[index].id == cards[i].id {
                    cards[index].isMatched = true
                    cards[i].isMatched = true
                    countMatched += 2
                }
                cards[index].isFaceUp = true
                numberFaceUp += 1
                indexOfSoloFaceUpCard = nil
            } else {
                for j in cards.indices {
                    if cards[j].isFaceUp {
                        cards[j].isFaceUp = false
                        numberFaceUp -= 1
                    }
                }
                cards[index].isFaceUp = true
                numberFaceUp += 1
                indexOfSoloFaceUpCard = index
            }
        }
        // print("number face up: \(numberFaceUp)")
    }
    
    
    
    
    
}
