import UIKit

class ViewController: UIViewController {
  @IBOutlet var hoc: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    hoc.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2);
  }
}

