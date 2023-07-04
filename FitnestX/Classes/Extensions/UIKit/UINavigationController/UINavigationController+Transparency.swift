import Foundation
import UIKit

struct NavigationBarAppearanceOptions {
  let isTransparent: Bool?
  let titleTextAttributes: [NSAttributedString.Key: Any]?
}

extension UINavigationController {
  func makeNavBarTransparent(_ transparent: Bool = true) {
    if transparent {
      navigationBar.setBackgroundImage(UIImage(), for: .default)
      navigationBar.shadowImage = UIImage()
    } else {
      navigationBar.setBackgroundImage(nil, for: .default)
      navigationBar.shadowImage = nil
    }
    navigationBar.isTranslucent = true
  }
  
  func isNavBarTransparent() -> Bool {
    let backgroundImage = navigationBar.backgroundImage(for: .default)
    return backgroundImage != nil
  }
}

extension UINavigationBar {
  var isTransparent: Bool {
    return backgroundImage(for: .default) != nil && shadowImage != nil
  }
  
  override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    guard !isTransparent || nestedInteractiveViews(in: self, contain: point) else { return false }
    return super.point(inside: point, with: event)
  }
  
  private func nestedInteractiveViews(in view: UIView, contain point: CGPoint) -> Bool {
    if isInteractiveView(view), view.bounds.contains(convert(point, to: view)) {
      return true
    }
    
    for subview in view.subviews where nestedInteractiveViews(in: subview, contain: point) {
      return true
    }
    
    return false
  }
  
  private func isInteractiveView(_ view: UIView) -> Bool {
    guard view.isUserInteractionEnabled else { return false }
    return (view is UIControl) || !(view.gestureRecognizers?.isEmpty ?? true)
  }
}

fileprivate extension UIView {
  var isPotentiallyInteractive: Bool {
    guard isUserInteractionEnabled else { return false }
    return (self is UIControl) || hasGestureRecognizer
  }
  
  var hasGestureRecognizer: Bool {
    return !(gestureRecognizers?.isEmpty ?? true)
  }
}
