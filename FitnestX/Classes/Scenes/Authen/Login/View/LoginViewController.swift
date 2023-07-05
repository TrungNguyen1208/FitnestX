//
//  LoginViewController.swift
//  FitnestX
//
//  Created by Trung Nguyen on 05/07/2023.
//  
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    
}

final class LoginViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var emailTextField: FitnestTextField!
  @IBOutlet private weak var passwordTextField: FitnestPasswordTextField!
  @IBOutlet private weak var loginButton: GradientButton!
  @IBOutlet private weak var forgotPasswordLabel: UILabel!
  @IBOutlet private weak var registerLabel: RegisterLabel!
  
  // MARK: - Public Variable
  
  public var presenter: LoginPresenterProtocol!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    loginButton.setTitle(R.string.localizable.common_login.localized(), for: .normal)
    emailTextField.placeholder = R.string.localizable.common_email.localized()
    passwordTextField.placeholder = R.string.localizable.common_password.localized()
  }
  
  // MARK: - Action
  
  @IBAction private func loginButtonDidTapped() {
    presenter.onLoginButtonDidTap()
  }
  
  @IBAction private func googleButtonDidTapped() {
  }
  
  @IBAction private func facebookButtonDidTapped() {
  }
}

// MARK: - Private

private extension LoginViewController {
  func setupUI() {
    registerLabel.delegate = self
    forgotPasswordLabel.attributedText = NSAttributedString(
      string: R.string.localizable.login_forgot_pass.localized(),
      attributes: [
        .underlineStyle: NSUnderlineStyle.single.rawValue,
        .font: R.font.poppinsMedium(size: 12)!,
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
      presenter.onRegisterLabelDidTap()
    default:
      break
    }
  }
}

// MARK: - LoginViewControllerProtocol

extension LoginViewController: LoginViewProtocol {
  
}
