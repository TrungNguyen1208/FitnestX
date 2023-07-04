import Foundation
import UIKit

extension UIViewController {
  static func makeMe() -> Self {
    let className = String(describing: self.classForCoder())
    let storyboard = UIStoryboard(name: className, bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: className) as! Self
    return controller
  }
  
  func addChildViewController(_ viewController: UIViewController, andPinToEdgesOf view: UIView) {
    addChild(viewController)
    view.addSubview(viewController.view)
    viewController.view.pinViewToEdgesOfSuperview()
    viewController.didMove(toParent: self)
  }
  
  func removeChildFromParent() {
    willMove(toParent: nil)
    view.removeFromSuperview()
    removeFromParent()
  }
  
  var isRootViewController: Bool {
    return navigationController?.viewControllers.first == self
  }
  
  var isModal: Bool {
    return self.presentingViewController?.presentedViewController == self
      || (self.navigationController != nil &&
            self.navigationController?.presentingViewController?.presentedViewController ==
            self.navigationController && self.navigationController?.viewControllers.first == self)
      || self.tabBarController?.presentingViewController is UITabBarController
  }
  
  var statusBarHeight: CGFloat {
    var statusBar: CGFloat = 0.0
    if #available(iOS 13, *) {
      let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
      statusBar = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    } else {
      statusBar = UIApplication.shared.statusBarFrame.height
    }
    return statusBar
  }
  
  // Height of status bar + navigation bar (if navigation bar exist)
  var topBarHeight: CGFloat {
    let navigationHeight = navigationController?.navigationBar.frame.height ?? 0.0
    return navigationHeight + statusBarHeight
  }
  
  var tabBarHeight: CGFloat {
    if tabBarController?.tabBar.isHidden ?? true { return 0 }
    return tabBarController?.tabBar.frame.size.height ?? 0
  }
  
  class func initWithNibTemplate<T>() -> T {
    let nibName = String(describing: self)
    let viewcontroller = self.init(nibName: nibName, bundle: Bundle.main)
    return viewcontroller as! T
  }
  
  class func initWithNibTemplate<T>(nibName: String) -> T {
    let viewcontroller = self.init(nibName: nibName, bundle: Bundle.main)
    return viewcontroller as! T
  }
}
