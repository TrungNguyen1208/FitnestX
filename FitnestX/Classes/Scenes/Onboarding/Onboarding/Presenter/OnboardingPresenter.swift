import Foundation

protocol OnboardingPresenterProtocol: AnyObject {
  var router: OnboardingRouterProtocol { get }
  var onboardingViewModels: [OnboardingViewModel] { get }
  
  init(view: OnboardingViewProtocol, router: OnboardingRouterProtocol)
  
  func onNextButtonDidTap()
  func onMoveToItem(at targetIndex: Int)
}

final class OnboardingPresenter: OnboardingPresenterProtocol {
  
  // MARK: - Private Variable
  
  private weak var view: OnboardingViewProtocol?
  private var currentIndex: Int = 0
  
  // MARK: - Public Variable
  
  public var router: OnboardingRouterProtocol
  public let onboardingViewModels: [OnboardingViewModel] = OnboardingBuilder.onboardingViewModels
  
  // MARK: - Public function
  
  init(view: OnboardingViewProtocol, router: OnboardingRouterProtocol) {
    self.view = view
    self.router = router
  }
  
  func onNextButtonDidTap() {
    let numberOfItems = onboardingViewModels.count
    if currentIndex < numberOfItems - 1 {
      currentIndex += 1
      view?.scrollToItem(at: currentIndex)
      
      let progress = Float(currentIndex + 1) / Float(numberOfItems)
      view?.setProgressRingView(progress)
    } else {
      router.navigateToLoginScreen()
    }
  }
  
  func onMoveToItem(at targetIndex: Int) {
    currentIndex = targetIndex
    let progress = Float(targetIndex + 1) / Float(onboardingViewModels.count)
    view?.setProgressRingView(progress)
  }
}
