import Foundation
import UIKit

extension UIViewController {
  
  func topVisibleViewController() -> UIViewController? {
    if let tabBarViewController = self as? UITabBarController {
      return tabBarViewController.selectedViewController?.topVisibleViewController()
    } else if let navigationController = self as? UINavigationController {
      return navigationController.visibleViewController?.topVisibleViewController()
    } else if let presentedViewController = presentedViewController {
      return presentedViewController.topVisibleViewController()
    } else if children.isNotEmpty {
      // May not return the right topVisibleViewController if self is a custom container vc.
      return children.last?.topVisibleViewController()
    }
    return self
  }
}
