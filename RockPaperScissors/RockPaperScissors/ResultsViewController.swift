import UIKit;

class ResultsViewController: UIViewController {
  
  open var p1Name: String!;
  open var p2Name: String!;
  open var p1Selection: String!;
  open var p2Selection: String!;
  
  @IBOutlet var resultsLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad();
  
    if (p1Selection == "rock") {
      if (p2Selection == "rock") {
        resultsLabel.text = "Rock and rock... Draw!";
      }
      else if (p2Selection == "paper") {
        resultsLabel.text = "Paper covers rock...\n" + p2Name + " wins!";
      }
      else if (p2Selection == "scissors") {
        resultsLabel.text = "Rock beats scissors...\n" + p1Name + " wins!";
      }
    }
    else if (p1Selection == "paper") {
      if (p2Selection == "rock") {
        resultsLabel.text = "Paper covers rock...\n" + p1Name + " wins!";
      }
      else if (p2Selection == "paper") {
        resultsLabel.text = "Paper and paper... Draw!";
      }
      else if (p2Selection == "scissors") {
        resultsLabel.text = "Scissors cuts paper...\n" + p2Name + " wins!";
      }
    }
    else if (p1Selection == "scissors") {
      if (p2Selection == "rock") {
        resultsLabel.text = "Rock beats scissors...\n" + p2Name + " wins!";
      }
      else if (p2Selection == "paper") {
        resultsLabel.text = "Scissors cuts paper...\n" + p1Name + " wins!";
      }
      else if (p2Selection == "scissors") {
        resultsLabel.text = "Scissors and scissors... Draw!";
      }
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let vc = segue.destination as! Player1SelectViewController;
    vc.p1Name = p1Name;
    vc.p2Name = p2Name;
  }
}
