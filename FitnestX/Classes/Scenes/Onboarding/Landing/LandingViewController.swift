import UIKit

final class LandingViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var subtitleLabel: UILabel!
  @IBOutlet private weak var getStartedButton: GradientButton!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    subtitleLabel.text = R.string.localizable.landing_page_subtitle.localized()
    getStartedButton.setTitle(R.string.localizable.common_get_started.localized(), for: .normal)
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
