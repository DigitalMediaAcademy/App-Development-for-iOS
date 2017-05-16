import UIKit;

class ViewController: UIViewController {

  @IBOutlet var player1NameTextField: UITextField!
  @IBOutlet var player2NameTextField: UITextField!
  @IBOutlet var errorLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    errorLabel.isHidden = true;
  }

  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    
    if (identifier == "player1Select") {
      let p1Name = player1NameTextField.text!;
      let p2Name = player2NameTextField.text!;
      
      if (p1Name.characters.count > 0 && p2Name.characters.count > 0) {
        return true;
      }
      else {
        // Tell the user to enter names1
        errorLabel.isHidden = false;
        return false;
      }
    }
    
    return true;
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "player1Select") {
      let vc = segue.destination as! Player1SelectViewController;
      vc.p1Name = player1NameTextField.text!;
      vc.p2Name = player2NameTextField.text!;
    }
  }
}

