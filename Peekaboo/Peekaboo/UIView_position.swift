import UIKit;

extension UIView {
  
  open func setXPos(x: CGFloat, y: CGFloat) {
    self.frame.origin.x = x;
    self.frame.origin.y = y;
  }
}
