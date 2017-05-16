import UIKit;

class ViewController: UIViewController {

  var activeEmojiButton: UIButton!;
  
  @IBOutlet var emojiLabel: UILabel!
  @IBOutlet var emojiTextField: UITextField!
  @IBOutlet var emojiChangeButton: UIButton!
  @IBOutlet var emojiSizeSlider: UISlider!
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    emojiLabel.isHidden = true;
    emojiTextField.isHidden = true;
    emojiChangeButton.isHidden = true;
  }
  
  @IBAction func emojiTouchUpInside(_ sender: UIButton) {
    if (activeEmojiButton != nil) {
      activeEmojiButton.layer.shadowOpacity = 0.0;
    }
    
    activeEmojiButton = sender;
    
    // Resize slider to the size of the emoji
    emojiSizeSlider.value = Float(activeEmojiButton.titleLabel!.font.pointSize);
    
    // Add shadow
    activeEmojiButton.layer.shadowColor = UIColor.black.cgColor;
    activeEmojiButton.layer.shadowOffset = CGSize(width: 3, height: 3);
    activeEmojiButton.layer.shadowOpacity = 0.5;
    activeEmojiButton.layer.shadowRadius = 0.0;
    
    emojiLabel.isHidden = false;
    emojiTextField.isHidden = false;
  }
  
  @IBAction func textFieldChanged(_ sender: UITextField) {
    if (sender.text!.characters.count > 0) {
      emojiChangeButton.isHidden = false;
    } else {
      emojiChangeButton.isHidden = true;
    }
  }
  
  @IBAction func changeTouchUpInside(_ sender: UIButton) {
    if (activeEmojiButton != nil) {
      activeEmojiButton.setTitle(emojiTextField.text, for: .normal);
      emojiTextField.text = nil;
      emojiChangeButton.isHidden = true;
      view.endEditing(true);
    }
  }
  
  @IBAction func sliderChanged(_ sender: UISlider) {
    if (activeEmojiButton != nil) {
      let newFont = activeEmojiButton.titleLabel?.font.withSize(CGFloat(sender.value));
      activeEmojiButton.titleLabel?.font = newFont;
    }
  }
}

