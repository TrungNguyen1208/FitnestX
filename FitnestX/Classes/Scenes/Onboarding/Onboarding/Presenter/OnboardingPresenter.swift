import Foundation

protocol OnboardingPresenterProtocol: AnyObject {
  var router: OnboardingRouterProtocol { get }
  var onboardingViewModels: [OnboardingViewModel] { get }
  
  init(view: OnboardingViewProtocol, router: OnboardingRouterProtocol)
  
  func onViewDidLoad()
  func onNextButtonDidTap()
  func onMoveToItem(at targetIndex: Int)
}

final class OnboardingPresenter: OnboardingPresenterProtocol {
  
  // MARK: - Private Variable
  
  private weak var view: OnboardingViewProtocol?
  private var currentIndex: Int = 0
  
  // MARK: - Public Variable
  
  public var router: OnboardingRouterProtocol
  public let onboardingViewModels: [OnboardingViewModel] = [
    OnboardingViewModel(
      image: R.image.onboardingStep1.name,
      title: "Track Your Goal",
      subtitle: "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals"
    ),
    OnboardingViewModel(
      image: R.image.onboardingStep2.name,
      title: "Get Burn",
      subtitle: "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever"
    ),
    OnboardingViewModel(
      image: R.image.onboardingStep3.name,
      title: "Eat Well",
      subtitle: "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun"
    ),
    OnboardingViewModel(
      image: R.image.onboardingStep4.name,
      title: "Improve Sleep\nQuality",
      subtitle: "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning"
    )
  ]
  
  // MARK: - Public function
  
  init(view: OnboardingViewProtocol, router: OnboardingRouterProtocol) {
    self.view = view
    self.router = router
  }
  
  func onViewDidLoad() {
    
  }
  
  func onNextButtonDidTap() {
    let numberOfItems = onboardingViewModels.count
    if currentIndex < numberOfItems - 1 {
      currentIndex += 1
      view?.scrollToItem(at: currentIndex)
      
      let progress = Float(currentIndex + 1) / Float(numberOfItems)
      view?.setProgressRingView(progress)
    } else {
      router.navigateToRegister()
    }
  }
  
  func onMoveToItem(at targetIndex: Int) {
    currentIndex = targetIndex
    let progress = Float(targetIndex + 1) / Float(onboardingViewModels.count)
    view?.setProgressRingView(progress)
  }
}
