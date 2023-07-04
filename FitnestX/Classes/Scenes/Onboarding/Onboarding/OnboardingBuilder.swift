import Foundation

final class OnboardingBuilder {
  
  public static func build() -> OnboardingViewController {
    let view = OnboardingViewController.makeMe()
    let router = OnboardingRouter(view: view)
    let presenter = OnboardingPresenter(view: view, router: router)
    view.presenter = presenter
    return view
  }
  
}
