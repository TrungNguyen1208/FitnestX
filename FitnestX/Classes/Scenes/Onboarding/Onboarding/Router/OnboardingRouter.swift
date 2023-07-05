import Foundation

protocol OnboardingRouterProtocol {
  init(view: OnboardingViewController)
  func navigateToLoginScreen()
}

final class OnboardingRouter: OnboardingRouterProtocol {
  
  private weak var view: OnboardingViewController?

  init(view: OnboardingViewController) {
    self.view = view
  }
  
  func navigateToLoginScreen() {
    let vc = LoginBuilder.build()
    view?.navigationController?.pushViewController(vc, animated: true)
  }
}
