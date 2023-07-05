import UIKit

final class CompleteProfileViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var nextButton: GradientButton!
  @IBOutlet private weak var kgButton: GradientButton!
  @IBOutlet private weak var cmButton: GradientButton!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
  
  // MARK: - Action
  
  @IBAction private func nextButtonDidTapped() {
    let goalVC = YourGoalViewController.makeMe()
    navigationController?.pushViewController(goalVC, animated: true)
  }
}

// MARK: - Private

private extension CompleteProfileViewController {
  func setupUI() {
    
  }
}
