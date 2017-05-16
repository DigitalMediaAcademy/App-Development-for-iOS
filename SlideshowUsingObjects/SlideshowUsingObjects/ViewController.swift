import UIKit;

class ViewController: UIViewController {
  
var photos = ["cave", "cubs", "dolphins", "starfish", "whale"];
var captions = [
  "Oooooo... what's inside that scary looking cave?! 😱",
  "Awwwww... they're so CUTE! 😍",
  "Juuuuuuump! 🐬",
  "Just keep swimming! 🐠",
  "Can you speak whale? 🐳"
];
  
var slides = [
  Slide(name: "cave", text: "Oooooo... what's inside that scary looking cave?! 😱")
];
  
  var index = 0;
  
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var captionLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad();
    
    let slide = slides[index];
    let image = UIImage(named: slide.photoName);
    imageView.image = image;
    captionLabel.text = slide.captionText;
  }
  
  @IBAction func previousTouchUp(_ sender: UIButton) {
    if (index - 1 < 0) {
      index = slides.count - 1;
    }
    else {
      index = index - 1;
    }
    
    let slide = slides[index];
    let image = UIImage(named: slide.photoName);
    imageView.image = image;
    captionLabel.text = slide.captionText;
  }
  
  @IBAction func nextTouchUp(_ sender: UIButton) {
if (index + 1 >= slides.count) {
  index = 0;
}
else {
  index = index + 1;
}
    
    let slide = slides[index];
    let image = UIImage(named: slide.photoName);
    imageView.image = image;
    captionLabel.text = slide.captionText;
  }
}

