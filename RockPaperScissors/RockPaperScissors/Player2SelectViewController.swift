import UIKit;

class Player2SelectViewController: UIViewController {
  
  open var p1Name: String!;
  open var p2Name: String!;
  open var p1Selection: String!;
  
  @IBOutlet var instructionsLabel: UILabel!
  @IBOutlet var choicesStackView: UIStackView!
  
  override func viewDidLoad() {
    super.viewDidLoad();
    instructionsLabel.text = "Hand to " + p2Name;
    choicesStackView.isHidden = true;
  }
  

  @IBAction func okTouchUp(_ sender: UIButton) {
    instructionsLabel.text = p2Name + " make your choice!";
    choicesStackView.isHidden = false;
    sender.isHidden = true;
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let vc = segue.destination as! ResultsViewController;
    vc.p1Name = p1Name;
    vc.p2Name = p2Name;
    vc.p1Selection = p1Selection;
    
    if (segue.identifier == "rock") {
      vc.p2Selection = "rock";
    }
    else if (segue.identifier == "paper") {
      vc.p2Selection = "paper";
    }
    else if (segue.identifier == "scissors") {
      vc.p2Selection = "scissors";
    }
  }
}
