import Foundation

protocol OnboardingPresenterProtocol: AnyObject {
  var onboardingViewModels: [OnboardingViewModel] { get }
  
  func onNextButtonDidTap()
  func onMoveToItem(at targetIndex: Int)
}

final class OnboardingPresenter: OnboardingPresenterProtocol {
  
  // MARK: - Injected
  
  weak var view: OnboardingViewProtocol?
  var router: OnboardingRouterProtocol!
  
  // MARK: - Public Variable
  
  public var currentIndex: Int = 0
  public let onboardingViewModels: [OnboardingViewModel] = OnboardingData.onboardingViewModels
  
  // MARK: - Public function
  
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
