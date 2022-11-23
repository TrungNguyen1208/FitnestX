import Foundation
import UIKit

protocol RootViewControllerProvider {
  func rootViewController(state: AppCoordinatorState) -> UIViewController
}

final class RootViewControllerProviderImpl: RootViewControllerProvider {
  // MARK: - Public
  
  func rootViewController(state: AppCoordinatorState) -> UIViewController {
    switch state {
    case .firstLaunch, .loggedOut:
      return makeLandingScreen()
    case .loggedIn:
      return makeHomeScreen()
    }
  }
}

private extension RootViewControllerProviderImpl {
  func makeLandingScreen() -> NavigationController {
    let landingVC = UIViewController()
    let navigation = NavigationController(viewControllers: landingVC)
    navigation.setNavigationBarHidden(true, animated: false)
    return navigation
  }
  
  func makeHomeScreen() -> NavigationController {
    let homeVC = UIViewController()
    let navigation = NavigationController(viewControllers: homeVC)
    navigation.setNavigationBarHidden(true, animated: false)
    return navigation
  }
  
  func makeDashboardScreen() -> NavigationController {
    let dashboardVC = UIViewController()
    let navigation = NavigationController(viewControllers: dashboardVC)
    navigation.setNavigationBarHidden(true, animated: false)
    return navigation
  }
}
