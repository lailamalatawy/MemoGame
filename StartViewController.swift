import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func touchStartButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toLevel1", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 30
        
    }

    

}
