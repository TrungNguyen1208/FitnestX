import Foundation
import UIKit

extension UIPageViewController {
  func goToNextPage(animated: Bool = true) {
    guard let currentViewController = self.viewControllers?.first else { return }
    guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else { return }
    setViewControllers([nextViewController], direction: .forward, animated: animated, completion: nil)
  }
  
  func goToPreviousPage(animated: Bool = true) {
    guard let currentViewController = self.viewControllers?.first else { return }
    guard let previousViewController = dataSource?.pageViewController(self, viewControllerBefore: currentViewController) else { return }
    setViewControllers([previousViewController], direction: .reverse, animated: animated, completion: nil)
  }
  
  func scrollToPage(pageIndex: Int, viewControllers: [UIViewController], animated: Bool = false) {
    if pageIndex < 0 { return }
    if pageIndex < viewControllers.count {
      self.setViewControllers([viewControllers[pageIndex]],
                                             direction: .forward,
                                             animated: animated,
                                             completion: nil)
    }
  }
}
