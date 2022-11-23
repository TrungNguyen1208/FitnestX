import UIKit

final class NavigationController: UINavigationController {
  
  // MARK: - Private
  
  var popGestureRecognizerEnabled: Bool = false {
    didSet {
      interactivePopGestureRecognizer?.isEnabled = popGestureRecognizerEnabled
      interactivePopGestureRecognizer?.delegate = popGestureRecognizerEnabled ? self : nil
    }
  }
  
  // MARK: - Lifecycle
  
  convenience init(viewControllers: UIViewController ...) {
    self.init()
    self.setViewControllers(viewControllers, animated: false)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    popGestureRecognizerEnabled = true
    delegate = self
  }
  
  override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    if popGestureRecognizerEnabled {
      interactivePopGestureRecognizer?.isEnabled = false
    }
    
    super.pushViewController(viewController, animated: animated)
  }
}

extension NavigationController: UINavigationControllerDelegate {
  func navigationController(_ navigationController: UINavigationController,
                            didShow viewController: UIViewController,
                            animated: Bool) {
    if popGestureRecognizerEnabled {
      interactivePopGestureRecognizer?.isEnabled = true
    }
  }
}

extension NavigationController: UIGestureRecognizerDelegate {
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                         shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
  
  func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return popGestureRecognizerEnabled && viewControllers.count > 1
  }
}

protocol CanHandlePopGestureRecognizer {
  func enablePopGestureRecognizer(_ enable: Bool)
}

extension UINavigationController: CanHandlePopGestureRecognizer {
  func enablePopGestureRecognizer(_ enable: Bool) {
    if let navigationController = self as? NavigationController {
      navigationController.popGestureRecognizerEnabled = enable
    }
  }
}
