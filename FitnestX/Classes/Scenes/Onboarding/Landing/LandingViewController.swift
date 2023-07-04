import UIKit

final class LandingViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var getStartedButton: GradientButton!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
  
  // MARK: - Action
  
  @IBAction private func startButtonDidTap() {
    let vc = OnboardingBuilder.build()
    navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK: - Private

private extension LandingViewController {
  func setupUI() {
    
  }
}
