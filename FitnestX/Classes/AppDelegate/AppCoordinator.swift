import Foundation
import UIKit

enum AppCoordinatorState: Equatable {
  case firstLaunch
  case loggedIn
  case loggedOut
}

protocol AppCoordinator: AnyObject {
  var state: AppCoordinatorState { get }
  
  func setup(with window: UIWindow)
  func launch()
}

final class AppCoordinatorImpl: AppCoordinator {
  
  // MARK: - Injected
  
  var rootViewControllerProvider: RootViewControllerProvider!
  var rootControllerPresenter: RootControllerPresenter!
  var notificationCenterService: NotificationCenterService!
  
  // MARK: - Public Variables

  private(set) var state: AppCoordinatorState = .firstLaunch
  
  // MARK: - Lifecycle
  
  deinit {
    notificationCenterService.removeObserver(self)
  }
  
  // MARK: - Public
  
  func setup(with window: UIWindow) {
    rootControllerPresenter.window = window
  }
  
  func launch() {
    setupObservers()
    let launchState = AppCoordinatorState.firstLaunch
    switchToState(launchState, animated: false)
  }
}

// MARK: - Private

private extension AppCoordinatorImpl {
  func setupObservers() {
    notificationCenterService.addObserver(self, forName: AccountNotifications.authorizationCompleted) { [weak self] _ in
      guard let strongSelf = self else { return }
      let state = AppCoordinatorState.loggedIn
      strongSelf.switchToState(state, animated: true)
    }
  }
  
  func stateForLaunch() -> AppCoordinatorState {
    // Logic check login or logout or need update app, ... => then show move to correct screen
    return .firstLaunch
  }
  
  func switchToState(_ updatedState: AppCoordinatorState, animated: Bool) {
    var animation: RootControllerPresenterAnimation = .none
    let rootViewController = rootViewControllerProvider.rootViewController(state: updatedState)
    
    if animated {
      switch updatedState {
      case .firstLaunch, .loggedOut:
        animation = .flipFromLeft
      case .loggedIn:
        animation = .flipFromRight
      }
    }
    
    state = updatedState
    rootControllerPresenter.switchToViewController(rootViewController, animation: animation, completion: nil)
  }
}
