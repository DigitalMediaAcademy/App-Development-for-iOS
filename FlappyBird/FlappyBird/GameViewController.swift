import UIKit
import SpriteKit

class GameViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let skView = self.view as! SKView
    let scene = GameScene(size: skView.bounds.size)
    skView.showsFPS = true
    skView.showsNodeCount = true
    skView.ignoresSiblingOrder = true
    scene.scaleMode = .aspectFill
    skView.presentScene(scene)
    skView.showsPhysics = true;
  }
  
  override var prefersStatusBarHidden: Bool {
      return true
  }
}
