import UIKit

class ViewController: UIViewController {
    @IBAction func buttonPressed() {
        isOn = !isOn
    }
 
    var isOn = true {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        view.backgroundColor = isOn ? .white : .black
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

