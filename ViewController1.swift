import UIKit

class ViewController1: UIViewController {
    
    // GLOBAL VARIABLES
    lazy var game = MemoGame(numberOfPairsOfCards: ((cardButtons.count + 1)/2))
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "flips: \(flipCount)"
        }
    }
    
    var emojiChoices = ["👻", "☠️", "🔮", "🎃", "⚔️", "⚰️", "🙀", "😈", "🧠", "🦇"]
    var emoji = [Int:String]()
    
    
    
    // INSTANCE VARIABLES
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextLevelButton: UIButton!
    
    // ACTIONS
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            if !(cardButtons[cardNumber].backgroundColor == #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0)) {
                game.chooseCard(index: cardNumber)
                updateView()
                if !(game.numberFaceUp == 2) {
                    flipCount += 1
                }
            }
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    @IBAction func touchNewGame(_ sender: UIButton) {
        emoji = [Int:String]()
        emojiChoices = ["👻", "☠️", "🔮", "🎃", "⚔️", "⚰️", "🙀", "😈", "🧠", "🦇"]
        game = MemoGame(numberOfPairsOfCards: ((cardButtons.count + 1)/2))
        flipCount = 0
        self.viewDidLoad()
        self.loadView()
    }
    
    @IBAction func touchNextLevel(_ sender: UIButton) {
        performSegue(withIdentifier: "toLevel2", sender: self)
    }
    
    // FUNCTIONS
    func updateView() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(setEmoji(card: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        
        if game.countMatched == cardButtons.count {
            for index in cardButtons.indices {
                cardButtons[index].setTitle("", for: UIControlState.normal)
                cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0)
            }
            nextLevelButton.isHidden = false
            nextLevelButton.layer.cornerRadius = 30
            newGameButton.layer.cornerRadius = 30
            newGameButton.isHidden = false
            let score = 300 - flipCount
            scoreLabel.text = "Score: \(score)"
            scoreLabel.isHidden = false
            flipCountLabel.isHidden = true
        }
    }
    
    
    func setEmoji(card: Card) -> String {
        if emoji[card.id] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.id] =  emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.id] ?? "?"
    }
    
    
}


