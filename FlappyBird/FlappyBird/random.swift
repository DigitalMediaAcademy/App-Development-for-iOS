import UIKit;

public func random(lower: CGFloat, upper: CGFloat) -> CGFloat {
  return lower + CGFloat(arc4random_uniform(UInt32(upper - lower)));
}
