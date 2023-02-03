//
//  LoginViewController.swift
//  FitnestX
//
//  Created by Quang Thanh on 05/12/2022.
//

import Foundation

final class LoginViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var registerLabel: RegisterLabel!
  @IBOutlet weak var getStartedButton: GradientButton!
  @IBOutlet weak var forgotPasswordLabel: UILabel!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
  
  @IBAction private func getStartedButtonDidTapped() {

  }
}
    
// MARK: - Private

private extension LoginViewController {
  func setupUI() {
    registerLabel.delegate = self
    forgotPasswordLabel.attributedText = NSAttributedString(
      string: "Forgot your password?",
      attributes:
        [
          .underlineStyle: NSUnderlineStyle.single.rawValue,
          .font: R.font.poppinsRegular(size: 12)!,
          .foregroundColor: R.color.grayADA4A5()!
        ]
    )
  }
}

// MARK: - TTTAttributedLabelDelegate

extension LoginViewController: TTTAttributedLabelDelegate {
  func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
    switch url.absoluteString {
    case RegisterLabelURL.registerLinkAction:
        if let navigationController = self.navigationController {
            let viewControllers = navigationController.viewControllers
            if viewControllers.contains(where: { $0 is RegisterViewController }) {
                let vc = viewControllers.first(where: { $0 is RegisterViewController })
                navigationController.popToViewController(vc!, animated: true)
            } else {
                let vc = RegisterViewController.makeMe()
                navigationController.pushViewController(vc, animated: true)
            }
        }
    default:
      break
    }
  }
}
