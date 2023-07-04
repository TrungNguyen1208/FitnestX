import UIKit

final class RegisterViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var termCheckBox: BEMCheckBox!
  @IBOutlet private weak var loginLabel: LoginLabel!
  
  // MARK: - Private Variable
  
  private lazy var presenter: RegisterPresenter = {
    let presenter = RegisterPresenter()
    presenter.view = self
    return presenter
  }()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
  
  @IBAction private func startButtonDidTap() {
    let vc = CompleteProfileViewController.makeMe()
    navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK: - Private

private extension RegisterViewController {
  func setupUI() {
    termCheckBox.boxType = .square
    loginLabel.delegate = self
  }
}

// MARK: - TTTAttributedLabelDelegate

extension RegisterViewController: TTTAttributedLabelDelegate {
  func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
    switch url.absoluteString {
    case LoginLabelURL.loginLinkAction:
      let vc = LoginViewController.makeMe()
      navigationController?.pushViewController(vc, animated: true)
    default:
      break
    }
  }
}

// MARK: - RegisterViewInput

extension RegisterViewController: RegisterViewInput {
  
}
