import Foundation

protocol OnboardingRouterProtocol {
  init(view: OnboardingViewController)
  func navigateToRegister()
}

final class OnboardingRouter: OnboardingRouterProtocol {
  
  private weak var view: OnboardingViewController?

  init(view: OnboardingViewController) {
    self.view = view
  }
  
  func navigateToRegister() {
    let vc = RegisterViewController.makeMe()
    view?.navigationController?.pushViewController(vc, animated: true)
  }
}
