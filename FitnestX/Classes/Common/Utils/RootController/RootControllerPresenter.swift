import Foundation
import UIKit

protocol RootControllerPresenter {
  var window: UIWindow! { get set }
  
  func switchToViewController(_ viewController: UIViewController,
                              animation: RootControllerPresenterAnimation,
                              completion: (() -> Void)?)
}

enum RootControllerPresenterAnimation {
  case none, crossDissolve, flipFromLeft, flipFromRight
  
  func animationOptions() -> UIView.AnimationOptions? {
    switch self {
    case .none:
      return nil
    case .crossDissolve:
      return .transitionCrossDissolve
    case .flipFromLeft:
      return .transitionFlipFromLeft
    case .flipFromRight:
      return .transitionFlipFromRight
    }
  }
  
  func duration() -> Double {
    switch self {
    default:
      return 0.5
    }
  }
}

final class RootControllerPresenterImpl: RootControllerPresenter {
  
  // MARK: - Variables
  
  var window: UIWindow!

  // MARK: - Public
  
  func switchToViewController(_ viewController: UIViewController,
                              animation: RootControllerPresenterAnimation,
                              completion: (() -> Void)? = nil) {
    let transitionBlock = {
      if let animationOptions = animation.animationOptions() {
        UIView.transition(with: self.window,
                          duration: animation.duration(),
                          options: animationOptions,
                          animations: {
                            self.window.rootViewController = viewController
        },
                          completion: { _ in
                            completion?()
        })
      } else {
        self.window.rootViewController = viewController
        completion?()
      }
    }
    
    transitionBlock()
  }
}
