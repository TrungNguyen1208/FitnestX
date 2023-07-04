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
      return makeDashboardScreen()
    }
  }
}

private extension RootViewControllerProviderImpl {
  func makeLandingScreen() -> NavigationController {
    let landingVC = LandingViewController.makeMe()
    let navigation = NavigationController(viewControllers: landingVC)
    navigation.setNavigationBarHidden(true, animated: false)
    return navigation
  }
  
  func makeDashboardScreen() -> NavigationController {
    let dashboardVC = DashboardBuilder.build()
    let navigation = NavigationController(viewControllers: dashboardVC)
    navigation.setNavigationBarHidden(true, animated: false)
    return navigation
  }
}
