import UIKit

extension UITabBarController {
  func rootViewControllers() -> [UIViewController] {
    var result: [UIViewController] = []
    if let viewControllers = viewControllers {
      for i in 0..<viewControllers.count {
        if let viewController = rootViewControllerAtIndex(i) {
          result.append(viewController)
        }
      }
    }
    return result
  }
  
  func rootViewControllerAtIndex(_ index: Int) -> UIViewController? {
    guard let viewControllers = viewControllers, index < viewControllers.count else {
      return nil
    }
    var viewController = viewControllers[index]
    if let navigationController = viewController as? UINavigationController {
      viewController = navigationController.viewControllers[0]
    }
    return viewController
  }
}
