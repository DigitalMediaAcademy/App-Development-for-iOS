import UIKit;

class Player1SelectViewController: UIViewController {
  
  open var p1Name: String!;
  open var p2Name: String!;
  
  @IBOutlet var instructionsLabel: UILabel!
  @IBOutlet var choicesStackView: UIStackView!
  
  override func viewDidLoad() {
    super.viewDidLoad();
    
    instructionsLabel.text = "Hand to " + p1Name;
    choicesStackView.isHidden = true;
  }
  
  @IBAction func okTouchUp(_ sender: UIButton) {
    instructionsLabel.text = p1Name + " make your choice!";
    choicesStackView.isHidden = false;
    sender.isHidden = true;
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let vc = segue.destination as! Player2SelectViewController;
    vc.p1Name = p1Name;
    vc.p2Name = p2Name;
    
    if (segue.identifier == "rock") {
      vc.p1Selection = "rock";
    }
    else if (segue.identifier == "paper") {
      vc.p1Selection = "paper";
    }
    else if (segue.identifier == "scissors") {
      vc.p1Selection = "scissors";
    }
  }
}
