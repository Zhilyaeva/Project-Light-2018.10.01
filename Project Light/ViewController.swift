import AVFoundation
import UIKit

class ViewController: UIViewController {
   @IBOutlet weak var textIfNoTorch: UITextView!
    @IBOutlet weak var FlashLight: UIImageView!
    @IBOutlet weak var background: UIImageView!
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
        let device = AVCaptureDevice.default(for: .video)
        
        if let device = device, device.hasTorch{
            textIfNoTorch.isHidden = true
            
            do {
                try device.lockForConfiguration()
                device.torchMode = isOn ? .off : .on
                FlashLight.isHighlighted = !isOn
                device.unlockForConfiguration()
            } catch {
                print (#function, error)
            }
        } else {
            view.backgroundColor = isOn ? .white : .black
            FlashLight.isHidden = true
            background.isHidden = true
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

