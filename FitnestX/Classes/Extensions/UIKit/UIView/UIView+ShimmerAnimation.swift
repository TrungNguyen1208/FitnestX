import Foundation
import UIKit

extension UIView {
  func addGradientLayer() -> CAGradientLayer {
    let gradientColorOne: CGColor = UIColor(white: 0.85, alpha: 1.0).cgColor
    let gradientColorTwo: CGColor = UIColor(white: 0.95, alpha: 1.0).cgColor
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.bounds
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    gradientLayer.colors = [gradientColorOne, gradientColorTwo, gradientColorOne]
    gradientLayer.locations = [0.0, 0.5, 1.0]
    gradientLayer.name = "shimmerLayer"
    self.layer.addSublayer(gradientLayer)
    return gradientLayer
  }
  
  func addAnimation() -> CABasicAnimation {
    let animation = CABasicAnimation(keyPath: "locations")
    animation.fromValue = [-1.0, -0.5, 0.0]
    animation.toValue = [1.0, 1.5, 2.0]
    animation.repeatCount = .infinity
    animation.duration = 0.9
    return animation
  }
  
  func startShimmerAnimating() {
    guard (self.layer.sublayers?.filter({ $0.name == "shimmerLayer" }).first) == nil else { return }
    let gradientLayer = addGradientLayer()
    let animation = addAnimation()
    gradientLayer.add(animation, forKey: animation.keyPath)
  }
  
  func stopShimmerAnimation() {
    self.layer.sublayers?.filter { $0.name == "shimmerLayer" }.forEach { $0.removeFromSuperlayer() }
  }
}
