import Foundation

final class OnboardingData {
  public static let onboardingViewModels = [
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
}
