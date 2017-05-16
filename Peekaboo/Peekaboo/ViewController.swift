import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var homerButton: UIButton!
  @IBOutlet var margeButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad();

    let width = self.view.frame.width;
    let height = self.view.frame.height;
    
    let homerXPos = random(lower: 0, upper: width - homerButton.frame.width);
    let homerYPos = random(lower: 0, upper: height - homerButton.frame.height);
    
    homerButton.setXPos(x: homerXPos, y: homerYPos);
    margeButton.isHidden = true;
  }


  @IBAction func homerTouchUpInside(_ sender: UIButton) {
    homerButton.isHidden = true;
    
    let width = self.view.frame.width;
    let height = self.view.frame.height;

    let margeXPos = random(lower: 0, upper: width - margeButton.frame.width);
    let margeYPos = random(lower: 0, upper: height - margeButton.frame.height);

    margeButton.setXPos(x: margeXPos, y: margeYPos);
    margeButton.isHidden = false;
  }
  
  func decideButtonPosition(button: UIButton) {
    let width = self.view.frame.width;
    let height = self.view.frame.height;
    
    let xPos = random(lower: 0, upper: width - button.frame.width);
    let yPos = random(lower: 0, upper: height - button.frame.height);
    
    button.setXPos(xPos);
    button.setYPos(yPos);
  }
  
}

