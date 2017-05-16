import UIKit

class ViewController: UIViewController {

  @IBOutlet var tealButton: UIButton!
  @IBOutlet var pinkButton: UIButton!
  @IBOutlet var limeButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad();
    
    let tealRed: CGFloat = 74.0;
    let tealGreen: CGFloat = 237.0;
    let tealBlue: CGFloat = 237.0;
    let tealRedRatio: CGFloat = tealRed / 255.0;
    let tealGreenRatio: CGFloat = tealGreen / 255.0;
    let tealBlueRatio: CGFloat = tealBlue / 255.0
    
    tealButton.backgroundColor = UIColor(red: tealRedRatio, green: tealGreenRatio, blue: tealBlueRatio, alpha: 1.0);
    
    tealButton.layer.borderColor = UIColor.black.cgColor;
    tealButton.layer.borderWidth = 2;
    
    let pinkRed: CGFloat = 237.0;
    let pinkGreen: CGFloat = 74.0;
    let pinkBlue: CGFloat = 156.0;
    let pinkRedRatio: CGFloat = pinkRed / 255.0;
    let pinkGreenRatio: CGFloat = pinkGreen / 255.0;
    let pinkBlueRatio: CGFloat = pinkBlue / 255.0;
    
    pinkButton.backgroundColor = UIColor(red: pinkRedRatio, green: pinkGreenRatio, blue: pinkBlueRatio, alpha: 1.0);
    
    pinkButton.layer.borderColor = UIColor.black.cgColor;
    pinkButton.layer.borderWidth = 2;
    
    let limeRed: CGFloat = 74.0;
    let limeGreen: CGFloat = 237.0;
    let limeBlue: CGFloat = 155.0;
    let limeRedRatio: CGFloat = limeRed / 255.0;
    let limeGreenRatio: CGFloat = limeGreen / 255.0;
    let limeBlueRatio: CGFloat = limeBlue / 255.0;
    
    limeButton.backgroundColor = UIColor(red: limeRedRatio, green: limeGreenRatio, blue: limeBlueRatio, alpha: 1.0);
    
    limeButton.layer.borderColor = UIColor.black.cgColor;
    limeButton.layer.borderWidth = 2;
    
  }

  @IBAction func touchUpTealButton(_ sender: UIButton) {
    self.view.backgroundColor = sender.backgroundColor;
  }

  @IBAction func touchUpLimeButton(_ sender: UIButton) {
    self.view.backgroundColor = sender.backgroundColor;
  }
  
  @IBAction func touchUpPinkButton(_ sender: UIButton) {
    self.view.backgroundColor = sender.backgroundColor;
  }
}
