import Foundation

protocol OnboardingRouterProtocol {
  func navigateToLoginScreen()
}

final class OnboardingRouter: OnboardingRouterProtocol {
  
  weak var view: OnboardingViewController?
  
  func navigateToLoginScreen() {
    let vc = LoginViewController.makeMe()
    view?.navigationController?.pushViewController(vc, animated: true)
  }
}
