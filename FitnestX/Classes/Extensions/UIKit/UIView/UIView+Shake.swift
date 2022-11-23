import UIKit

extension UIView {
  
  func shake(with duration: TimeInterval = 0.3) {
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    animation.duration = duration
    animation.values = [ -5.0, 5.0, -2.0, 2.0, 0.0 ]
    layer.add(animation, forKey: "shake")
  }
}
