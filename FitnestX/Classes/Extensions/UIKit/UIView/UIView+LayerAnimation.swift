import UIKit

extension UIView {

  fileprivate struct Constants {
    static let fade = "fadeTransition"
    static let bottom = "bottomTransition"
  }
  
  func animateFadeTransition(duration: Double = 0.3, delay: Double = 0, name: String = Constants.fade) {
    let animation = CATransition()
    animation.timeOffset = delay
    animation.duration = duration
    animation.type = CATransitionType.fade
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    self.layer.add(animation, forKey: name)
  }
  
  func animateBottomTransition(duration: Double = 0.3, delay: Double = 0, name: String = Constants.bottom) {
    let animation = CATransition()
    animation.timeOffset = delay
    animation.duration = duration
    animation.type = CATransitionType.push
    animation.subtype = CATransitionSubtype.fromTop
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    self.layer.add(animation, forKey: name)
  }
}

extension UIView {
  /**
   Zoom in any view with specified offset magnification.
   
   - parameter duration:     animation duration.
   - parameter easingOffset: easing offset.
   */
  func zoomInWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2) {
      let easeScale = 1.0 + easingOffset
      let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
      let scalingDuration = duration - easingDuration
      UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseIn, animations: { () -> Void in
          self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
      }, completion: { (_: Bool) -> Void in
          UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
              self.transform = CGAffineTransform.identity
          }, completion: { (_: Bool) -> Void in
          })
      })
  }
}
