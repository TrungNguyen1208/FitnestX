//
//  RegisterViewController.swift
//  FitnestX
//
//  Created by Trung Nguyen on 04/07/2023.
//  
//

import UIKit

protocol RegisterViewProtocol: AnyObject {
    
}

final class RegisterViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var registerButton: GradientButton!
  @IBOutlet private weak var firstNameTextField: FitnestTextField!
  @IBOutlet private weak var passwordTextField: FitnestPasswordTextField!
  @IBOutlet private weak var emailTextField: FitnestTextField!
  @IBOutlet private weak var lastNameTextField: FitnestTextField!
  @IBOutlet private weak var termCheckBox: BEMCheckBox!
  @IBOutlet private weak var loginLabel: LoginLabel!
  
  // MARK: - Public Variable
  
  public var presenter: RegisterPresenterProtocol!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    registerButton.setTitle(R.string.localizable.common_get_started.localized(), for: .normal)
    firstNameTextField.placeholder = R.string.localizable.common_first_name.localized()
    lastNameTextField.placeholder = R.string.localizable.common_last_name.localized()
    emailTextField.placeholder = R.string.localizable.common_email.localized()
    passwordTextField.placeholder = R.string.localizable.common_password.localized()
  }
  
  @IBAction private func startButtonDidTap() {
    let firstName = firstNameTextField.text.orEmpty
    let lastName = lastNameTextField.text.orEmpty
    let email = emailTextField.text.orEmpty
    let password = passwordTextField.text.orEmpty
    let isCheckTerm = termCheckBox.on
    
    presenter.onGetStartButtonDidTap(firstName: firstName, lastName: lastName, email: email, password: password, isCheckTerm: isCheckTerm)
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
      presenter.onLoginLabelDidTap()
    default:
      break
    }
  }
}

// MARK: - RegisterViewControllerProtocol

extension RegisterViewController: RegisterViewProtocol {
  
}
