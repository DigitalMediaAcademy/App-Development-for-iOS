import UIKit;

class ViewController: UIViewController {

  var photos = ["cave", "cubs", "dolphins", "starfish", "whale"];
  var index = 0;
  
  @IBOutlet var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad();
    
    let defaultPhotoName = photos[index];
    let image = UIImage(named: defaultPhotoName);
    imageView.image = image;
  }

  @IBAction func previousTouchUp(_ sender: UIButton) {
    if (index - 1 < 0) {
      index = photos.count - 1;
    }
    else {
    	index = index - 1;
    }
    
    let photoName = photos[index];
    let image = UIImage(named: photoName);
    imageView.image = image;
  }

  @IBAction func nextTouchUp(_ sender: UIButton) {
    if (index + 1 >= photos.count) {
      index = 0;
    }
    else {
      index = index + 1;
    }
    
    let photoName = photos[index];
    let image = UIImage(named: photoName);
    imageView.image = image;
  }
}

